//
//  ATAlertShowView.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATAlertShowView.h"
#import "ATMessageEventButton.h"

@interface ATAlertShowView()<ATMessageEventButtonDelegate>
@property (nonatomic,copy)void(^complete)(ATAlertShowViewType type,NSString  *iphone,NSString *code);
@property (nonatomic,strong) KLCPopup *popup;
@property (nonatomic,strong) UIView *bgImageView;
@property (nonatomic,strong) UITextField *iphoneTextField;
@property (nonatomic,strong) UITextField *codeTextField;
@property (nonatomic,strong) ATMessageEventButton *CodeButton;
@property (nonatomic,strong) UIButton *loginButton;
@end
@implementation ATAlertShowView

+ (ATAlertShowView *)showWithCompelet:(void(^)(ATAlertShowViewType type,NSString  *iphone,NSString *code))completeBlock{
    ATAlertShowView *view = [[ATAlertShowView alloc] init];
    KLCPopup *popup = [KLCPopup popupWithContentView:view
                                            showType:KLCPopupShowTypeGrowIn
                                         dismissType:KLCPopupDismissTypeShrinkOut
                                            maskType:KLCPopupMaskTypeDimmed
                            dismissOnBackgroundTouch:YES
                               dismissOnContentTouch:NO];
    
    [popup  show];
    view.complete = completeBlock;
    view.popup = popup;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame{
    frame = CGRectMake(0, 0, 300,245);
    self = [super initWithFrame:frame];
    if (self) {
        
        [self configViews];
        
    }
    return self;
}

-(void)configViews{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 8.0f;
    
    _bgImageView = ({
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:iv];
        iv.image = ATImageNamed(@"");
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(80.0f);
        }];
        iv;
    });
    
    _iphoneTextField = ({
        UITextField *iv = [[UITextField alloc]initWithFrame:CGRectZero];
        [self addSubview:iv];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font  = [UIFont SYHelveticaFontOfSize:14.0];
        iv.textColor = [UIColor AT_TextColor];
        iv.keyboardType = UIKeyboardTypeNumberPad;
        iv.clearButtonMode = UITextFieldViewModeWhileEditing;
        iv.placeholder = @"请输入手机号码";
        iv.layer.borderWidth  = 1.0f;
        iv.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
        iv.leftViewMode = UITextFieldViewModeAlways;
        iv.layer.borderColor = [UIColor AT_BgLineColor].CGColor;
        iv.layer.cornerRadius = 5.0f;
        [iv setValue:[UIColor AT_TextGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20.0f);
            make.top.mas_equalTo(self.bgImageView.mas_bottom);
            make.right.mas_equalTo(-20.0f);
            make.height.mas_equalTo(44.0f);
        }];
        iv;
    });
    
    _codeTextField = ({
        UITextField *iv = [[UITextField alloc]initWithFrame:CGRectZero];
        [self addSubview:iv];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font  = [UIFont SYHelveticaFontOfSize:14.0];
        iv.textColor = [UIColor AT_TextColor];
        iv.keyboardType = UIKeyboardTypeNumberPad;
        iv.placeholder = @"请输入验证码";
        iv.layer.borderWidth  = 1.0f;
        iv.layer.borderColor = [UIColor AT_BgLineColor].CGColor;
        iv.layer.cornerRadius = 5.0f;
        iv.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
        iv.leftViewMode = UITextFieldViewModeAlways;
        [iv setValue:[UIColor AT_TextGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20.0f);
            make.top.mas_equalTo(self.iphoneTextField.mas_bottom).mas_offset(10.0f);
            make.width.mas_equalTo(160.0f);
            make.height.mas_equalTo(44.0f);
        }];
        iv;
    });
    
    _CodeButton = ({
        ATMessageEventButton *iv = [ATMessageEventButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:iv];
        [iv setTitle:@"获取验证码" forState:UIControlStateNormal];
        [iv setTitle:@"获取验证码" forState:UIControlStateHighlighted];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateHighlighted];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateSelected];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateDisabled];
        [iv .titleLabel setFont:[UIFont SYHelveticaFontOfSize:14.0f]];
        [iv setTitleColor:[UIColor whiteColor]  forState:UIControlStateNormal];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        iv.showsTouchWhenHighlighted=NO;
        iv.layer.cornerRadius   = 5.0f;
        iv.layer.masksToBounds  = YES;
        iv.countdownBeginNumber                      = 60;
        iv.delegate                                  = self;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.codeTextField.mas_right).mas_offset(-10.0f);
            make.top.mas_equalTo(self.iphoneTextField.mas_bottom).mas_offset(10.0f);
            make.right.mas_equalTo(-20.0f);
            make.height.mas_equalTo(44.0f);
        }];
        iv;
    });
    
    _loginButton = ({
        UIButton *iv = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:iv];
        [iv setTitle:@"立即登录" forState:UIControlStateNormal];
        [iv setTitle:@"立即登录" forState:UIControlStateSelected];
        [iv setTitle:@"立即登录" forState:UIControlStateDisabled];
        [iv setTitle:@"立即登录" forState:UIControlStateHighlighted];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [iv setTitleColor:[UIColor whiteColor]  forState:UIControlStateHighlighted];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateHighlighted];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateSelected];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateDisabled];
        iv.showsTouchWhenHighlighted =NO;
        iv.titleLabel.font = [UIFont SYHelveticaFontOfSize:16.0];
        iv.layer.cornerRadius = 5.0f;
        iv.layer.masksToBounds = YES;
        [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20.0f);
            make.right.mas_equalTo(-20.0f);
            make.top.mas_equalTo(self.codeTextField.mas_bottom).mas_offset(10.0f);
            make.height.mas_equalTo(44.0f);
        }];
        iv;
    });
}

#pragma mark ATMessageEventButtonDelegate
-(void)ClickedWithMessageButton:(ATMessageEventButton*)messageButton{
    if (self.complete) {
        self.complete(ATAlertShowViewTypeCode, self.iphoneTextField.text, nil);
    }
}

-(void)Click:(UIButton *)sender{
    if (self.complete) {
        self.complete(ATAlertShowViewTypeLogin, self.iphoneTextField.text,self.codeTextField.text);
    }
}

- (void)dismiss{
    [self.popup dismiss:YES];
}
@end
