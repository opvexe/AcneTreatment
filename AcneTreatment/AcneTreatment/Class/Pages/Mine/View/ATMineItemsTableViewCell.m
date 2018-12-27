//
//  ATMineGroupTableViewCell.m
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATMineItemsTableViewCell.h"
#import "ATSettingItemModel.h"
@interface ATMineItemsTableViewCell()
@property(nonatomic,strong)ATSettingItemModel *model;
@end
@implementation ATMineItemsTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"ATMineItemsTableViewCell";
    ATMineItemsTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ATMineItemsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

//-(void)ATSinitConfingViews{
//    self.contentView.backgroundColor = [UIColor AT_BgTableViewColor];
//}

-(void)InitDataWithModel:(ATSettingItemModel *)model{
    self.model = model;
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            [obj removeFromSuperview];
        }
    }];
    
    if (model.datas.count) {
        UIButton *lastButton = nil;
        for (int i = 0; i < model.datas.count; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:button];
            ATSettingItemModel *items = model.datas[i];
            [button setTitle:items.title forState:UIControlStateNormal];
            [button setTitle:items.title forState:UIControlStateHighlighted];
            [button setTitle:items.title forState:UIControlStateSelected];
            [button setTitle:items.title forState:UIControlStateDisabled];
//            [button setImage:ATImageNamed(PlaceholdImageNAME) forState:UIControlStateNormal];
//            [button setImage:ATImageNamed(PlaceholdImageNAME) forState:UIControlStateHighlighted];
//            [button setImage:ATImageNamed(PlaceholdImageNAME) forState:UIControlStateSelected];
//            [button setImage:ATImageNamed(PlaceholdImageNAME) forState:UIControlStateDisabled];
            [button setTitleColor:[UIColor AT_TextColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor AT_TextColor] forState:UIControlStateHighlighted];
            [button setTitleColor:[UIColor AT_TextColor] forState:UIControlStateSelected];
            [button setTitleColor:[UIColor AT_TextColor] forState:UIControlStateDisabled];
            [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
            button.titleLabel.font = [UIFont SYHelveticaFontOfSize:12.0];
            [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 100 + i;
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(35.0f);
                make.top.mas_equalTo(15.0f);
                make.width.mas_equalTo(self).multipliedBy(.2);
                if (lastButton) {
                    make.left.mas_equalTo(lastButton.mas_right);
                }else{
                    make.left.mas_equalTo(self.contentView);
                }
            }];
            lastButton = button;
        }
    }
}

-(void)Click:(UIButton *)sender{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(ClickTableViewCell:AtItems:model:)]) {
        [self.delegate ClickTableViewCell:self AtItems:sender.tag model:self.model];
    }
}

+(CGFloat)getCellHeight:(ATBaseModel *)model{
    return 60.0f;
}
@end
