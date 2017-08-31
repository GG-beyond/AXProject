//
//  MyConstants.h
//  AXProject
//
//  Created by anxindeli on 2017/8/31.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#ifndef MyConstants_h
#define MyConstants_h

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
//当前设备的屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

//当前设备的屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//字符串输出
#define FORMAT(format, ...) [NSString stringWithFormat:(format), ##__VA_ARGS__]

#import <Masonry.h>

#endif /* MyConstants_h */
