//
//  Accountmodel.m
//  zzzzz
//
//  Created by lxx on 15/12/31.
//  Copyright © 2015年 lxx. All rights reserved.
//

#import "Accountmodel.h"
#define  accoutTokenKey @"token"
#define  accoutUidKey @"uid"
#define  accoutExpires_inKey @"expires_in"
#define  accoutExpires_dateKey @"expires_date"


@implementation Accountmodel
+(instancetype)accountDict:(NSDictionary *)dict
{
    
    Accountmodel *account=[[self alloc]init];
    [account setValuesForKeysWithDictionary:dict];


    return account;

}
-(void)setExpires_in:(NSString *)expires_in
{

    _expires_in=expires_in;
//    计算过期时间 当前时间＋有效期
    _expires_date=[NSDate dateWithTimeIntervalSinceNow:[_expires_in longLongValue]];





}
//那些属性需要归档  如何归档
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:accoutTokenKey];
    [aCoder encodeObject:_expires_in forKey:accoutExpires_inKey];
    [aCoder encodeObject:_uid forKey:accoutUidKey];
    [aCoder encodeObject:_expires_date forKey:accoutExpires_dateKey];




}
//解档调用
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self=[super init])
    {
        _access_token=[aDecoder decodeObjectForKey:accoutTokenKey];
        _uid=[aDecoder decodeObjectForKey:accoutUidKey];
        _expires_in=[aDecoder decodeObjectForKey:accoutExpires_inKey];
        _expires_date=[aDecoder decodeObjectForKey:accoutExpires_dateKey];

    
    
    }

    return self;

}
@end
