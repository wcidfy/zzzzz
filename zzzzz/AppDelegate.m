//
//  AppDelegate.m
//  zzzzz
//
//  Created by lxx on 15/12/27.
//  Copyright © 2015年 lxx. All rights reserved.
//

#import "AppDelegate.h"
#import "XXTabBarController.h"
#import "AuthViewController.h"
#import "accountTool.h"
#import "CZRootTool.h"
#import "UIImageView+WebCache.h"

#import <AVFoundation/AVFoundation.h>
@interface AppDelegate ()
@property(nonatomic,strong)AVAudioPlayer *player;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // 注册通知
    UIUserNotificationSettings *setting=[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [application registerUserNotificationSettings:setting];
    
    
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window makeKeyAndVisible];
//    
//    XXTabBarController *tabBar=[XXTabBarController new];
//    self.window.rootViewController=tabBar;
//    判断帐号是否为空
    if ([accountTool account]) {
        [CZRootTool chooseRootViewController:self.window];
       
        

    }else
    {
        AuthViewController *auth=[[AuthViewController alloc]init];
        self.window.rootViewController=auth;
    
    }
    
   
    return YES;
}
//内存警告
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{

//    停止所有下载、
    [[SDWebImageManager sharedManager]cancelAll];
//    清除缓存
    [[SDWebImageManager sharedManager].imageCache clearMemory];


}
//失去焦点
- (void)applicationWillResignActive:(UIApplication *)application {
   
    NSURL *url=[[NSBundle mainBundle] URLForResource:@"silence.mp3" withExtension:nil];
    AVAudioPlayer *player=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [player prepareToPlay];
    //  无限播放
    player.numberOfLoops=-1;
    
    [player play];
    
    
    _player=player;
}
//程序进入后台调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
//  开启一个后台任务
    UIBackgroundTaskIdentifier ID=[application beginBackgroundTaskWithExpirationHandler:^{
//       后台任务结束调用
        [application endBackgroundTask:ID];
    }];

//    提高后台优先级 欺骗苹果 我们是后台播放器
    
//    苹果会检测程序是否后台播放
//    微博：在程序即将失去焦点的时候播放音乐 静音音乐
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
