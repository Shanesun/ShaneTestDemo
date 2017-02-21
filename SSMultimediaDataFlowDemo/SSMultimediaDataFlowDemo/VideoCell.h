//
//  VideoCell.h
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/2/21.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoCell;

@protocol VideoCellPlayDelegate <NSObject>

- (void)videoCell:(VideoCell *)videoCell playView:(UIView *)playView playStatu:(int)playStatu;

@end

@interface VideoCell : UITableViewCell

@property (weak, nonatomic) id<VideoCellPlayDelegate> delegate;

@end
