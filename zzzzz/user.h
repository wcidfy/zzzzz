//
//  user.h
//  zzzzz
//
//  Created by lxx on 16/1/1.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface user : NSObject
/**
 *  昵称
 */
@property(nonatomic,copy)NSString *name;
/**
 *  头像
 */
@property(nonatomic,strong)NSURL *profile_image_url;

@end
