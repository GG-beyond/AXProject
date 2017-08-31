//
//  ProjectListTableViewCell.h
//  AnXin
//
//  Created by anxindeli on 15/10/8.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleView.h"
#import "ProjectModel.h"
@protocol ProjectListInvestDelegate <NSObject>
- (void)investProject:(NSIndexPath *)indexPath;
- (void)enterInProjectDetail:(NSIndexPath *)indexPath;
@end

@interface ProjectListTableViewCell : UITableViewCell
@property (strong, nonatomic) UIView *bgView;
@property (strong, nonatomic) CircleView *progressView;
@property (strong, nonatomic) UILabel *dealName;
@property (strong, nonatomic) UILabel *projectType;
@property (strong, nonatomic) UILabel *rate;
@property (strong, nonatomic) UILabel *amount;
@property (strong, nonatomic) UIButton *investSender;
@property (strong, nonatomic) UIButton *detailSender;

@property (strong, nonatomic) UILabel *term;
@property (strong, nonatomic) NSIndexPath *indexPath;;
@property (strong, nonatomic) UILabel *activity;
@property (strong, nonatomic) UIImageView *newbieActivity;
@property (strong, nonatomic) UIImageView *commonActivity;

@property (assign, nonatomic) id<ProjectListInvestDelegate>delegate;
- (void)setContentCellWithProject:(ProjectModel *)project;
@end
