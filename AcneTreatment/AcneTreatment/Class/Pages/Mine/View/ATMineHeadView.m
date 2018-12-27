//
//  ATMineHeadView.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATMineHeadView.h"
@interface ATMineHeadView()
@property(nonatomic,strong)UIButton *portraitButton;
@property(nonatomic,strong)UILabel *userLabel;
@property(nonatomic,strong)UILabel *coinLabel;
@property(nonatomic,strong)UIImageView *goImageView;
@end
@implementation ATMineHeadView


-(void)ATSinitConfingViews{
    
    _portraitButton = ({
        UIButton *iv = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:iv];
        iv.clipsToBounds = YES;
        iv.layer.cornerRadius = 30.0f;
        iv.layer.masksToBounds = YES;
        [iv setImage:ATImageNamed(PlaceholdImageNAME) forState:UIControlStateNormal];
        iv.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20.0f);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(60.0f, 60.0f));
        }];
        iv;
    });
    
    _goImageView = ({
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:iv];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20.0f);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(12.0f, 12.0f));
        }];
        iv;
    });
    
    _userLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        iv.textColor  = [UIColor AT_TextColor];
        iv.font = [UIFont SYPingFangSCSemiboldFontOfSize:14.0f];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.numberOfLines = 1;
        iv.text = @"SHUMIN";
        [self addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.portraitButton).mas_offset(10.0f);
            make.left.mas_equalTo(self.portraitButton.mas_right).mas_offset(20.0f);
            make.width.mas_lessThanOrEqualTo(120.0f);
            make.height.mas_equalTo(20.0f);
        }];
        iv;
    });
    
    _coinLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        iv.textColor  = [UIColor AT_TextSubTitleColor];
        iv.font = [UIFont SYHelveticaFontOfSize:12.0f];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.numberOfLines = 1;
        iv.text = @"200痘币";
        iv.layer.masksToBounds = YES;
        iv.layer.cornerRadius = 3.0f;
        [self addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.userLabel.mas_bottom).mas_offset(5.0f);
            make.left.mas_equalTo(self.userLabel.mas_left);
            make.width.mas_lessThanOrEqualTo(120.0f);
            make.height.mas_equalTo(20.0f);
        }];
        iv;
    });
}

-(void)InitDataWithModel:(ATBaseModel *)model{
    
}

-(void)Click:(UIButton *)sender{
    
}
@end
