//
//  ATSettingBottomView.m
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATSettingBottomView.h"
@interface ATSettingBottomView()
@property(nonatomic,strong)UIButton *exitButton;
@end
@implementation ATSettingBottomView

-(void)ATSinitConfingViews{
    
    _exitButton = ({
        UIButton *iv = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:iv];
        [iv setTitle:@"退出登录" forState:UIControlStateNormal];
        [iv setTitle:@"退出登录" forState:UIControlStateSelected];
        [iv setTitle:@"退出登录" forState:UIControlStateDisabled];
        [iv setTitle:@"退出登录" forState:UIControlStateHighlighted];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [iv setTitleColor:[UIColor whiteColor]  forState:UIControlStateHighlighted];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateSelected];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateDisabled];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateHighlighted];
        iv.titleLabel.font = [UIFont SYHelveticaFontOfSize:16.0];
        iv.showsTouchWhenHighlighted =NO;
        iv.layer.masksToBounds  = YES;
        iv.layer.cornerRadius  = 5.0;
        [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.left.mas_equalTo(20.0f);
            make.height.mas_equalTo(40.0f);
            make.bottom.mas_equalTo(-20.0f);
        }];
        iv;
    });
}

-(void)Click:(UIButton *)sender{
    if (self.resultBlock) {
        self.resultBlock(sender.tag);
    }
}

@end
