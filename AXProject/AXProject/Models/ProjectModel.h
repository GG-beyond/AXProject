//
//  ProjectModel.h
//  AXProject
//
//  Created by anxindeli on 2017/8/30.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ProjectStatus) {
    ProjectStatusYuFaBu = -1,            //预发布
    ProjectStatusDaiShenHe = 0,          //待审核
    ProjectStatusTouZiZhong,             //投资中
    ProjectStatusYiManBiao,              //已满标
    ProjectStatusYiLiuBiao,              //已流标
    ProjectStatusZhengZaiHuanKuan,       //正在还款
    ProjectStatusYiJingGuiHuan,          //已经归还
    ProjectStatusYuQi,                   //逾期
    ProjectStatusTouBiaoJieZhi,          //投标截止
};

typedef NS_ENUM(NSInteger, ProjectType) {
    ProjectTypeQiYeDaiKuan = 1,          //企业贷款
    ProjectTypeZiChanZhuanRang,          //资产转让
    ProjectTypeGeRenDaiKuan,             //个人贷款
};

typedef NS_ENUM(NSInteger, ProjectSubType) {
    ProjectSubTypeShangQuanBao = 1,      //安心商圈保
    ProjectSubTypeTuiShuiBao,            //安心退税保
    ProjectSubTypeCheShangBao,           //安心车商保
};

@interface ProjectModel : NSObject
//项目ID
@property (nonatomic,copy) NSString *projectId;
//项目唯一编号
@property (nonatomic,copy) NSString *dealUniqueId;
//项目名称
@property (nonatomic,copy) NSString *projectName;
//项目短名称
@property (nonatomic,copy) NSString *projectSubName;
//项目金额
@property (nonatomic,copy) NSString *amount;
//项目类型
@property (nonatomic,assign) ProjectType dealType;
//项目子类型
@property (nonatomic,assign) ProjectSubType dealSubType;
//项目子类型名称
@property (nonatomic,copy) NSString *dealSubTypeString;
//项目收益率
@property (nonatomic,copy) NSString *rate;
//项目期限
@property (nonatomic,copy) NSString *term;
//项目期限单位
@property (nonatomic,copy) NSString *termUnit;
//担保机构ID
@property (nonatomic,copy) NSString *guaranteeAgencyId;
//担保结构名称
@property (nonatomic,copy) NSString *guaranteeAgencyName;
//是否新手项目，0不是，1是
@property (nonatomic,assign) BOOL isNew;
//项目状态
@property (nonatomic,assign) ProjectStatus dealStatus;
//投标开始时间
@property (nonatomic,copy) NSString *bidOpenTime;
//pc活动标签
@property (nonatomic,copy) NSArray *activities;
//app活动标签
@property (nonatomic,copy) NSDictionary *appActivities;
//进度值
@property (nonatomic,assign) CGFloat progress;
//还款方式
@property (nonatomic,copy) NSString *loanType;
//展示金额
@property (nonatomic,copy) NSDictionary *amountNum;

- (instancetype)initWithAttributes:(NSDictionary *)dict;
@end
