//
//  ATToolManger+TextHeight.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATToolManger.h"

@interface ATToolManger (TextHeight)
/**
 *  获取对应高度
 */
+(CGFloat)getHeightContain:(NSString *)string font:(UIFont *)font Width:(CGFloat) width;

/**
 *  获取对应宽度
 */
+(CGFloat)getWidthContain:(NSString *)string font:(UIFont *)font Height:(CGFloat) height;
/**
 *  获取对应宽度 (中文 + 数字 组合 计算高度)
 */
+ (CGRect)getTextRectWith:(NSString *)str WithMaxWidth:(CGFloat)width  WithlineSpacing:(CGFloat)LineSpacing AddLabel:(UILabel *)label;
+(CGRect)getTextRectWith:(NSString *)str WithMaxWidth:(CGFloat)width WithTextFont:(UIFont*)font  WithlineSpacing:(CGFloat)LineSpacing AddLabel:(UILabel *)label;
@end
