//
//  UserResult.h
//  zzzzz
//
//  Created by lxx on 16/1/6.
//  Copyright © 2016年 lxx. All rights reserved.
// 未读信息返回参数模型

#import <Foundation/Foundation.h>

@interface UserResult : NSObject
/**
 *  新浪微博未读数
 */
@property(nonatomic,assign)int status;
/**
 *  新粉丝数
 */
@property(nonatomic,assign)int follower;
/**
 *  新评论数
 */
@property(nonatomic,assign)int cmt;
/**
 *  新私信数
 */
@property(nonatomic,assign)int dm;
/**
 *  新提及我的微博数
 */
@property(nonatomic,assign)int mention_status;
/**
 *  新提及我的评论数
 */
@property(nonatomic,assign)int mention_cmt;
/**
 *  消息的总和
 *
 *  @return 消息总和
 */
-(int)messageCount;
/**
 *   应用未读消息总和
 *
 *
 */
-(int)totolCount;
@end
