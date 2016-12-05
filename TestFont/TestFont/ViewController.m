//
//  ViewController.m
//  TestFont
//
//  Created by Shane on 16/7/7.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIFont *font = [UIFont fontWithName:@"MFYueHei_Noncommercial-Regular" size:20];
    
    self.testLabel.textColor = [UIColor blackColor];
//    self.testLabel.font = font;
    self.testLabel.text = @"花村";
}

- (NSAttributedString *)boldFont:(UIFont*)font strokeWidth:(float)width withAttributeText:(NSString*)string
{
    NSAttributedString *atbString = [[NSAttributedString alloc]
                                     initWithString:string
                                     attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,
                                                 [NSNumber numberWithFloat:width],NSStrokeWidthAttributeName, nil]];
    
    return atbString;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
