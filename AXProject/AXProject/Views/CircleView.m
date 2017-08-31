//
//  CircleView.m
//  AnXin
//
//  Created by anxindeli on 15/10/8.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import "CircleView.h"
@interface CircleView ()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end
@implementation CircleView
@synthesize shapeLayer = _shapeLayer;
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor =[UIColor redColor];
        [self creatCircleViews];
    }
    return self;
}
- (id)init{
    self = [super initWithFrame: CGRectMake(0, 0, 45, 45)];
    if (self) {
        [self creatCircleViews];
    }
    return self;
}
- (void)creatCircleViews{
    //进度label展示，
    UILabel *progressLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:progressLabel];
    progressLabel.font = [UIFont systemFontOfSize:12];
//    progressLabel.adjustsFontSizeToFitWidth = YES;
    progressLabel.textColor = RGBCOLOR(156, 187, 255);
    self.progressLabel = progressLabel;
    progressLabel.textAlignment  = NSTextAlignmentCenter;
    [progressLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(10);
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.height.equalTo(25);
    }];

    //贝塞尔曲线画圆
    UIBezierPath* outPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(22.5, 22.5)
                                                          radius:21
                                                      startAngle:-M_PI_2
                                                        endAngle:M_PI_2*3
                                                       clockwise:YES];
    outPath.lineCapStyle = kCGLineCapRound; //线条拐角
    outPath.lineJoinStyle = kCGLineCapRound; //终点处理

    
    
    CAShapeLayer *bgShapeLayer = [CAShapeLayer layer];
    bgShapeLayer.path=outPath.CGPath;
//    bgShapeLayer.frame =CGRectMake(0, 0, 40, 40);
    bgShapeLayer.fillColor=[UIColor clearColor].CGColor;
    bgShapeLayer.lineWidth=2.0f;
    bgShapeLayer.strokeColor= RGBCOLOR(239,243,246).CGColor;
    bgShapeLayer.strokeStart=0.0;
    bgShapeLayer.strokeEnd = 1.0;
    [self.layer addSublayer:bgShapeLayer];

    
    _shapeLayer=[CAShapeLayer layer];
   // _shapeLayer.frame= CGRectMake(0, 0, 40, 40);
    //创建出贝塞尔曲线
    _shapeLayer.path=outPath.CGPath;
    _shapeLayer.fillColor=[UIColor clearColor].CGColor;
    _shapeLayer.lineWidth=2.0f;
    _shapeLayer.strokeColor= RGBCOLOR(156, 187, 255).CGColor;
    _shapeLayer.strokeStart=0.0;
    [self.layer addSublayer:_shapeLayer];
    

}
@synthesize  value=_value;
-(void)setValue:(CGFloat)value
{
    _value=value;
    self.progressLabel.text = FORMAT(@"%.f%%",value *100);//设置百分比值
    _shapeLayer.strokeEnd=value;


    //画圆的动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"strokeEnd";
    animation.fromValue = @0;
    animation.toValue = @(value);
    animation.duration = 1.0f;
    [_shapeLayer addAnimation:animation forKey:nil];
}
-(CGFloat)value
{
    return _value;
}

@end
