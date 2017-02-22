//
//  MoveFullTransition.h
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/2/21.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"


@interface MoveFullPresentTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (strong, nonatomic) UIView *videoBackgroundView;

+ (instancetype)shared;
+ (CGSize)orignPlayerViewSize;

@end

@interface MoveFullDismissTransition : NSObject <UIViewControllerAnimatedTransitioning>


@end
