//
//  Target_Project.m
//  AX
//
//  Created by anxindeli on 2017/10/13.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "Target_Project.h"
#import <ProjectListViewController.h>
@implementation Target_Project
- (UIViewController *)Action_viewController:(NSDictionary *)params{
    
    ProjectListViewController *vc = [[ProjectListViewController alloc] init];
    return vc;
}
@end
