//
//  NSString+PYMD5.m
//  AXDL_P2P
//
//  Created by 陈爱彬 on 14/12/10.
//  Copyright (c) 2014年 陈爱彬. All rights reserved.
//

#import "NSString+PYMD5.h"

@implementation NSString (PYMD5)

+(NSString *)py_md5:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_LONG cStrLong = (CC_LONG)strlen(cStr);
    CC_MD5( cStr,  cStrLong, result );
    NSMutableString *hash = [NSMutableString string];
    for(int i=0;i<CC_MD5_DIGEST_LENGTH;i++)
    {
        [hash appendFormat:@"%02X",result[i]];
    }
    return [hash lowercaseString];
}
+ (NSString *)filterMoneyString:(NSString *)str
{
    if (!str || ![str length]) {
        return nil;
    }
    NSString *returnString = [str stringByReplacingOccurrencesOfString:@"," withString:@""];
    return returnString;
}
+ (BOOL)isPureFloat:(NSString *)string{
    if (!string) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}
+ (NSString *)addCommaToAmountString:(NSString *)str
{
    BOOL isFloat = [self isPureFloat:[self filterMoneyString:str]];
    if (isFloat) {
        NSString *amountString = [NSString stringWithFormat:@"%@",str];
        NSArray *comArray = [amountString componentsSeparatedByString:@"."];
        if ([comArray count] > 0) {
            //只处理整数部分，小数部分以0补
            NSString *firstString = [NSString stringWithFormat:@"%@",comArray[0]];
            NSMutableString *resultString = [[NSMutableString alloc] init];
            int count = 0;
            for (NSInteger i = firstString.length - 1; i >= 0; i--) {
                if (count % 3 == 0 && count > 0) {
                    //添加逗号
                    [resultString insertString:@"," atIndex:0];
                    count = 0;
                }
                [resultString insertString:[NSString stringWithFormat:@"%c",[firstString characterAtIndex:i]] atIndex:0];
                count += 1;
            }
            [resultString appendString:@".00"];
            return resultString;
        }
        return str;
    }
    //不是float数值
    return str;
}
@end
