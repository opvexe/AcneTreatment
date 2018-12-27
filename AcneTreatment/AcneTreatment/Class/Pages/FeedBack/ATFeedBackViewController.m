//
//  ATFeedBackViewController.m
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATFeedBackViewController.h"
#import "WYTextView.h"
@interface ATFeedBackViewController ()
@property(nonatomic,strong)WYTextView *textView;
@property(nonatomic,strong)UIButton *commitButton;
@end

@implementation ATFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"意见反馈";
    [self configViews];
}

-(void)configViews{
    _textView = ({
        WYTextView *iv = [[WYTextView alloc]init];
        [self.view addSubview:iv];
        iv.placeholder = @"请输入您在使用中遇到的问题，我们会积极为您解决。";
        iv.placeholderColor = UIColorFromRGB(0x909090);
        iv.placeholderFont = [UIFont SYPingFangSCLightFontOfSize:14.0f];
        iv.font = [UIFont SYPingFangSCLightFontOfSize:14.0f];
        iv.layer.masksToBounds = YES;
        iv.layer.cornerRadius = 5.0f;
        iv.layer.borderWidth = 0.3f;
        iv.layer.borderColor =UIColorFromRGB(0x909090).CGColor;
        [iv  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Number(10));
            make.left.mas_equalTo(Number(12));
            make.right.mas_equalTo(Number(-12));
            make.height.mas_equalTo(NumberHeight(160.0f));
        }];
        iv;
    });
    
    _commitButton = ({
        UIButton *iv = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:iv];
        [iv setTitle:@"提交" forState:UIControlStateNormal];
        [iv setTitle:@"提交" forState:UIControlStateSelected];
        [iv setTitle:@"提交" forState:UIControlStateDisabled];
        [iv setTitle:@"提交" forState:UIControlStateHighlighted];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [iv setTitleColor:[UIColor whiteColor]  forState:UIControlStateHighlighted];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateSelected];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateDisabled];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateHighlighted];
        iv.titleLabel.font = [UIFont SYHelveticaFontOfSize:14.0];
        iv.showsTouchWhenHighlighted =NO;
        iv.layer.masksToBounds  = YES;
        iv.layer.cornerRadius  = 5.0;
        [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textView.mas_bottom).mas_offset(Number(20));
            make.left.mas_equalTo(Number(12));
            make.right.mas_equalTo(Number(-12));
            make.height.mas_equalTo(Number(44.0f));
        }];
        iv;
    });
}

-(void)Click:(UIButton *)sender{
    
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
