//
//  ZPTableViewController.m
//  用storyboard自定义等高的cell
//
//  Created by apple on 16/5/18.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 代理模式就是本来属于自己类的任务自己类不去做而委托给其他类来做，在这个过程中可以利用协议里面的代理方法来完成不同类之间的传值。
 */
#import "ZPTableViewController.h"
#import "ZPDeal.h"
#import "ZPTableViewCell.h"
#import "ZPLoadMoreFooterView.h"

@interface ZPTableViewController () <ZPLoadMoreFooterViewDelegate>

@property (nonatomic, strong) NSMutableArray *deals;

@end

@implementation ZPTableViewController

#pragma mark ————— 懒加载 —————
-(NSMutableArray *)deals
{
    if (_deals == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"deals" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in dictArray)
        {
            ZPDeal *deal = [ZPDeal dealWithDict:dic];
            [tempArray addObject:deal];
        }
        
        _deals = tempArray;
    }
    
    return _deals;
}

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];

    ZPLoadMoreFooterView *footer = [ZPLoadMoreFooterView footerView];
    footer.delegate = self;  //让本类接受代理协议并实现协议里面的方法
    
    self.tableView.tableFooterView = footer;
}

#pragma mark ————— UITableViewDataSource —————
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.deals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZPTableViewCell *cell = [ZPTableViewCell cellWithTableView:tableView];
    cell.deal = [self.deals objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark ————— ZPLoadMoreFooterViewDelegate —————
/**
 本类实现代理协议里面的方法
 */
-(void)loadMoreFooterViewDidClickLoadMoreButton:(ZPLoadMoreFooterView *)footer
{
    NSLog(@"点击了“点击按钮加载”的按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
