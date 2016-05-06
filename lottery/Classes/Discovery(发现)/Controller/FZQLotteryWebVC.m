//
//  FZQDiscoveryWebViewController.m
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQLotteryWebVC.h"

@interface FZQLotteryWebVC () <UIWebViewDelegate>
@property(strong,nonatomic)UIWebView *webView;
@property (weak, nonatomic) UIActivityIndicatorView *activityView;
@end

@implementation FZQLotteryWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubView];
}

- (void) initSubView
{
    //设置背景底色，不然UIActivityIndicatorView无法显示
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.backgroundColor = BACKGROUPCOLOR;
    [self.view addSubview:_webView];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithFrame:self.view.bounds];
    _activityView = activityView;
    [self.view addSubview:_activityView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [_webView setHidden:YES];
    //[_webView loadHTMLString:_model.jumpUrl baseURL:nil];
    [_activityView startAnimating];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_webView setHidden:YES];
    [_activityView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_webView setHidden:NO];
    [self.activityView stopAnimating];
}

@end