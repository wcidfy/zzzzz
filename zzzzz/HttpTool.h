//
//  HttpTool.h
//  zzzzz
//
//  Created by lxx on 16/1/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject
/**
 *  发送get请求
 *
 *  @param URLString  请求Url
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+(void )GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success
      failure:(void (^)(NSError *error))failure;
/**
 *  发送Post请求
 *
 *  @param URLString  请求Url
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+(void )Post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;


@end
