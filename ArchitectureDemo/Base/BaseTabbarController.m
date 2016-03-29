//
//  BaseTabbarController.m
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/28.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "BaseTabbarController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "PlatesViewController.h"
#import "UserViewController.h"

@implementation BaseTabbarController
#pragma amrk - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *hNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeVC.title = @"主页";
    
    MessageViewController *msgVC = [[MessageViewController alloc] init];
    UINavigationController *mNav = [[UINavigationController alloc] initWithRootViewController:msgVC];
    msgVC.title = @"消息";
    
    PlatesViewController *plateVC = [[PlatesViewController alloc] init];
    UINavigationController *pNav = [[UINavigationController alloc] initWithRootViewController:plateVC];
    plateVC.title = @"论坛";
    
    UserViewController *uVC = [[UserViewController alloc] init];
    UINavigationController *uNav = [[UINavigationController alloc] initWithRootViewController:uVC];
    uVC.title = @"我的";
    
    self.viewControllers = @[hNav, mNav, pNav, uNav];
}
@end
