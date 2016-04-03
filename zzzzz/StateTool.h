//
//  StateTool.h
//  zzzzz
//
//  Created by lxx on 16/1/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateTool : NSObject
/**
 *  获取最新微博
 *
 *  @param sinceID 大于sinceID 的微博
 *  @param success <#success description#>
 *  @param failuer <#failuer description#>
 */
+(void)newStatusWithSinceId:(NSString *)sinceID success :(void (^)(NSArray *statues))success failure :(void (^)(NSError *error))failuer;

+(void)oldStatusWithMaxId:(NSString *)MaxID success :(void (^)(NSArray *statues))success failure :(void (^)(NSError *error))failuer;


@end
