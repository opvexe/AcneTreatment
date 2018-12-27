//
//  ATMineTableViewCell.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATMineTableViewCell.h"
#import "ATSettingItemModel.h"
@interface ATMineTableViewCell()
@property(nonatomic,strong)UILabel *titleLabel;
@end
@implementation ATMineTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"ATMineTableViewCell";
    ATMineTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ATMineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(void)ATSinitConfingViews{
    _titleLabel = ({
        UILabel *iv = [[UILabel alloc]init];
        iv.textColor  =  [UIColor AT_TextColor];
        iv.textAlignment = NSTextAlignmentLeft;
        iv.font = [UIFont SYHelveticaFontOfSize:13.0f];
        iv.numberOfLines = 1;
        [self.contentView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.left.mas_equalTo(10);
            make.width.mas_lessThanOrEqualTo(120.0f);
        }];
        iv;
    });
}

-(void)InitDataWithModel:(ATSettingItemModel *)model{
    self.titleLabel.text = model.title;
    if (model.type == ATSettingItemTypeArrow) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
}

+(CGFloat)getCellHeight:(ATBaseModel *)model{
    return 44.0f;
}
@end
