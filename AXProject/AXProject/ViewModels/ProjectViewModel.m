//
//  ProjectViewModel.m
//  AXProject
//
//  Created by anxindeli on 2017/8/30.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "ProjectViewModel.h"
#import <AXHttpClientTool.h>
@interface ProjectViewModel ()
{
    NSInteger currentPage;
    BOOL isRefreshing;
}
@end
@implementation ProjectViewModel
- (instancetype)init{
    
    if (self = [super init]) {
        
        [self doProjectListRefreshNewData];
    }
    return self;
}
- (NSMutableArray *)listArr{
    
    if (!_listArr) {
        _listArr = [NSMutableArray array];
    }
    return _listArr;
    
}
- (void)doProjectListRefreshNewData{
    currentPage = 0;
    [self getProjectData];
    
}
- (void)doProjectListRefreshNextData{

    [self getProjectData];
    
}
//获取项目列表信息
- (void)getProjectData{
    
    if (isRefreshing) {
        return;
    }
    isRefreshing = YES;
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.optionDict];
    [dict setObject:FORMAT(@"%ld",(long)currentPage) forKey:@"page"];
    
    __weak typeof(self)weakSelf = self;
    
    [AXHttpClientTool POST:@"v1/project/list" params:self.optionDict success:^(id JSON) {
        
        NSDictionary *respondDict = (NSDictionary *)JSON;
        NSInteger status = [respondDict[@"status"] integerValue];
        if (status == 0) {
            
            
            [weakSelf dealWithProjectInfo:respondDict[@"data"]];
            
        }
        
        if (weakSelf.success) {
            weakSelf.success();
        }
        
    } failure:^(NSError *error) {
        
        if (weakSelf.failure) {
            weakSelf.failure();
        }
    }];
    
}
//数据处理
- (void)dealWithProjectInfo:(NSDictionary *)data{
    
    NSInteger page = [data[@"page"] integerValue];
    NSInteger pages = [data[@"pages"] integerValue];
    if (page == 1) {
        [self.listArr removeAllObjects];
    }
    
    NSArray *items = data[@"items"];
    if (items.count>0) {//有数据
        
        for (NSDictionary *dic in items) {
            ProjectModel *model = [[ProjectModel alloc] initWithAttributes:dic];
            [self.listArr addObject:model];
        }
    }
    
    
    
}
#pragma mark - 数据绑定
- (NSInteger)getSectionCount{
    return 1;
}
- (NSInteger)getRowCount:(NSInteger)section{
    return self.listArr.count;
}
- (ProjectModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath{
    
    return self.listArr[indexPath.row];
    
}
@end
