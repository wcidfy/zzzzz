//
//  XXTabBarController.m
//  xxChat
//
//  Created by lxx on 15/12/27.
//  Copyright © 2015年 lxx. All rights reserved.
//

#import "XXTabBarController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
#import "XXNavigationController.h"
#import "XXTabBar.h"
#import "UserResult.h"
#import "UserTool.h"
@interface XXTabBarController ()
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, weak) HomeViewController *home;
@property (nonatomic, weak) MessageViewController *message;
@property (nonatomic, weak) DiscoverViewController *discover;
@property (nonatomic, weak) ProfileViewController *profile;

@end

@implementation XXTabBarController
- (NSMutableArray *)items
{
    if (_items == nil) {
        
        _items = [NSMutableArray array];
        
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor greenColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:8.0f], NSFontAttributeName,nil]forState:UIControlStateSelected];
    //添加所有的字控制器
    [self addAllChildController];
    XXTabBar *tabBar=[[XXTabBar alloc]initWithFrame:self.tabBar.frame];
    [self setValue:tabBar forKeyPath:@"tabBar"];

    //每隔一段时间请求一次
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(RequestUnread) userInfo:nil repeats:YES];
        //    请求微博未读数
    
}
-(void)RequestUnread
{

    [UserTool UnReadWithSuccess:^(UserResult *result)
     {
         
         
         //        设置首页未读数
         if (result.status>0) {
             _home.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",result.status];

         }
         //        设置消息未读数
         if(result.messageCount>0){
         _message.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",result.messageCount];
         }
         
         
         //        设置我的未读数
         if (result.follower>0) {
             _profile.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",result.follower];

         }
         //        应用消息总和
         [UIApplication sharedApplication].applicationIconBadgeNumber=result.totolCount;
         
     } failuer:^(NSError *error) {
         
     }];



}
- (void)viewWillAppear:(BOOL)animated
{
        [super viewWillAppear:animated];
    
    
    
    
}

#define  mark -添加所有的字控制器
-(void)addAllChildController
{
    

    HomeViewController *home=[[HomeViewController alloc]init];
    [self addOneControll:home image:@"tabbar_home" seletedImage:@"tabbar_homeHL" title:@"首页"];
    _home=home;
    
    MessageViewController *message=[[MessageViewController alloc]init];
    [self addOneControll:message image:@"tabbar_message" seletedImage:@"tabbar_messageHL" title:@"消息"];
    _message=message;
    
    
    DiscoverViewController *discover=[[DiscoverViewController alloc]init];
    [self addOneControll:discover image:@"tabbar_discover" seletedImage:@"tabbar_discoverHL" title:@"发现"];
    _discover=discover;
    
  
    
    ProfileViewController *profile=[[ProfileViewController alloc]init];
    [self addOneControll:profile image:@"tabbar_profile" seletedImage:@"tabbar_profileHL" title:@"我的"];
    _profile=profile;
  


}

-(void)addOneControll:(UIViewController *)vc image:(NSString *)imageName seletedImage:(NSString *)selectedimage title:(NSString *)title
{
    vc.tabBarItem.title=title;
    
    vc.tabBarItem.image=[UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedimage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.items addObject:vc.tabBarItem];
    XXNavigationController *nav=[[XXNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
