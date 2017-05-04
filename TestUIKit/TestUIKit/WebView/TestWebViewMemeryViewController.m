//
//  TestWebViewMemeryViewController.m
//  TestUIKit
//
//  Created by Shane on 2017/5/4.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "TestWebViewMemeryViewController.h"
#import <WebKit/WebKit.h>

@interface TestWebViewMemeryViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *startRequestButton;

@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) WKWebView *wkWebView;

@end

@implementation TestWebViewMemeryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UIWebView
    if (self.startRequestButton.tag == 0) {
        
    }// WKWebView
    else if (self.startRequestButton.tag == 1){
        WKWebViewConfiguration *webConfig = [WKWebViewConfiguration new];
        self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10000) configuration:webConfig];
        self.wkWebView.UIDelegate = self;
        [self.scrollView addSubview:self.wkWebView];
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 10000);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"--------- didReceiveMemoryWarning ----------");
}

- (IBAction)startRequestButtonClicked:(UIButton *)sender {
}

@end
