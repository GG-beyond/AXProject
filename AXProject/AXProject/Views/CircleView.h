//
//  CircleView.h
//  AnXin
//
//  Created by anxindeli on 15/10/8.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
@property (nonatomic, assign) CGFloat  value;//变化的值
@property (nonatomic, strong) UILabel *progressLabel;

- (void)creatCircleViews;
@end
