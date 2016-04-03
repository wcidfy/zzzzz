//
//  HttpTool.m
//  zzzzz
//
//  Created by lxx on 16/1/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
@implementation HttpTool
+(void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure
{
//    / 创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}
+(void )Post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure
{
    //    / 创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];




}
@end
