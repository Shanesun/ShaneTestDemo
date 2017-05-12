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

@interface BusRecommendDetailWebContentView ()

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation BusRecommendDetailWebContentView

- (instancetype)initWithWebSourceCode:(NSString *)webSourceCode
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}


- (void)configUI
{
    WKWebViewConfiguration *config = [WKWebViewConfiguration new];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
    [self addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end
