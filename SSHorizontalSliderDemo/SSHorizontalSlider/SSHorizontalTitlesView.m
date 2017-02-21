//
//  SSHorizontalTitlesView.m
//  SSHorizontalSliderDemo
//
//  Created by Shane on 2017/2/20.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "SSHorizontalTitlesView.h"

static NSString * const tt = @"2";


@interface SSHorizontalTitlesView ()

@property (strong, nonatomic) UICollectionView *collectionView;

@end


@implementation SSHorizontalTitlesView

#pragma mark- life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    
  
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self configUI];
}

- (void)configUI
{
    
}




@end
