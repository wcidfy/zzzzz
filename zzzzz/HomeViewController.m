//
//  HomeViewController.m
//  zzzzz
//
//  Created by lxx on 15/12/27.
//  Copyright © 2015年 lxx. All rights reserved.
//

#import "HomeViewController.h"
#import "AFNetworking.h"
#import "accountTool.h"
#import "Accountmodel.h"
#import "state.h"
#import "MJExtension.h"
#import "user.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "HttpTool.h"
#import "StateTool.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *statues;
//@property(nonatomic,strong)UITableView *tabView;
@end

@implementation HomeViewController
-(NSMutableArray *)statues
{
    if (_statues==nil) {
        _statues=[NSMutableArray array];
    }


    return _statues;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem=left;
    
    self.tableView.backgroundColor=[UIColor whiteColor];
//添加下拉刷新控件
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewWeiBo)];
    
//   自动下拉刷新
    [self.tableView headerBeginRefreshing];
   
//    添加上啦刷新
    
    [self.tableView addFooterWithTarget:self action:@selector(loadOldWeiBo)];
    
}
-(void)loadNewWeiBo
{
    NSString *sinceID=nil;
    if (self.statues.count) {
        sinceID=[self.statues[0]idstr];
    }
    [StateTool newStatusWithSinceId:sinceID success:^(NSArray *statues) {
        //        结束下拉刷新
     [self.tableView headerEndRefreshing];
//        插入最新数据
        NSIndexSet *indexSet=[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statues.count)];
        [self.statues insertObjects:statues atIndexes:indexSet];
        NSLog(@"%@",self.statues);
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];

}
-(void)loadOldWeiBo
{
    NSString *maxid=nil;
    if (self.statues.count) {
        long long maxId=[[[self.statues lastObject]idstr]longLongValue]-1;
       maxid=[NSString stringWithFormat:@"%lld",maxId];

    }
    [StateTool oldStatusWithMaxId:maxid success:^(NSArray *statues) {
//        停止刷新
        [self.tableView footerEndRefreshing];
//                插入最新数据
    [self.statues addObjectsFromArray:statues];
    [self.tableView reloadData];

    } failure:^(NSError *error) {
        
    }];

}
-(void)rightAction
{

    NSLog(@"__________________");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//- (CGFloat)tableView:(UITableView *)tableView
//heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 50;
//}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.statues.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID =@"cellid";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    state *statess=self.statues[indexPath.row];
    cell.textLabel.text=statess.user.name;
    [cell.imageView sd_setImageWithURL:statess.user.profile_image_url placeholderImage:[UIImage imageNamed:@"qq"]];
    cell.detailTextLabel.text=statess.text;
    return cell;
}

// 返回cell的高度
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // 获取status模型
//   
//}

@end
