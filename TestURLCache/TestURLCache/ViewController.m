//
//  ViewController.m
//  TestURLCache
//
//  Created by Shane on 15/12/1.
//  Copyright © 2015年 Shane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *tmpPath;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    tmpPath = [paths firstObject];
   tmpPath = [tmpPath stringByAppendingPathComponent:@"tmpcache"];
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager createDirectoryAtPath:tmpPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSLog(@"%@",tmpPath);
  }
- (IBAction)netPressed:(id)sender {
    // 1.创建请求
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLCache *cache =[[NSURLCache alloc] initWithMemoryCapacity:4*1024*1024 diskCapacity:100*1024*1024 diskPath:tmpPath];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLResponse *response = [cache cachedResponseForRequest:request];
    cache.cach
    // 2.设置缓存策略(有缓存就用缓存，没有缓存就重新请求)
    request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    

    
    // 3.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            NSCachedURLResponse *tmp = [[NSCachedURLResponse alloc] initWithResponse:response data:data];
            [cache storeCachedResponse:tmp forRequest:request];
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"%@", data);
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
