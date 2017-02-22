//
//  TestViewController.m
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/2/22.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "TestViewController.h"
#import "Masonry.h"

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet UIView *promatView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)buttonClicked:(id)sender {
 
    [self.promatView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(40);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
//    [self.promatView layoutIfNeeded];
    
    
    [self.promatView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(240);
        make.size.mas_equalTo(CGSizeMake(150, 150));
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.promatView.superview layoutIfNeeded];
    }];
    
}

@end
