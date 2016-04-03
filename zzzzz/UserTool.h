//
//  UserTool.h
//  zzzzz
//
//  Created by lxx on 16/1/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserResult.h"
@interface UserTool : NSObject
/**
 *  请求用户未读数
 *
 *  @param success 成功
 *  @param failuer 失败
 */
+(void)UnReadWithSuccess:(void(^)(UserResult *result))success failuer:(void(^)(NSError *error))failuer;
@end
