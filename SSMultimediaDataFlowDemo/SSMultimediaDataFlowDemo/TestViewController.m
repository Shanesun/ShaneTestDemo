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
//    if (self.player.status == AVPlayerStatusReadyToPlay) {
//        self.muted = YES;
//        [self.player play];
//    }
//    else{
//        AVAsset *asset = [AVAsset assetWithURL:[NSURL URLWithString:@"http://video.cdn.kuaishangche.cc/fastbus/ce8bfe4bc8d8e47e98517587bf71a57c.mp4"]];
//        
//        NSArray *tracks = [asset tracksWithMediaType:AVMediaTypeVideo];
//        if (tracks.count == 0) return;
//        AVAssetTrack *videoTrack = [tracks objectAtIndex:0];
//        if ((int)videoTrack.naturalSize.width % 2 != 0) {
//            
//        }
//        
//        AVMutableVideoComposition *MainCompositionInst = [AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:asset];
////        
//        if ((int)MainCompositionInst.renderSize.width % 2 != 0){
//            MainCompositionInst.renderSize = CGSizeMake(MainCompositionInst.renderSize.width+1, MainCompositionInst.renderSize.height+1);
//        }
//        
// 
//        AVMutableComposition *composition = [AVMutableComposition composition];
//        AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:composition];
//        item.videoComposition = MainCompositionInst;
        //@"http://video.cdn.kuaishangche.cc/fastbus/ce8bfe4bc8d8e47e98517587bf71a57c.mp4"
        self.player = [[AVPlayer alloc] initWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"yy.mp4" ofType:nil]]];
        
        
        
        
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        self.playerLayer.frame = CGRectMake(0, 0, 247, 247);
        [self.mp4ImageView.layer addSublayer:self.playerLayer];
        
        self.muted = YES;
        [self.player play];
//    }

}
- (IBAction)pauseButtonClicked:(id)sender {
     [self.player pause];
}

@end
