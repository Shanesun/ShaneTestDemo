//
//  CompressImageViewController.m
//  SSImageProcessing
//
//  Created by Shane on 2017/5/2.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "CompressImageViewController.h"

@implementation CompressImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self imageInfo];
    
}

- (void)imageInfo
{
    UIImage *image = [UIImage imageNamed:@"testImage.jpg"];
    CGFloat width = CGImageGetWidth(image.CGImage);
    CGFloat height = CGImageGetHeight(image.CGImage);
    
    CGFloat kb = (width * height * 3)/1024.0;
    
    
    NSData *data = UIImageJPEGRepresentation(image, 1);
    NSData *data1 = UIImageJPEGRepresentation(image, 0.9);
    NSData *data2 = UIImageJPEGRepresentation(image, 0.5);
    NSData *data3 = UIImageJPEGRepresentation(image, 0);
    NSLog(@"size: %lu",(unsigned long)data.length);
}

@end
