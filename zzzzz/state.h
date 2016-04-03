//
//  state.h
//  zzzzz
//
//  Created by lxx on 16/1/1.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "user.h"
#import "MJExtension.h"
/*
created_at	string	微博创建时间
 idstr	string	字符串型的微博ID
 text	string	微博信息内容
 source	string	微博来源
 user	object	微博作者的用户信息字段 详细
 retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回 详细
 reposts_count	int	转发数
 comments_count	int	评论数
 attitudes_count	int	表态数
 pic_ids	object	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段
 */

@interface state : NSObject<MJKeyValue>
/**
 *  转发微博模型
 */
@property(nonatomic,strong)state *retweeted_status;
/**
 *  转发微博昵称
 */
@property (nonatomic, copy) NSString *retweetName;
/**
 *  用户模型
 */
@property(nonatomic,strong)user *user;
/**
 *  微博创建时间
 */
@property(nonatomic,copy)NSString *created_at;
/**
 *  字符串型的微博ID
 */
@property(nonatomic,copy)NSString *idstr;
/**
 *  微博信息内容
 */
@property(nonatomic,copy)NSString *text;
/**
 *  微博来源
 */
@property(nonatomic,copy)NSString *source;

/**
 *  转发数
 */
@property(nonatomic,assign)int reposts_count;

/**
 *  评论数
 */
@property(nonatomic,assign)int comments_count;
/**
 *  表态数（赞）
 */
@property(nonatomic,assign)int attitudes_count;
/**
 *  配图数组（photo）
 */
@property(nonatomic,strong)NSArray *pic_urls;




//
///**
// *  转发微博
// */
//@property (nonatomic, strong)state *retweeted_status;
//
///**
// *  转发微博昵称
// */
//@property (nonatomic, copy) NSString *retweetName;
//
///**
// *  用户
// */
//@property (nonatomic, strong) user *user;
//
///**
// *  微博创建时间
// */
//@property (nonatomic, copy) NSString *created_at;
//
///**
// *  字符串型的微博ID
// */
//@property (nonatomic, copy) NSString *idstr;
//
///**
// *  微博信息内容
// */
//@property (nonatomic, copy) NSString *text;
//
///**
// *  微博来源
// */
//@property (nonatomic, copy) NSString *source;
//
///**
// *  转发数
// */
//@property (nonatomic, assign) int reposts_count;
//
///**
// *  评论数
// */
//@property (nonatomic, assign) int comments_count;
//
///**
// *  表态数(赞)
// */
//@property (nonatomic, assign) int attitudes_count;
//
///**
// *  配图数组(CZPhoto)
// */
//@property (nonatomic, strong) NSArray *pic_urls;
@end
