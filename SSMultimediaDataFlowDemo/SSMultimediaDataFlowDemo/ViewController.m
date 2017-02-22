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
#import "MoveFullTransition.h"

@interface ViewController ()<VideoCellPlayDelegate ,UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) MoveFullPresentTransition *presentTransition;

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
    videoVC.transitioningDelegate = self;
  
    
    self.presentTransition = [MoveFullPresentTransition shared];
    self.presentTransition.videoBackgroundView = playView;
    
    [self presentViewController:videoVC animated:YES completion:nil];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [MoveFullDismissTransition new];
}

@end
