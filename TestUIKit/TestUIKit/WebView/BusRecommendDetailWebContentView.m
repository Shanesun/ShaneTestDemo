//
//  BusRecommendDetailWebContentView.m
//  Bus
//
//  Created by Shane on 2017/5/12.
//  Copyright © 2017年 anzogame. All rights reserved.
//

#import "BusRecommendDetailWebContentView.h"
#import "Masonry.h"
#import <WebKit/WebKit.h>

@interface BusRecommendDetailWebContentView ()<WKNavigationDelegate>

@property (strong, nonatomic) NSString *h5Code;
@property (strong, nonatomic) WKWebView *webView;

@property (weak, nonatomic) id<BusRecommendDetailWebContentViewDelegate> deledgate;
@end

@implementation BusRecommendDetailWebContentView

- (instancetype)initWithWebSourceCode:(NSString *)webSourceCode
                             delegate:(id<BusRecommendDetailWebContentViewDelegate>)deledgate;
{
    self = [super init];
    if (self) {
        self.h5Code = webSourceCode;
        self.deledgate = deledgate;
        [self configUI];
    }
    return self;
}

- (void)dealloc
{
    [self.webView.scrollView removeObserver:self forKeyPath:@"contentSize" context:nil];
}

- (void)addWebViewHeightObserver {
    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew  context:nil];
}

- (void)configUI
{
    WKWebViewConfiguration *config = [WKWebViewConfiguration new];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
    self.webView.navigationDelegate = self;
    [self addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self addWebViewHeightObserver];
}

- (void)startRequest
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.kuaishangche.cc/3132420350766506728"]]];
//    [self.webView loadHTMLString:self.h5Code baseURL:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (object == self.webView.scrollView && [keyPath isEqual:@"contentSize"]) {
        
//        NSValue *oldSize = [change objectForKey:NSKeyValueChangeOldKey];
//        NSValue *newSize = [change objectForKey:NSKeyValueChangeNewKey];
//        if (CGSizeEqualToSize([oldSize CGSizeValue], [newSize CGSizeValue])) {
//            return;
//        }
  
        if ([self.deledgate respondsToSelector:@selector(didChangeWebContentSize:)]) {
//            [self.deledgate didChangeWebContentSize:[newSize CGSizeValue]];
        }
        NSLog(@"New contentSize: %f x %f", self.webView.scrollView.contentSize.width, self.webView.scrollView.contentSize.height);
    }
}

@end
