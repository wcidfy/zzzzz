//
//  accountTool.m
//  zzzzz
//
//  Created by lxx on 15/12/31.
//  Copyright © 2015年 lxx. All rights reserved.
//

#import "accountTool.h"
#import "Accountmodel.h"
#import "HttpTool.h"
#import "AccountParam.h"
#import "MJExtension.h"
#define AccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]stringByAppendingPathComponent:@"account.date"]
#define Client_id @"1182224787"
#define Redirect_uri @"http://baidu.com"
#define Client_secret @"a1c391db9dd447194f5b338c6c1a2d5f"
#define Grant_type @"authorization_code"



@implementation accountTool
//类方法一般用静态变量代替成员属性
static Accountmodel *_account;
+(void)saveAccount:(Accountmodel *)account
{
[NSKeyedArchiver archiveRootObject:account toFile:AccountFileName];



}
+(Accountmodel *)account
{
    

    _account=[NSKeyedUnarchiver unarchiveObjectWithFile:AccountFileName];
    if (_account) {
        _account=[NSKeyedUnarchiver unarchiveObjectWithFile:AccountFileName];
        if([[NSDate date]compare:_account.expires_date]!=NSOrderedAscending)
        {
            return nil;
        }
    }
//    过期时间 ＝当前时间＋有效期
    return _account;
}
+(void)accoutWithCode:(NSString *)code success:(void (^)())success faiuler:(void (^)())faiuer
{
    AccountParam *param=[[AccountParam alloc]init];
    param.client_id=Client_id;
    param.code=code;
    param.client_secret=Client_secret;
    param.redirect_uri=Redirect_uri;
    param.grant_type=Grant_type;
    [HttpTool Post:@"https://api.weibo.com/oauth2/access_token" parameters:param.keyValues success:^(id responseObject) {
        Accountmodel *account=[Accountmodel accountDict:responseObject];
        [accountTool saveAccount:account];
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        if (faiuer) {
            faiuer(error);
        }
    }];
       


}

@end
