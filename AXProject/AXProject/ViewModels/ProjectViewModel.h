//
//  ProjectViewModel.h
//  AXProject
//
//  Created by anxindeli on 2017/8/30.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectModel.h"

typedef void (^Success)();
typedef void (^Failure)();

@interface ProjectViewModel : NSObject
@property (nonatomic, strong) NSMutableDictionary *optionDict;//筛选条件
@property (nonatomic, strong) NSMutableArray *listArr;
@property (nonatomic, copy) Success success;
@property (nonatomic, copy) Failure failure;

/*
    请求第一页数据
 */
- (void)doProjectListRefreshNewData;//第一页数据

/*
    请求新的一页（第2、第3、.......）数据
 */
- (void)doProjectListRefreshNextData;//下一页数据
#pragma mark - 获取和TableView绑定的数据
/*
    返回某个section下row 的个数
 */
- (NSInteger)getRowCount:(NSInteger)section;
/*
    返回section的个数
 */
- (NSInteger)getSectionCount;

/*
    返回indexPath对应的 模型类
 */
- (ProjectModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath;


@end
