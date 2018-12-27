//
//  ATSettingTableViewCell.m
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATSettingTableViewCell.h"
#import "ATSettingItemModel.h"
@interface ATSettingTableViewCell()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *subTitleLabel;
@end

@implementation ATSettingTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"ATSettingTableViewCell";
    ATSettingTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ATSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(void)ATSinitConfingViews{
    
    _titleLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        iv.textColor  = [UIColor AT_TextColor];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font = [UIFont SYHelveticaFontOfSize:13.0f];
        [self.contentView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.left.mas_equalTo(10);
            make.width.mas_lessThanOrEqualTo(160.0f);
        }];
        iv;
    });
    
    _subTitleLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        iv.textColor  = [UIColor AT_TextSubTitleColor];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font = [UIFont SYHelveticaFontOfSize:12.0f];
        [self.contentView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.right.mas_equalTo(-10);
            make.width.mas_lessThanOrEqualTo(120.0f);
        }];
        iv;
    });
}

-(void)InitDataWithModel:(ATSettingItemModel *)model{
    self.titleLabel.text = model.title;
    self.subTitleLabel.text = model.subTitle;
    if (model.type == ATSettingItemTypeArrow) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
}
@end
