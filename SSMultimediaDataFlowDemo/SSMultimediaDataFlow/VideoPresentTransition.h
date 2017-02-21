//
//  VideoPresentTransition.h
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/2/21.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"


@interface VideoPresentTransition : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithVideoView:(UIView *)videoView;

@end
