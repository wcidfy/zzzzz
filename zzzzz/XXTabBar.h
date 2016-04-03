//
//  XXTabBar.h
//  zzzzz
//
//  Created by lxx on 16/1/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XXTabBar;
@protocol TabBarDelegate <NSObject>

@optional
- (void)tabBar:(XXTabBar *)tabBar didClickButton:(NSInteger)index;

@end


@interface XXTabBar :UITabBar
@property(nonatomic,strong)UIButton *addBut;
@property (nonatomic, strong) NSArray *ites;
@property (nonatomic, weak) id <TabBarDelegate>delegate;
@end
