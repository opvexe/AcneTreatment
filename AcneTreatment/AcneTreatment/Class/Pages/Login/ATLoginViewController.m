//
//  ATLoginViewController.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATLoginViewController.h"
#import "ATAlertShowView.h"
typedef NS_ENUM(NSUInteger, ATLoginType) {
    ATLoginTypeWeixin = 1 << 0,
    ATLoginTypeIphone = 1 << 1,
};
@interface ATLoginViewController ()
@property (nonatomic,strong) UIButton *weixinButton;
@property (nonatomic,strong) UIButton *iphoneButton;
@property (nonatomic,strong) UIImageView *bgImageView;
@end

@implementation ATLoginViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configViews];
}

-(void)configViews{
    
    _bgImageView = ({
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:iv];
        iv.image = ATImageNamed(@"");
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.userInteractionEnabled = YES;
        iv.clipsToBounds = YES;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            if (iOS11) {
                make.edges.mas_equalTo(self.view.safeAreaInsets);
            }else{
                make.edges.mas_equalTo(self.view);
            }
        }];
        iv;
    });
    
    _weixinButton = ({
        UIButton *iv = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgImageView addSubview:iv];
        [iv setTitle:@"微信一键登录" forState:UIControlStateNormal];
        [iv setTitle:@"微信一键登录" forState:UIControlStateSelected];
        [iv setTitle:@"微信一键登录" forState:UIControlStateDisabled];
        [iv setTitle:@"微信一键登录" forState:UIControlStateHighlighted];
        [iv setTitleColor:[UIColor AT_TextColor] forState:UIControlStateNormal];
        [iv setTitleColor:[UIColor AT_TextColor] forState:UIControlStateSelected];
        [iv setTitleColor:[UIColor AT_TextColor] forState:UIControlStateDisabled];
        [iv setTitleColor:[UIColor AT_TextColor]  forState:UIControlStateHighlighted];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateSelected];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateDisabled];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateHighlighted];
        iv.adjustsImageWhenHighlighted =NO;
        iv.showsTouchWhenHighlighted =NO;
        iv.titleLabel.font = [UIFont SYHelveticaFontOfSize:14.0];
        iv.layer.masksToBounds  = YES;
        iv.layer.cornerRadius  = 5.0;
        iv.tag = ATLoginTypeWeixin;
        [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            if (iOS11) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).mas_offset(-Number(60.0f));
            }else{
                make.bottom.mas_equalTo(-Number(60.0f));
            }
            make.left.mas_equalTo(Number(20.0f));
            make.right.mas_equalTo(-Number(20.0f));
            make.height.mas_equalTo(Number(44.0f));
        }];
        iv;
    });
    
    _iphoneButton = ({
        UIButton *iv = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgImageView addSubview:iv];
        [iv setTitle:@"手机登录" forState:UIControlStateNormal];
        [iv setTitle:@"手机登录" forState:UIControlStateSelected];
        [iv setTitle:@"手机登录" forState:UIControlStateDisabled];
        [iv setTitle:@"手机登录" forState:UIControlStateHighlighted];
        [iv setTitleColor:[UIColor AT_TextColor] forState:UIControlStateNormal];
        [iv setTitleColor:[UIColor AT_TextColor] forState:UIControlStateSelected];
        [iv setTitleColor:[UIColor AT_TextColor] forState:UIControlStateDisabled];
        [iv setTitleColor:[UIColor AT_TextColor]  forState:UIControlStateHighlighted];
        iv.showsTouchWhenHighlighted =NO;
        iv.titleLabel.font = [UIFont SYHelveticaFontOfSize:14.0];
        iv.tag = ATLoginTypeIphone;
        [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-Number(20.0f));
            make.top.mas_equalTo(self.weixinButton.mas_bottom).mas_offset(Number(10.0f));
            make.height.mas_equalTo(Number(20.0f));
            make.width.mas_lessThanOrEqualTo(Number(120.0f));
        }];
        iv;
    });
    
}

///MARK: TOOD
-(void)Click:(UIButton *)sender{
    switch (sender.tag) {
        case ATLoginTypeWeixin:{
            
        }
            break;
        case ATLoginTypeIphone:{
            ATAlertShowView *show = [ATAlertShowView showWithCompelet:^(ATAlertShowViewType type, NSString *iphone, NSString *code) {
                switch (type) {
                    case ATAlertShowViewTypeCode:{
                        
                    }
                        break;
                    case ATAlertShowViewTypeLogin:{
                        
                    }
                        break;
                    default:
                        break;
                }
            }];
            [show dismiss];
            
        }
            break;
        default:
            break;
    }
}

@end
