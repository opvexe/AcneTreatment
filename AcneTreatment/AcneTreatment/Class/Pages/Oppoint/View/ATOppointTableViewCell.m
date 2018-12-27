//
//  ATOppointTableViewCell.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATOppointTableViewCell.h"

@interface ATOppointTableViewCell()
@property(nonatomic,strong)FLAnimatedImageView *shopImageView;
@property(nonatomic,strong)UILabel *shopLabel;
@property(nonatomic,strong)UILabel *buyerNumLabel;
@property(nonatomic,strong)UILabel *praiseLabel;
@property(nonatomic,strong)UILabel *iphoneLabel;
@property(nonatomic,strong)UILabel *cityLabel;
@property(nonatomic,strong)UIButton *GPSButton;
@property(nonatomic,strong)UIButton *intoShopButton;
@end

@implementation ATOppointTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"ATOppointTableViewCell";
    ATOppointTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ATOppointTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(void)ATSinitConfingViews{
    _shopImageView = ({
        FLAnimatedImageView *iv = [[FLAnimatedImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:iv];
        iv.image = ATImageNamed(PlaceholdImageNAME);
        iv.clipsToBounds = YES;
        iv.contentMode = UIViewContentModeScaleAspectFill;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(100.0f);
        }];
        iv;
    });
    
    _shopLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        [self.contentView addSubview:iv];
        iv.numberOfLines = 2;
        iv.text = @"北京市朝阳区祛痘护理宝专卖店(旌旗店)";
        iv.textColor  = [UIColor AT_TextColor];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font = [UIFont SYHelveticaFontOfSize:12.0f];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.shopImageView.mas_right).mas_offset(Number(10.0f));
            make.top.mas_equalTo(self.shopImageView.mas_top).mas_offset(Number(10.0f));
            make.right.mas_equalTo(-Number(5.0f));
        }];
        iv;
    });
    
    _cityLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        [self.contentView addSubview:iv];
        iv.text = @"地址：北京市海淀区";
        iv.textColor  = [UIColor AT_TextColor];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font = [UIFont SYHelveticaFontOfSize:10.0f];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.shopLabel.mas_left);
            make.top.mas_equalTo(self.shopLabel.mas_bottom);
            make.right.mas_equalTo(-Number(5.0f));
            make.height.mas_equalTo(NumberHeight(20.0f));
        }];
        iv;
    });
    
    _iphoneLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        [self.contentView addSubview:iv];
        iv.text = @"联系电话：40015252";
        iv.textColor  = [UIColor AT_TextColor];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font = [UIFont SYHelveticaFontOfSize:10.0f];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.shopLabel.mas_left);
            make.top.mas_equalTo(self.cityLabel.mas_bottom);
            make.right.mas_equalTo(-Number(5.0f));
            make.height.mas_equalTo(NumberHeight(20.0f));
        }];
        iv;
    });
    
    _buyerNumLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        [self.contentView addSubview:iv];
        iv.text = @"74299人问诊";
        iv.textColor  = [UIColor AT_TextSubTitleColor];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font = [UIFont SYHelveticaFontOfSize:10.0f];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.shopLabel.mas_left);
            make.top.mas_equalTo(self.iphoneLabel.mas_bottom);
            make.height.mas_equalTo(NumberHeight(20.0f));
            make.width.mas_lessThanOrEqualTo(Number(120.0f));
        }];
        iv;
    });
    
    _praiseLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        [self.contentView addSubview:iv];
        iv.text = @"99%好评";
        iv.textColor  = [UIColor AT_TextSubTitleColor];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font = [UIFont SYHelveticaFontOfSize:10.0f];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.buyerNumLabel.mas_right).mas_offset(Number(20.0f));
            make.top.mas_equalTo(self.iphoneLabel.mas_bottom);
            make.height.mas_equalTo(NumberHeight(20.0f));
            make.width.mas_equalTo(Number(60.0f));
        }];
        iv;
    });
    
    _GPSButton = ({
        UIButton *iv = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:iv];
        [iv setTitle:@"预约" forState:UIControlStateNormal];
        iv.titleLabel.font = [UIFont SYHelveticaFontOfSize:10.0];
        [iv setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [iv setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        iv.layer.masksToBounds = YES;
        iv.layer.cornerRadius = 15.0f;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cityLabel.mas_top);
            make.right.mas_equalTo(-10.0f);
            make.size.mas_equalTo(CGSizeMake(30.0f, 30.0f));
        }];
        iv;
    });
    
    _intoShopButton = ({
        UIButton *iv = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:iv];
        [iv setTitle:@"进店" forState:UIControlStateNormal];
        [iv setTitleColor:[UIColor AT_TextColor] forState:UIControlStateNormal];
        iv.titleLabel.textAlignment = NSTextAlignmentRight;
        iv.titleLabel.font = [UIFont SYHelveticaFontOfSize:11.0];
        [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iphoneLabel.mas_bottom);
            make.right.mas_equalTo(-10.0f);
            make.width.mas_equalTo(Number(40.0f));
            make.height.mas_equalTo(NumberHeight(20.0f));
        }];
        iv;
    });
}

-(void)Click:(UIButton *)sender{
    NSLog(@"GPS");
}

- (void)setFrame:(CGRect)frame{
    frame.origin.y += 10;
    frame.size.height -= 10;
    frame.origin.x += 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

@end
