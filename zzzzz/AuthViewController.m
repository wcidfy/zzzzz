//
//  AuthViewController.m
//  zzzzz
//
//  Created by lxx on 15/12/29.
//  Copyright © 2015年 lxx. All rights reserved.
//

#import "AuthViewController.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "Accountmodel.h"
#import "accountTool.h"
#import "CZRootTool.h"
#define  authBaseUrl @"https://api.weibo.com/oauth2/authorize"

#define CZKeyWindow [UIApplication sharedApplication].keyWindow


@interface AuthViewController ()<UIWebViewDelegate>

@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    展示登录网页－》webview
    UIWebView *webView=[[UIWebView alloc]initWithFrame:self.view.bounds];

    [self.view addSubview:webView];
    NSString *bastUrl=@"https://api.weibo.com/oauth2/authorize";
    NSString *client_id=@"1182224787";
    NSString *redirect_uri=@"http://baidu.com";
    NSString *urlStr=[NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",bastUrl,client_id,redirect_uri];
//    创建url
    NSURL *url=[NSURL URLWithString:urlStr];
//    创建请求
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
//    加载请求
    [webView loadRequest:request];
    webView.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{

    [MBProgressHUD showMessage:@"加载中。。。"];

}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];


}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{


    [MBProgressHUD hideHUD];


}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr=request.URL.absoluteString;
    NSLog(@"_______%@",urlStr);

   
    NSRange range=[urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *code=[urlStr substringFromIndex:range.location+range.length];
         NSLog(@"_______%@",code);
        [self AccessTokenWithCode:code];
//        不加载回调
        return NO;
    }
    return YES;

}

-(void)AccessTokenWithCode:(NSString *)code
{
//    发送post请求
   [accountTool accoutWithCode:code success:^{
       [CZRootTool chooseRootViewController:CZKeyWindow];
       } faiuler:^{
      
       }];
}


@end
