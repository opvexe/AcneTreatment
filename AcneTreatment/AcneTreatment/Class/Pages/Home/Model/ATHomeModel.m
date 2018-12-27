//
//  ATHomeModel.m
//  AcneTreatment
//
//  Created by FaceBook on 2018/12/27.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATHomeModel.h"
#import "ATHomeViewController.h"
#import "ATHomeDetailViewController.h"
@implementation ATHomeModel
@synthesize interfaceViewController;
@synthesize nextViewController;
@synthesize paramter;
@synthesize callBlock;

- (UIViewController *)interfaceViewController {
    ATHomeViewController *controller = [[ATHomeViewController alloc]init];
    controller.interface = self;
    interfaceViewController = (UIViewController *)controller;
    return interfaceViewController;
}

-(UIViewController *)nextViewController{
    ATHomeDetailViewController *controller = [[ATHomeDetailViewController alloc]init];
    controller.interface = self;
    nextViewController = (UIViewController *)controller;
    return nextViewController;
}

@end
