//
//  ATItemsModel.h
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATBaseModel.h"

typedef NS_ENUM(NSInteger, ATSettingItemType) {
    ATSettingItemTypeNone,
    ATSettingItemTypeArrow,
    ATSettingItemTypeSwitch,
};

@interface ATSettingItemModel : ATBaseModel
/**
 * 图标
 */
@property(nonatomic,copy)NSString *icon;
/**
 * 标题
 */
@property (nonatomic, copy) NSString *title;
/**
 * 类型
 */
@property(nonatomic,assign)ATSettingItemType type;
/**
 * 区头文字
 */
@property(nonatomic,copy)NSString *headTitle;
/**
 * 副标题
 */
@property(nonatomic,copy)NSString *subTitle;

@end
