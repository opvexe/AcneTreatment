//
//  AppDelegate+ATCategory.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "AppDelegate+ATCategory.h"
#import "ATLoginViewController.h"
#import "ATTabBarControllerConfig.h"
#import "ATBaseNavigationViewController.h"
@implementation AppDelegate (ATCategory)

-(void)switchRootController{
    ATTabBarControllerConfig  *tabBarControllerConfig = [ATTabBarControllerConfig new];
    self.window.rootViewController = tabBarControllerConfig.tabBarController;
}
@end
