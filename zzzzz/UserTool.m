//
//  UserTool.m
//  zzzzz
//
//  Created by lxx on 16/1/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "UserTool.h"
#import "HttpTool.h"
#import "UserResult.h"
#import "UserParam.h"
#import "accountTool.h"
#import "Accountmodel.h"
#import "MJExtension.h"
@implementation UserTool
+(void)UnReadWithSuccess:(void(^)(UserResult *result))success failuer:(void(^)(NSError *error))failuer
{
//    创建参数模型

    UserParam *param=[UserParam param];
    param.uid=[accountTool account].uid;
    [HttpTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:param.keyValues success:^(id responseObject) {
        
        UserResult *result=[UserResult objectWithKeyValues:responseObject];
        if (success) {
            success(result);
        }
        
    } failure:^(NSError *error) {
        if (failuer) {
            failuer(error);
        }
    }];


}
@end
