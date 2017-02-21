//
//  VideoPresentTransition.m
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/2/21.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "VideoPresentTransition.h"
#import "SSVideoViewController.h"

@interface VideoPresentTransition ()

@property (strong, nonatomic) UIView *videoView;

@end

@implementation VideoPresentTransition

- (instancetype)initWithVideoView:(UIView *)videoView
{
    self = [super init];
    if (self) {
        _videoView = videoView;
    }
    return self;
}


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    SSVideoViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [fromVC.view addSubview:self.videoView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        self.videoView.center = fromVC.view.center;
    } completion:^(BOOL finished) {
         [[transitionContext containerView] addSubview:toVC.view];
        toVC.view.backgroundColor = [UIColor clearColor];
        toVC.backgroundView.alpha = 0;
        [toVC.view addSubview:self.videoView];
        
        [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(toVC.view);
            make.leading.greaterThanOrEqualTo(toVC.view);
            make.trailing.lessThanOrEqualTo(toVC.view);
            make.top.greaterThanOrEqualTo(toVC.view);
            make.bottom.lessThanOrEqualTo(toVC.view);
        }];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            toVC.backgroundView.alpha = 1;
            [self.videoView layoutIfNeeded];
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }];
}

@end
