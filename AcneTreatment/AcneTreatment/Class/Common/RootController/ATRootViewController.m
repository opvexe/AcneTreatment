//
//  ATRootViewController.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATRootViewController.h"

@interface ATRootViewController ()<UITabBarControllerDelegate, CYLTabBarControllerDelegate>

@end

@implementation ATRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}
#pragma mark < CYLTabBarControllerDelegate >
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    [[self cyl_tabBarController] updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control{
    
}


@end
