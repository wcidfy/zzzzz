//
//  XXTabBar.m
//  zzzzz
//
//  Created by lxx on 16/1/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "XXTabBar.h"
@interface XXTabBar ()

@property (nonatomic, weak) UIButton *selectedButton;

@end
@implementation XXTabBar



-(void)setItems:(NSArray *)items
{
    _ites=items;
//    遍历模型数组
    for(UITabBarItem *item in _ites) {
        
        
        UITabBarItem *tab=[[UITabBarItem alloc]init];
        tab=item;
    }




}
-(UIButton *)addBut
{
    if (_addBut==nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        // 默认按钮的尺寸跟背景图片一样大
        // sizeToFit:默认会根据按钮的背景图片或者image和文字计算出按钮的最合适的尺寸
        [btn sizeToFit];
        
        // 监听按钮的点击
        [btn addTarget:self action:@selector(addButClick) forControlEvents:UIControlEventTouchUpInside];
        
        _addBut = btn;
        
        [self addSubview:_addBut];
        
    }
    return _addBut;


}
-(void)addButClick
{



}

//调整子控制器的位置
-(void )layoutSubviews
{
    [super layoutSubviews];
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;

    
    CGFloat btnX=0;
    CGFloat btnY=0;
    CGFloat btnW=self.bounds.size.width / (self.items.count+1);
    CGFloat btnH=self.bounds.size.height;
//    调整系统自带的tabbar上按钮的位置
    int i=0;
    for(UIView *tabBarButton in self.subviews)
    {
//    判断下是否是uitabbarbutton
        if([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            if (i==2) {
                i=3;
            }
            btnX=btnW *i ;
            tabBarButton.frame=CGRectMake(btnX, btnY, btnW, btnH);
            
            i++;
          
        }
       
       }
//设置添加按钮的位置
    self.addBut.center=CGPointMake(w * 0.5, h * 0.5 );

}
@end
