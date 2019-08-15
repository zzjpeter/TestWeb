//
//  ViewController.m
//  TestWeb
//
//  Created by zhuzhijia on 2019/8/15.
//  Copyright © 2019 zhuzhijia. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "JumpManager.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = NSStringFromClass([self class]);
    
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"webView delegate:%@",self.webView.delegate);
}

- (UIWebView *)webView
{
    if (!_webView) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        webView.delegate = self;
        _webView = webView;
    }
    return _webView;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType API_DEPRECATED("No longer supported.", ios(2.0, 12.0)){
    NSLog(@"webView delegate1:%@",self.webView.delegate);
    if ([request.URL.absoluteString containsString:@"newspage/data/landingpage"]) {
        
        [[JumpManager sharedManager] jumpToVC];
        
        return NO;
        
    }
    NSLog(@"%@##%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView API_DEPRECATED("No longer supported.", ios(2.0, 12.0))
{
    NSLog(@"%@##%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
- (void)webViewDidFinishLoad:(UIWebView *)webView API_DEPRECATED("No longer supported.", ios(2.0, 12.0)){
    NSLog(@"%@##%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error API_DEPRECATED("No longer supported.", ios(2.0, 12.0)){
    NSLog(@"%@##%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
