//
//  CTMediator+Project.m
//  AX
//
//  Created by anxindeli on 2017/10/13.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "CTMediator+Project.h"
@implementation CTMediator (Project)
- (UIViewController *)projectVc{
    
    return [self performTarget:@"Project" action:@"viewController" params:nil shouldCacheTarget:YES];
}
@end
