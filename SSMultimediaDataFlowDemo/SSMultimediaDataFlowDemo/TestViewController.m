//
//  TestViewController.m
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/2/22.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "TestViewController.h"
#import "Masonry.h"
#import <AVFoundation/AVFoundation.h>

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mp4ImageView;

@property (strong, nonatomic) AVPlayerLayer *playerLayer;
@property (strong, nonatomic) AVPlayer *player;
@property (assign, nonatomic) BOOL muted;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient withOptions:0 error:nil];
}

- (void)setMuted:(BOOL)muted {
    if (!muted) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient withOptions:0 error:nil];
    }
    
    self.player.muted = muted;
}

- (IBAction)buttonClicked:(id)sender {
    if (self.player.status == AVPlayerStatusReadyToPlay) {
        self.muted = YES;
        [self.player play];
    }
    else{
        self.player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://172.16.0.211/l"]];
        
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.playerLayer.frame = self.mp4ImageView.bounds;
        [self.mp4ImageView.layer addSublayer:self.playerLayer];
        
        self.muted = YES;
        [self.player play];
    }

}
- (IBAction)pauseButtonClicked:(id)sender {
     [self.player pause];
}

@end
