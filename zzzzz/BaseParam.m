//
//  BaseParam.m
//  zzzzz
//
//  Created by lxx on 16/1/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "BaseParam.h"
#import "Accountmodel.h"
#import "accountTool.h"
@implementation BaseParam
+(instancetype)param
{
    BaseParam *param=[[self alloc]init ];
    param.access_token=[accountTool account].access_token;
    return param;


}
@end
