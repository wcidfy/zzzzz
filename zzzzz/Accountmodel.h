//
//  Accountmodel.h
//  zzzzz
//
//  Created by lxx on 15/12/31.
//  Copyright © 2015年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Accountmodel : NSObject<NSCoding>

@property(nonatomic,copy)NSString *access_token;
@property(nonatomic,copy)NSString *expires_in;
@property(nonatomic,copy)NSString *remind_in;
@property(nonatomic,copy)NSString *uid;
//过期时间
@property(nonatomic,strong)NSDate *expires_date;



+(instancetype)accountDict:(NSDictionary *)dict;
@end
