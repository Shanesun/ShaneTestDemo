//
//  ViewController.m
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/2/21.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "ViewController.h"
#import "SSVideoViewController.h"
#import "VideoCell.h"
#import "VideoPresentTransition.h"

@interface ViewController ()<VideoCellPlayDelegate ,UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)VideoPresentTransition *presentTransition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.tableView registerNib:[UINib nibWithNibName:@"VideoCell" bundle:nil] forCellReuseIdentifier:@"VideoCell"];
    self.tableView.rowHeight = 200;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    cell.delegate = self;
    
    return cell;
}

- (void)videoCell:(VideoCell *)videoCell playView:(UIView *)playView playStatu:(int)playStatu
{
    SSVideoViewController *videoVC = [[SSVideoViewController alloc] init];
//    videoVC.modalPresentationStyle = UIModalPresentationCustom;
    videoVC.transitioningDelegate = self;
    
    CGRect playViewFrame = [videoCell convertRect:playView.frame toView:self.view];
    
    UIView *newView = [UIView new];
    newView.frame = playViewFrame;
    newView.backgroundColor = [UIColor blueColor];
    UIImageView *videoPlayer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lena512.jpg"]];
    videoPlayer.contentMode = UIViewContentModeScaleAspectFit;
    [newView addSubview:videoPlayer];
    [videoPlayer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.bottom.trailing.equalTo(newView);
    }];
    
    self.presentTransition = [[VideoPresentTransition alloc] initWithVideoView:newView];
    
    [self presentViewController:videoVC animated:YES completion:nil];
    
    
    
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentTransition;
}


@end
