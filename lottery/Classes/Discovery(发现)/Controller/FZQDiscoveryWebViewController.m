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


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    //[_webView loadHTMLString:_model.jumpUrl baseURL:nil];
}



@end
