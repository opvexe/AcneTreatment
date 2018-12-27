//
//  ATTabBarControllerConfig.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATTabBarControllerConfig.h"
#import "ATBaseNavigationViewController.h"
#import "ATRootViewController.h"
#import "ATHomeViewController.h"
#import "ATOppointViewController.h"
#import "ATCaretasViewController.h"
#import "ATMineViewController.h"
#import "ATMessageViewController.h"

#import "ATHomeModel.h"
#import "ATRouter.h"
@interface ATTabBarControllerConfig ()
@property (nonatomic, strong) CYLTabBarController *tabBarController;
@end

@implementation ATTabBarControllerConfig

- (CYLTabBarController *)tabBarController {
    if (!_tabBarController) {
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;
        UIOffset titlePositionAdjustment = UIOffsetZero;
        ATRootViewController *tabBarController = [ATRootViewController tabBarControllerWithViewControllers:self.viewControllers
                                                                                     tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                               imageInsets:imageInsets
                                                                                   titlePositionAdjustment:titlePositionAdjustment];
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
//    ATHomeViewController *homeViewController = [[ATHomeViewController alloc] init];
    
     id <ATHomeModel>homeMoudle = [[ATRouter router]interfaceForProtocol:@protocol(ATHomeModel)];
    UIViewController *homeNavigationController = [[ATBaseNavigationViewController alloc]
                                                  initWithRootViewController:homeMoudle.interfaceViewController];
    ATOppointViewController *oppointViewController  =[[ATOppointViewController alloc]init];
    UIViewController *oppointNavigationController = [[ATBaseNavigationViewController alloc]initWithRootViewController:oppointViewController];
    
    ATCaretasViewController *caretasViewController =[[ATCaretasViewController alloc]init];
    UIViewController *caretasNavigationController = [[ATBaseNavigationViewController alloc]initWithRootViewController:caretasViewController];
    
    ATMessageViewController *messageViewController =[[ATMessageViewController alloc]init];
    UIViewController *messageNavigationController = [[ATBaseNavigationViewController alloc]initWithRootViewController:messageViewController];
    
    ATMineViewController *mineViewController =[[ATMineViewController alloc]init];
    UIViewController *mineNavigationController = [[ATBaseNavigationViewController alloc]initWithRootViewController:mineViewController];
    
    NSArray *viewControllers = @[
                                 homeNavigationController,
                                 oppointNavigationController,
                                 caretasNavigationController,
                                 messageNavigationController,
                                 mineNavigationController,
                                 ];
    return viewControllers;
}


- (NSArray *)tabBarItemsAttributesForController {
    
    NSDictionary *homeTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"首页",
                                                CYLTabBarItemImage : @"home_nor",
                                                CYLTabBarItemSelectedImage : @"home_sel",
                                                };
    NSDictionary *oppointTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"预约",
                                                   CYLTabBarItemImage : @"oppoint_nor",
                                                   CYLTabBarItemSelectedImage :@"oppoint_sel",
                                                   };
    NSDictionary *caretasTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"痘友圈",
                                                   CYLTabBarItemImage :@"push_nor",
                                                   CYLTabBarItemSelectedImage : @"push_sel",
                                                   };
    NSDictionary *messageTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"消息",
                                                   CYLTabBarItemImage :@"message_nor",
                                                   CYLTabBarItemSelectedImage : @"message_sel",
                                                   };
    NSDictionary *mineTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"我的",
                                                CYLTabBarItemImage :@"mine_nor",
                                                CYLTabBarItemSelectedImage : @"mine_sel",
                                                };
    
    
    NSArray *tabBarItemsAttributes = @[
                                       homeTabBarItemsAttributes,
                                       oppointTabBarItemsAttributes,
                                       caretasTabBarItemsAttributes,
                                       messageTabBarItemsAttributes,
                                       mineTabBarItemsAttributes,
                                       ];
    return tabBarItemsAttributes;
}

- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    tabBarController.tabBarHeight = AT_TabbarHeight;
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = UIColorFromRGB(0x909090);
    normalAttrs[NSFontAttributeName] = [UIFont SYHelveticaFontOfSize:10.0];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    selectedAttrs[NSFontAttributeName] = [UIFont SYHelveticaFontOfSize:10.0];
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
}

@end
