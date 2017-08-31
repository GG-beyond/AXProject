//
//  ProjectModel.m
//  AXProject
//
//  Created by anxindeli on 2017/8/30.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "ProjectModel.h"

@implementation ProjectModel
- (instancetype)initWithAttributes:(NSDictionary *)dict{
    if (self = [super init]) {
        
        //项目ID
        _projectId = [NSString stringWithFormat:@"%@",dict[@"id"]];
        //项目唯一编号
        _dealUniqueId = [NSString stringWithFormat:@"%@",dict[@"dealUniqueId"]];
        //项目名称
        _projectName = [dict[@"name"] copy];
        //项目短名称
        _projectSubName = [dict[@"subName"] copy];
        //项目金额
        _amount = [dict[@"amount"] copy];
        //项目类型
        _dealType = [dict[@"dealType"] integerValue];
        //项目子类型
        _dealSubType = [dict[@"dealSubType"] integerValue];
        //项目子类型名称
        _dealSubTypeString = [dict[@"dealSubTypeName"] copy];
        //项目收益率
        _rate = [NSString stringWithFormat:@"%@",dict[@"rateNum"]];
        //项目期限
        _term = [dict[@"term"] copy];
        //项目期限单位
        _termUnit = [dict[@"term2"][@"u"] copy];
        //担保机构ID
        _guaranteeAgencyId = [NSString stringWithFormat:@"%@",dict[@"guaranteeAgencyId"]];
        //担保结构名称
        _guaranteeAgencyName = [dict[@"iconTips"] copy];
        //是否新手项目，0不是，1是
        _isNew = [dict[@"isNew"] boolValue];
        //项目状态
        _dealStatus = [dict[@"dealStatus"] integerValue];
        //投标开始时间
        _bidOpenTime = [dict[@"bidOpenTimeDisplay"] copy];
        //进度值
        _progress = [dict[@"progress"] doubleValue];
        //活动标签
        _activities = [[NSArray arrayWithArray:dict[@"activities"] ] copy];
        //还款方式
        _loanType = FORMAT(@"%@",dict[@"loanType"]);
        _amountNum = dict[@"amountNum"];
        _appActivities = [dict[@"appActivities"] copy];
        
    }
    return self;
}
@end
