//
//  BusRecommendDetailWebContentView.h
//  Bus
//
//  Created by Shane on 2017/5/12.
//  Copyright © 2017年 anzogame. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BusRecommendDetailWebContentViewDelegate <NSObject>

- (void)didChangeWebContentSize:(CGSize)size;

@end

@interface BusRecommendDetailWebContentView : UIView

- (instancetype)initWithWebSourceCode:(NSString *)webSourceCode
                             delegate:(id<BusRecommendDetailWebContentViewDelegate>)deledgate;

- (void)startRequest;

@end
