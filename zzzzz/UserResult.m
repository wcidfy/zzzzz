//
//  UserResult.m
//  zzzzz
//
//  Created by lxx on 16/1/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "UserResult.h"

@implementation UserResult
-(int)messageCount{



    return _cmt+_dm+_mention_cmt+_mention_status;
}
-(int)totolCount
{

    return self.messageCount+_status+_follower;


}
@end
