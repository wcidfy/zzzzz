//
//  BaseParam.h
//  zzzzz
//
//  Created by lxx on 16/1/6.
//  Copyright © 2016年 lxx. All rights reserved.
//
/**
 *  基本参数模型
 */
#import <Foundation/Foundation.h>

@interface BaseParam : NSObject
@property(nonatomic,copy)NSString *access_token;
+(instancetype)param;


@end
