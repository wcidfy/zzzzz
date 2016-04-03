//
//  state.m
//  zzzzz
//
//  Created by lxx on 16/1/1.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "state.h"
#import "photo.h"
@implementation state
//自动吧数组中字典 转换成对的模型
+(NSDictionary *)objectClassInArray
{

    return @{@"pic_urls":[photo class]};



}
@end
