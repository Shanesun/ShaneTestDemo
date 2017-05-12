//
//  TestWebViewMemeryViewController.m
//  TestUIKit
//
//  Created by Shane on 2017/5/4.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "TestWebViewMemeryViewController.h"
#import <WebKit/WebKit.h>

#define kTestUrlStr @"http://192.168.31.125/testlargweb/index"

@interface TestWebViewMemeryViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *startRequestButton;

@property (strong, nonatomic) UIWebView *uiWebView;
@property (strong, nonatomic) WKWebView *wkWebView;

@end

@implementation TestWebViewMemeryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createWebView];
}

- (void)createWebView
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 40000);
    
    // UIWebView
    if (self.startRequestButton.tag == 0) {
        self.title = @"测试UIWebView";
        self.uiWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40000)];
        self.uiWebView.scalesPageToFit = YES;
        [self.scrollView addSubview:self.uiWebView];
        
    }// WKWebView
    else if (self.startRequestButton.tag == 1){
        self.title = @"测试WKWebView";
        WKWebViewConfiguration *webConfig = [WKWebViewConfiguration new];
        self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40000) configuration:webConfig];
        self.wkWebView.scrollView.zoomScale = 1.5;
        [self.scrollView addSubview:self.wkWebView];
    }// test wkwebview load resource
    else if (self.startRequestButton.tag == 2) {
        self.title = @"测试WKWebView加载资源";
        WKWebViewConfiguration *webConfig = [WKWebViewConfiguration new];
        self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:webConfig];
        [self.view addSubview:self.wkWebView];
        [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-40);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"--------- didReceiveMemoryWarning ----------");
}

-(void) dealloc
{
    if (self.uiWebView) {
        // 释放UIWebView资源
        [self.uiWebView loadHTMLString:@"" baseURL:nil];
        [self.uiWebView stopLoading];
        self.uiWebView.delegate = nil;
        [self.uiWebView removeFromSuperview];
        self.uiWebView = nil;
    }
    else if (self.wkWebView){
        
    }
}

- (IBAction)startRequestButtonClicked:(UIButton *)sender
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kTestUrlStr]];
    // uiwebview
    if (sender.tag == 0) {
        [self.uiWebView loadRequest:request];
    }// wkwebview
    else if (sender.tag == 1){
        [self.wkWebView loadRequest:request];
    }
    else if (sender.tag == 2) {
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"MP4.mp4" ofType:nil];
        NSURLRequest *sourceRequest = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:sourcePath]];
        [self.wkWebView loadRequest:sourceRequest];
        
        
    }
}

@end
