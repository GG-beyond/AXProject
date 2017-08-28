//
//  NSString+PYMD5.h
//  AXDL_P2P
//
//  Created by 陈爱彬 on 14/12/10.
//  Copyright (c) 2014年 陈爱彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (PYMD5)

+(NSString *)py_md5:(NSString *)str;
+ (NSString *)filterMoneyString:(NSString *)str;
+ (NSString *)addCommaToAmountString:(NSString *)str;
@end
