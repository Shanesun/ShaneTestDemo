//
//  VideoPresentTransition.m
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/2/21.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "MoveFullTransition.h"
#import "SSVideoViewController.h"

static CGFloat const kSpringDamping = 0.9;
static CGFloat const kTransitionDuration = 0.4;

@interface MoveFullPresentTransition ()

@property (strong, nonatomic) UIView *orginVideobackView;
@property (strong, nonatomic) UIView *transitionVideobackView;

@property (assign, nonatomic) CGRect playViewFrame;

@end

@implementation MoveFullPresentTransition

+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    static MoveFullPresentTransition *present = nil;
    dispatch_once(&onceToken, ^{
        present = [super new];
    });
    
    return present;
}

- (void)setVideoBackgroundView:(UIView *)videoBackgroundView
{
    _videoBackgroundView = videoBackgroundView;
}

+ (CGSize)orignPlayerViewSize
{
    MoveFullPresentTransition *present = [self shared];
    return present.orginVideobackView.frame.size;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return kTransitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    SSVideoViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // 1 toVC
    [[transitionContext containerView] addSubview:toVC.view];
    toVC.view.backgroundColor = [UIColor clearColor];
    toVC.backgroundView.alpha = 0;
    
    
    self.playViewFrame = [self.videoBackgroundView.superview convertRect:self.videoBackgroundView.frame toView:fromVC.view];
    
    // 2 使用 view 保存 contstrains和superView
    self.orginVideobackView = [UIView new];
    self.orginVideobackView.backgroundColor = [UIColor blueColor];
    [self.videoBackgroundView.superview addSubview:self.orginVideobackView];
    [self.orginVideobackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.videoBackgroundView.frame.origin.x);
        make.top.mas_equalTo(self.videoBackgroundView.frame.origin.y);
        make.size.mas_equalTo(self.videoBackgroundView.frame.size);
    }];
    
    self.transitionVideobackView = self.videoBackgroundView;
    [toVC.view addSubview:self.transitionVideobackView];
    [self.transitionVideobackView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.playViewFrame.origin.x);
        make.top.mas_equalTo(self.playViewFrame.origin.y);
        make.size.mas_equalTo(self.playViewFrame.size);
    }];
    toVC.playerView = self.transitionVideobackView;
    [self.transitionVideobackView.superview layoutIfNeeded];
    
    // 3 全屏 位置
    [self.transitionVideobackView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(toVC.view);
        make.leading.greaterThanOrEqualTo(toVC.view);
        make.trailing.lessThanOrEqualTo(toVC.view);
        make.top.greaterThanOrEqualTo(toVC.view);
        make.bottom.lessThanOrEqualTo(toVC.view);
    }];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:kSpringDamping initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.backgroundView.alpha = 1;
        [self.transitionVideobackView.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

@end

@interface MoveFullDismissTransition ()

@end

@implementation MoveFullDismissTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return kTransitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    SSVideoViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    UIView *playerView = fromVC.playerView;
    
    CGRect tmpRect = [playerView.superview convertRect:playerView.frame toView:fromVC.view];
    
    [toVC.view addSubview:playerView];
    [playerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(tmpRect.origin.x);
        make.top.mas_equalTo(tmpRect.origin.y);
        make.size.mas_equalTo(tmpRect.size);
    }];
    
    [playerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo([MoveFullPresentTransition shared].playViewFrame.origin.x);
        make.top.mas_equalTo([MoveFullPresentTransition shared].playViewFrame.origin.y);
        make.size.mas_equalTo([MoveFullPresentTransition shared].playViewFrame.size);
    }];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:kSpringDamping initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        fromVC.backgroundView.alpha = 0;
        [playerView.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
        [[MoveFullPresentTransition shared].orginVideobackView.superview addSubview:playerView];
        [playerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo([MoveFullPresentTransition shared].orginVideobackView.frame.origin.x);
            make.top.mas_equalTo([MoveFullPresentTransition shared].orginVideobackView.frame.origin.y);
            make.size.mas_equalTo([MoveFullPresentTransition shared].orginVideobackView.frame.size);
        }];
        [playerView.superview layoutIfNeeded];
        
        [[MoveFullPresentTransition shared].orginVideobackView removeFromSuperview];
        
        [transitionContext completeTransition:YES];
    }];
}


@end
