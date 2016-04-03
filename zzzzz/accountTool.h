//
//  accountTool.h
//  zzzzz
//
//  Created by lxx on 15/12/31.
//  Copyright © 2015年 lxx. All rights reserved.
//  专门处理帐号存储读取

#import <Foundation/Foundation.h>
@class Accountmodel;
@interface accountTool : NSObject
+(void)saveAccount:(Accountmodel *)account;
+(Accountmodel *)account;
+(void)accoutWithCode:(NSString *)code success:(void (^)())success faiuler:(void (^)())faiuer;
@end
