//
//  ProjectListViewController.m
//  AXProject
//
//  Created by anxindeli on 2017/8/30.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "ProjectListViewController.h"
#import "ProjectViewModel.h"
#import "ProjectListTableViewCell.h"
@interface ProjectListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *projectListTableView;
@property (nonatomic, strong) ProjectViewModel *projectViewModel;

@end

@implementation ProjectListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.projectListTableView];
    
}
- (UITableView *)projectListTableView{
    if (!_projectListTableView) {
        
        _projectListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64) style:UITableViewStylePlain];
        [self.view addSubview:_projectListTableView];
        _projectListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _projectListTableView.dataSource = self;
        _projectListTableView.delegate   = self;

    }
    return _projectListTableView;
}
- (ProjectViewModel *)projectViewModel{
    
    __weak typeof(self)weakSelf = self;
    if (!_projectViewModel) {
        _projectViewModel = [[ProjectViewModel alloc] init];
        _projectViewModel.success = ^(){
            [weakSelf.projectListTableView  reloadData];
        };
        _projectViewModel.failure = ^(){
            [weakSelf.projectListTableView  reloadData];
        };
    }
    return _projectViewModel;
    
}
#pragma mark - UITableViewDataSource 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.projectViewModel getSectionCount];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.projectViewModel getRowCount:section];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"projectcell";
    ProjectListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[ProjectListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    id projectModel = [self.projectViewModel getRowModelWithIndexPath:indexPath];
    if (projectModel) {
        [cell setContentCellWithProject:projectModel];
    }
    return cell;

}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
