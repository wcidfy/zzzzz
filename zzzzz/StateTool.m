//
//  StateTool.m
//  zzzzz
//
//  Created by lxx on 16/1/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "StateTool.h"
#import "HttpTool.h"
#import "state.h"
#import "accountTool.h"
#import "Accountmodel.h"
@implementation StateTool
+(void)newStatusWithSinceId:(NSString *)sinceID success :(void (^)(NSArray *statues))success failure :(void (^)(NSError *error))failuer
{
    NSMutableDictionary *para=[NSMutableDictionary dictionary];
//    有数据才需要下拉刷新
    if(sinceID)
    {
    
        para[@"since_id"]=sinceID;
    
    }
    para[@"access_token"]=[accountTool account].access_token;
    [HttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:para success:^(id responseObject) {
        
        
        //        转换成模型
        NSArray *dictArray= responseObject[@"statuses"];
        
        NSArray *states=(NSMutableArray *)[state objectArrayWithKeyValuesArray:dictArray];
        //        插入最新数据
        if (success) {
             success(states);
        }
       
        
    } failure:^(NSError *error) {
        if (failuer) {
            failuer(error);
        }
        
    }];




}


+(void)oldStatusWithMaxId:(NSString *)MaxID success :(void (^)(NSArray *statues))success failure :(void (^)(NSError *error))failuer
{
    NSMutableDictionary *para=[NSMutableDictionary dictionary];
    if (MaxID) {
        para[@"max_id"]=MaxID;
    }
    para[@"access_token"]=[accountTool account].access_token;
    [HttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:para success:^(id responseObject) {
         //        转换成模型
        NSArray *dictArray= responseObject[@"statuses"];
        
        NSArray *states=(NSMutableArray *)[state objectArrayWithKeyValuesArray:dictArray];
        //        插入最新数据
        if (success) {
            success(states);
        }
    } failure:^(NSError *error) {
        if (failuer) {
            failuer(error);
        }
    }];







}
@end
