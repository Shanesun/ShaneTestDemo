//
//  VideoCell.m
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/2/21.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "VideoCell.h"

@interface VideoCell ()

@property (weak, nonatomic) IBOutlet UIView *playView;

@end

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)playVideoButtonClicked:(UIButton *)sender
{

    if (self.delegate && [self.delegate respondsToSelector:@selector(videoCell:playView:playStatu:)]) {
        [self.delegate videoCell:self playView:self.playView playStatu:0];
    }

}


@end
