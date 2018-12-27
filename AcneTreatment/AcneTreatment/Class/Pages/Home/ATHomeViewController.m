//
//  ATHomeViewController.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATHomeViewController.h"
#import "ATHomeModel.h"
#import "ATRouter.h"
@interface ATHomeViewController ()

@end

@implementation ATHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *iv = [UIButton buttonWithType:UIButtonTypeCustom];
    iv.frame = CGRectMake(100, 100, 80, 30.0f);
    iv.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:iv];
    [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)Click:(UIButton *)sender{
    id <ATHomeModel>homeMoudle = [[ATRouter router]interfaceForProtocol:@protocol(ATHomeModel)];
    homeMoudle.paramter = @"测试数据";
    UIViewController *viewController = homeMoudle.nextViewController;
    homeMoudle.callBlock = ^(id  _Nonnull parameter) {
        NSLog(@"Call parameter %@",parameter);
    };
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
