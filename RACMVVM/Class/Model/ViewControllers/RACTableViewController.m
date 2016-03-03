//
//  RACTableViewController.m
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import "RACTableViewController.h"
#import "RACCell.h"
@interface RACTableViewController (){

    NSInteger Page;
}

@end

@implementation RACTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    Page = 1;
    [self sendRequest:1 iSRefresh:YES];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self sendRequest:1 iSRefresh:YES];
        [self.tableView.mj_header endRefreshing];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
         [self sendRequest:++Page iSRefresh:NO];
         [self.tableView.mj_footer endRefreshing];
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 发起请求
- (void)sendRequest:(NSInteger )page iSRefresh:(BOOL)isrefresh{
    
    NSLog(@"--------------->%li",(long)page);
    @weakify(self);
    self.viewModel.currentPage = page;
    self.viewModel.iSRefresh = isrefresh;
    [self.viewModel.requestSignal subscribeNext:^(NSArray *articles) {
        
        @strongify(self);
        // 请求完成后，刷新表格
        [self.tableView reloadData];
        if (isrefresh) {
            Page =1;
        }
        
    } error:^(NSError *error) {
        [self.tableView reloadData];
        // 如果请求失败，则根据error做出相应提示
        NSLog(@"失败。。。。");
        
        if (Page<=1) {
            Page=1;
        }else{
            Page--;
        }
    }];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
     return self.viewModel.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RACCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"RACCell" owner:nil options:nil]objectAtIndex:0];
    [self configCell:cell indexPath:indexPath];
    return cell;
}

- (void)configCell:(RACCell *)cell indexPath:(NSIndexPath *)indexPath {
    // 将数据赋值给cell的vm
    // cell接收到vm修改以后，就会触发初始时设置的信号量
    cell.viewModel = self.viewModel.dataSource[indexPath.row];
}

-(RACViewModel *)viewModel{

    if (!_viewModel) {
        _viewModel = [RACViewModel new];
    }
    return _viewModel;
    
}


@end
