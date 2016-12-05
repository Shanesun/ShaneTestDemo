//
//  ViewController.m
//  TestHttps
//
//  Created by Shane on 16/9/6.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSURL *url = [NSURL URLWithString:@"https://esportsapp.zhangyoubao.com"];//@"https://kyfw.12306.cn/otn/leftTicket/init"];
//        NSURL *url = [NSURL URLWithString:@"https://www.apple.com/"];
//        NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    [task resume];
}

#pragma mark - NSURLSessionDataDelegate

// // 只要访问的是HTTPS的路径就会调用
// // 该方法的作用就是处理服务器返回的证书, 需要在该方法中告诉系统是否需要安装服务器返回的证书
// // NSURLAuthenticationChallenge : 授权质问
// //+ 受保护空间
// //+ 服务器返回的证书类型
// - (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
// {
// //    NSLog(@"didReceiveChallenge");
// //    NSLog(@"%@", challenge.protectionSpace.authenticationMethod);
// 
// // 1.从服务器返回的受保护空间中拿到证书的类型
// // 2.判断服务器返回的证书是否是服务器信任的
// if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
// NSLog(@"是服务器信任的证书");
// // 3.根据服务器返回的受保护空间创建一个证书
// //         void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *)
// //         代理方法的completionHandler block接收两个参数:
// //         第一个参数: 代表如何处理证书
// //         第二个参数: 代表需要处理哪个证书
// //创建证书
// NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
// // 4.安装证书
//     completionHandler(NSURLSessionAuthChallengeUseCredential , credential);
// }
// }

- (void)URLSession:(NSURLSession *)session
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler
{
    //AFNetworking中的处理方式
    NSURLSessionAuthChallengeDisposition disposition = NSURLSessionAuthChallengePerformDefaultHandling;
    __block NSURLCredential *credential = nil;
    //判断服务器返回的证书是否是服务器信任的
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        /*disposition：如何处理证书
         NSURLSessionAuthChallengePerformDefaultHandling:默认方式处理
         NSURLSessionAuthChallengeUseCredential：使用指定的证书    NSURLSessionAuthChallengeCancelAuthenticationChallenge：取消请求
         */
        if (credential) {
            disposition = NSURLSessionAuthChallengeUseCredential;
        } else {
            disposition = NSURLSessionAuthChallengePerformDefaultHandling;
        }
    } else {
        disposition = NSURLSessionAuthChallengeCancelAuthenticationChallenge;
    }
    //安装证书
    if (completionHandler) {
        completionHandler(disposition, credential);
    }
}
// 接收到服务器的响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    NSLog(@"didReceiveResponse");
    completionHandler(NSURLSessionResponseAllow);
}
// 接收到服务器返回的数据
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSLog(@"didReceiveData");
}
// 请求完毕
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"didCompleteWithError");
}

@end
