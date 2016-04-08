//
//  FZQNewFeatureViewController.m
//  lottery
//
//  Created by IMAC on 16/4/1.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQNewFeatureViewController.h"

#import "FZQNewFeature.h"

#import "FZQTabBarController.h"

@interface FZQNewFeatureViewController ()

/** items */
@property (nonatomic, copy) NSArray * items;
/** 图片控件 */
@property (nonatomic, weak) UIImageView * iconView;
/** 大文本图片控件 */
@property (nonatomic, weak) UIImageView * largeTextView;
/** 小文本图片控件 */
@property (nonatomic, weak) UIImageView * smallTextView;
/** 体验按钮 */
@property (nonatomic, weak) UIButton * startBtn;
/** 上一个页面页码 */
@property (nonatomic, assign) CGFloat lastOffentX;

@end

@implementation FZQNewFeatureViewController

#pragma mark - lazy load
-(NSArray *)items
{
    if (!_items) {
        
        //生成临时可变数组
        NSMutableArray *tempArr = [NSMutableArray array];
        
        //加载plist中的数组
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"FZQNewFeature.plist" ofType:nil]];
        
        //字典转模型
        for (NSDictionary *dict in arr) {
            [tempArr addObject:[FZQNewFeature newFeatureWithDict:dict]];
        }
        _items = tempArr;
    }
    return _items;
}

-(UIButton *)startBtn
{
    if (!_startBtn) {
        //生成按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //设置图片
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        //设置尺寸
        [btn sizeToFit];
        
        //设置位置
        btn.center = CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.9);

        //设置方法
        [btn addTarget:self action:@selector(skip) forControlEvents:UIControlEventTouchUpInside];
        
        //设置成员属性
        _startBtn = btn;
    
        //加入控件
        [self.collectionView addSubview:btn];
        
    }
    return _startBtn;
}

#pragma mark - skip
/* 跳转 */
- (void)skip
{
    //切换根控制器
    KEYWINDOW.rootViewController = [[FZQTabBarController alloc]init];
    
    //转场动画
    CATransition *anim = [CATransition animation];
    anim.type = @"rippleEffect";
    anim.duration = 1.0;
    [KEYWINDOW.layer addAnimation:anim forKey:nil];
}

#pragma mark - life cycle

static NSString * const reuseIdentifier = @"newFeature";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 初始化collectionView */
    [self setUpClt];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

//初始化
-(instancetype)init
{
    /** 生成流水布局 */
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    
    //设置属性
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    flow.itemSize= [UIScreen mainScreen].bounds.size;
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向
    
    //返回根据流水布局创建的控制器
    return [super initWithCollectionViewLayout:flow];
}

/** 初始化collectionView */
-(void)setUpClt
{  
    // 注意:  self.collectionView != self.view
    //设置不能够穿透滚动
    self.collectionView.bounces = NO;
    
    //隐藏滚动条
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    //设置分页
    self.collectionView.pagingEnabled = YES;
    
    /** 设置引导线 */
    [self setUpGuideLineView];
    
    /** 初始化引导图片控件 */
    [self setUpAllChildView:0];
}

/** 设置引导线 */
-(void)setUpGuideLineView
{   
    //加入引导线
    UIImageView *guideLineView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLineView];
    
    //设置引导线位置
    guideLineView.transform = CGAffineTransformMakeTranslation(-25, 20);
}

/** 初始化一组引导图片控件 */
-(void)setUpAllChildView:(NSInteger )index
{   
    //获取items中模型
    FZQNewFeature *item = self.items[index];
    
    /** 初始化引导图片控件 */
    //图标控件
    UIImageView *iconView = [[UIImageView alloc]initWithImage:item.icon];
    [self.collectionView addSubview:iconView];
    self.iconView = iconView;
    
    //大文本控件
    UIImageView *largeTextView = [[UIImageView alloc]initWithImage:item.largeTextImage];
    [self.collectionView addSubview:largeTextView];
    self.largeTextView = largeTextView;
    
    //小文本控件
    UIImageView *smallTextView = [[UIImageView alloc]initWithImage:item.smallTextImage];
    [self.collectionView addSubview:smallTextView];
    self.smallTextView = smallTextView;
    
    //位置
    iconView.center = CGPointMake(SCREEN_WIDTH * (index + 0.5), SCREEN_HEIGHT * 0.4);//图标控件
    largeTextView.center = CGPointMake(SCREEN_WIDTH * (index + 0.5), SCREEN_HEIGHT * 0.8);//大文本控件
    smallTextView.center = CGPointMake(SCREEN_WIDTH * (index + 0.5), SCREEN_HEIGHT * 0.85);//小文本控件
}

#pragma mark - <UIScrollViewDelegate>
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取偏移量
    CGFloat offentX      = scrollView.contentOffset.x;
    
    //计算偏移差
    CGFloat balance = offentX - self.lastOffentX;
    
    //没有转换界面直接结束
    if (balance == 0) return;
    
    //计算当前页面是第几个页面
    NSInteger index     = offentX / SCREEN_WIDTH;
    
    //重新设置引导图片控件
    FZQNewFeature *item = self.items[index];
    self.iconView.image = item.icon;
    self.largeTextView.image = item.largeTextImage;
    self.smallTextView.image = item.smallTextImage;
    
    //体验按钮
    //判断是否是最后一个界面
    if (index == (self.items.count - 1))
    {
        //不隐藏
        self.startBtn.hidden = NO;
    }else
    {
        //隐藏
        self.startBtn.hidden = YES;
    }
    
    //跳转新界面保存数据
    self.lastOffentX = offentX;
    
    /* 飞入动画 */
    [self animation:balance];
}

/* 飞入动画 */
- (void)animation:(CGFloat)balance
{
    //设置动画效果
    //让控件预偏移多一个屏幕宽度
    self.iconView.transform      = CGAffineTransformTranslate(self.iconView.transform, 2 * balance, 0);
    
    self.largeTextView.transform = CGAffineTransformTranslate(self.largeTextView.transform, 2 * balance, 0);
    
    self.smallTextView.transform = CGAffineTransformTranslate(self.smallTextView.transform, 2 * balance, 0);
    self.startBtn.transform = CGAffineTransformTranslate(self.startBtn.transform, 2 * balance, 0);
    
//    self.iconView.x += balance;
    //实现控件转入屏幕的效果
    [UIView animateWithDuration:.3 animations:^{
        self.iconView.transform      = CGAffineTransformTranslate(self.iconView.transform, -balance, 0);
//    self.iconView.x -= balance;
        self.largeTextView.transform = CGAffineTransformTranslate(self.largeTextView.transform, -balance, 0);
        
        self.smallTextView.transform = CGAffineTransformTranslate(self.smallTextView.transform, -balance, 0);
        
        self.startBtn.transform = CGAffineTransformTranslate(self.startBtn.transform, -balance, 0);
    }];
}

#pragma mark <UICollectionViewDataSource>
//返回item数目
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.items.count;
}

//设置每一块的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //从缓存中获取cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //获取数组内容
    FZQNewFeature *item = self.items[indexPath.item];
    
    //设置图片
    UIImageView *imgView = [[UIImageView alloc]initWithImage:item.backgroundIcon];
    
    //设置cell的背景图片
    cell.backgroundView = imgView;  
    
//    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
//    
//    cell.image = [UIImage imageNamed:imageName];
    
    return cell;
}

@end
