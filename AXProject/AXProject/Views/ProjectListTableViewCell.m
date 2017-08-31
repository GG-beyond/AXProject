//
//  ProjectListTableViewCell.m
//  AnXin
//
//  Created by anxindeli on 15/10/8.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import "ProjectListTableViewCell.h"
#import <Masonry.h>

@implementation ProjectListTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubViews];
    }
    return self;
}
- (void)creatSubViews{

    self.contentView.backgroundColor = RGBCOLOR(239 ,243 ,246);;
    
    UIView *bgView = [[UIView alloc]init];
    self.bgView = bgView;
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];
    [bgView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.right.equalTo(0);
        make.height.equalTo(140);
        make.width.equalTo(SCREEN_WIDTH);
    }];
    //项目进度
    CircleView *progressView = [[CircleView alloc]init];
    self.progressView = progressView;
    progressView.userInteractionEnabled = NO;
    [self.contentView addSubview:progressView];
    [progressView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(16);
        make.right.equalTo(-20);
        make.height.equalTo(45);
        make.width.equalTo(45);
    }];
    
    //项目名称
    UILabel *dealName = [[UILabel alloc]init];
    [self.contentView addSubview:dealName];
    self.dealName = dealName;
    dealName.font = [UIFont systemFontOfSize:15];
    dealName.textColor = RGBCOLOR(38, 42, 59);
    [dealName makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(20);
        make.top.equalTo(20);
        make.right.equalTo(progressView.left).offset(- 10);
        make.height.equalTo(15);
    }];
    //新添加的  新手活动、普通活动
    UIImageView *newbieActivity = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:newbieActivity];
    self.newbieActivity = newbieActivity;
//    newbieActivity.image = UIImageWithName(@"projectlist_new.png");
    [newbieActivity makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(20);
        make.top.equalTo(dealName.bottom).offset(8);
        make.width.equalTo(16);
        make.height.equalTo(16);
    }];

    UIImageView *commonActivity = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:commonActivity];
    self.commonActivity = commonActivity;
//    commonActivity.image = UIImageWithName(@"projectlist_commomActivity.png");
    [commonActivity makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(newbieActivity.right).offset(5);
        make.top.equalTo(dealName.bottom).offset(8);
        make.width.equalTo(26);
        make.height.equalTo(16);
    }];
    
    
    //还款方式和担保机构
    UILabel *projectType = [[UILabel alloc]init];
    [self.contentView addSubview:projectType];
    self.projectType = projectType;
    projectType.font = [UIFont systemFontOfSize:12];
    projectType.textColor = RGBCOLOR(97, 101, 121);
    [projectType makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(commonActivity.right).offset(5);
        make.top.equalTo(dealName.bottom).offset(10);
        make.right.equalTo(progressView.left).offset(- 10);
        make.height.equalTo(12);
    }];
    //年化收益
    UIView *rateView = [[UIView alloc]init];
    [self.contentView addSubview:rateView];
    rateView.userInteractionEnabled = NO;
    [rateView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(projectType.bottom).offset(20);
        make.left.equalTo(0);
        make.width.equalTo(SCREEN_WIDTH/3);
        make.height.equalTo(45);
    }];
    UILabel *rate = [[UILabel alloc]init];
    rate.textAlignment = NSTextAlignmentCenter;
    rate.textColor = RGBCOLOR(245, 80, 100);
    rate.font = [UIFont systemFontOfSize:30];
    rate.adjustsFontSizeToFitWidth = YES;
    
    self.rate = rate;
    [rateView addSubview:rate];
    [rate makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(0);
        make.height.equalTo(25);
        make.right.equalTo(0);
    }];
    UILabel *rateLabel = [[UILabel alloc]init];
    rateLabel.textColor = RGBCOLOR(97, 101, 121);
    rateLabel.text = @"预期年化收益";
    rateLabel.textAlignment = NSTextAlignmentCenter;
    rateLabel.font = [UIFont systemFontOfSize:12];
    [rateView addSubview:rateLabel];
    [rateLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rate.bottom).offset(8);
        make.left.equalTo(0);
        make.height.equalTo(12);
        make.right.equalTo(0);
    }];
    //金额
    UIView *amountView = [[UIView alloc]init];
    [self.contentView addSubview:amountView];
    amountView.userInteractionEnabled = NO;
    [amountView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(projectType.bottom).offset(20);
        make.left.equalTo(SCREEN_WIDTH/3);
        make.width.equalTo(SCREEN_WIDTH/3);
        make.height.equalTo(45);
    }];
    UILabel *amount = [[UILabel alloc]init];
    amount.textAlignment = NSTextAlignmentCenter;
    amount.font = [UIFont systemFontOfSize:30];
    amount.adjustsFontSizeToFitWidth = YES;
    amount.textColor = RGBCOLOR(97, 101, 121);
    
    self.amount = amount;
    [amountView addSubview:amount];
    [amount makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(0);
        make.height.equalTo(25);
        make.right.equalTo(0);
    }];
    UILabel *amountLabel = [[UILabel alloc]init];
    amountLabel.textColor = RGBCOLOR(97, 101, 121);
    amountLabel.text = @"融资金额";
    amountLabel.textAlignment = NSTextAlignmentCenter;
    amountLabel.font = [UIFont systemFontOfSize:12];
    [amountView addSubview:amountLabel];
    [amountLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rate.bottom).offset(8);
        make.left.equalTo(0);
        make.height.equalTo(12);
        make.right.equalTo(0);
    }];
    //期限term
    UIView *termView = [[UIView alloc]init];
    [self.contentView addSubview:termView];
    termView.userInteractionEnabled = NO;
    
    [termView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(projectType.bottom).offset(20);
        make.left.equalTo(SCREEN_WIDTH/3*2);
        make.width.equalTo(SCREEN_WIDTH/3);
        make.height.equalTo(45);
    }];
    UILabel *term = [[UILabel alloc]init];
    term.textAlignment = NSTextAlignmentCenter;
    term.textColor = RGBCOLOR(97, 101, 121);
    term.font = [UIFont systemFontOfSize:30];
    term.adjustsFontSizeToFitWidth = YES;
    self.term = term;
    [termView addSubview:term];
    [term makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(0);
        make.height.equalTo(25);
        make.right.equalTo(0);
    }];
    UILabel *termLabel = [[UILabel alloc]init];
    termLabel.textColor = RGBCOLOR(97, 101, 121);
    termLabel.textAlignment = NSTextAlignmentCenter;
    termLabel.text = @"项目期限";
    termLabel.font = [UIFont systemFontOfSize:12];
    [termView addSubview:termLabel];
    [termLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rate.bottom).offset(8);
        make.left.equalTo(0);
        make.height.equalTo(12);
        make.right.equalTo(0);
    }];
}

 - (void)setContentCellWithProject:(ProjectModel *)project{
 
    self.dealName.text = project.projectSubName;
    if (project.loanType.length > 0) {
        
        NSString *tempStr = FORMAT(@"%@ | %@",project.loanType,project.guaranteeAgencyName);
        
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:tempStr];
        [str addAttribute:NSForegroundColorAttributeName
                    value:RGBCOLOR(156, 187, 255)
                    range:NSMakeRange(0, project.loanType.length)];
        self.projectType.attributedText = str;

        
    }else{
        self.projectType.text = FORMAT(@"%@",project.guaranteeAgencyName);
    }
    
    
    
    //收益率
    NSString *tempRate = FORMAT(@"%@%%",project.rate);
    NSMutableAttributedString *strRate = [[NSMutableAttributedString alloc] initWithString:tempRate];
    [strRate addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:30]} range:NSMakeRange(0, tempRate.length - 1)];
    [strRate addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} range:NSMakeRange(tempRate.length - 1, 1)];
    self.rate.attributedText = strRate;
    //融资金额
    
    NSString *tempAmount = FORMAT(@"%g%@",[project.amountNum[@"v"] floatValue],project.amountNum[@"u"]);
    NSMutableAttributedString *strAmount = [[NSMutableAttributedString alloc] initWithString:tempAmount];
    [strAmount addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:30]} range:NSMakeRange(0, tempAmount.length - 1)];
    [strAmount addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} range:NSMakeRange(tempAmount.length - 1, 1)];
    self.amount.attributedText = strAmount;
    //融资期限
    NSString *termUnit = project.termUnit;
    NSString *tempTerm = project.term;
    NSMutableAttributedString *strTerm = [[NSMutableAttributedString alloc] initWithString:tempTerm];
    [strTerm addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:30]} range:NSMakeRange(0,termUnit.length)];
    [strTerm addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} range:NSMakeRange(tempTerm.length - termUnit.length, termUnit.length)];
    self.term.attributedText = strTerm;
    
    
    CGFloat leftWidth = 20.0f;
    if (project.isNew) {//是否是新手
//        self.activity.hidden = NO;
//        self.activity.text = @"新手";
        [self.newbieActivity updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(self.dealName.bottom).offset(8);
            make.width.equalTo(16);
            make.height.equalTo(16);

        }];
        leftWidth = leftWidth + 16;
    }else{
        [self.newbieActivity updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(self.dealName.bottom).offset(8);
            make.width.equalTo(0);
            make.height.equalTo(0);
        }];
    }
    
    
    if (project.appActivities.count > 0){//是否有活动
//        self.activity.hidden = NO;
//        self.activity.text = @"活动";
        [self.commonActivity updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.newbieActivity.right).offset(leftWidth>20.0?5:0);
            make.top.equalTo(self.dealName.bottom).offset(8);
            make.width.equalTo(26);
            make.height.equalTo(16);
        }];
        leftWidth = leftWidth + 26;
        
        [self.projectType updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.commonActivity.right).offset(5);
        }];
    }else{//什么都没有，隐藏活动背景
//        self.activity.hidden = YES;
        
        [self.commonActivity updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.newbieActivity.right).offset(0);
            make.top.equalTo(self.dealName.bottom).offset(8);
            make.width.equalTo(0);
            make.height.equalTo(0);
        }];
        
        [self.projectType updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.commonActivity.right).offset(leftWidth>20?5: 0);
        }];
    }
    
    self.progressView.value = (floor(project.progress)) * 0.01;
    NSInteger dealStatus = project.dealStatus;
    
    switch (dealStatus) {
        case -1:{
            self.progressView.progressLabel.text = @"预发布";
        }
            break;
        case 0:{
            self.progressView.progressLabel.text = @"待审核";
        }
            break;
        case 1:{
        }
            break;
        case 2:{
            self.progressView.progressLabel.text = @"已满标";
        }
            break;
            
        case 3:{
            self.progressView.progressLabel.text = @"已流标";
        }
            break;
        case 4:{
            self.progressView.progressLabel.text = @"还款中";
        }
            break;
            
        case 5:{
            self.progressView.progressLabel.text = @"已归还";
        }
            break;
        case 6:{
            self.progressView.progressLabel.text = @"逾期";
        }
            break;
//        case 7:{
//            self.progressView.progressLabel.text = @"";
//        }
            break;
        default:{
        }
            break;
    }
}


- (IBAction)selectCancel:(UIButton *)sender {
//    self.bgView.backgroundColor =  [UIColor whiteColor];
}

@end
