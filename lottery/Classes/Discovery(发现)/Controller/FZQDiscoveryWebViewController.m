//
//  FZQDiscoveryWebViewController.m
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQDiscoveryWebViewController.h"

@interface FZQDiscoveryWebViewController ()
@property(strong,nonatomic)UIWebView *webView;
@end

@implementation FZQDiscoveryWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubView];
    
}

- (void) initSubView
{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    //_webView.scrollView.delegate = self;
    _webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSURL *url = [NSURL URLWithString:_model.jumpUrl];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    //[_webView loadHTMLString:_model.jumpUrl baseURL:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
