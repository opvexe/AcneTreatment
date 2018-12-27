//
//  ATToolManger+Appstore.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATToolManger.h"
#import <StoreKit/StoreKit.h>

///打开指定软件的appstore样式类型
typedef NS_ENUM(NSUInteger, JumpStoreType) {
    JumpStoreTypeInAppStore,  //强制跳转到appsStore。
    JumpStoreTypeInApp,      //强制在app中弹出appStore，ios10.3版本以下无反应。
    JumpStoreTypeAuto         //10.3版本以下跳转appStore，10.3版本以上在app中弹出Appstore。
};

///评分样式类型 Scoring style type
typedef NS_ENUM(NSUInteger, ScoreType) {
    ScoreTypeInAppStore,  //强制跳转到appsStore中评分。
    ScoreTypeInApp,      //强制在app中弹出评分弹窗，ios10.3版本以下无反应。
    ScoreTypeAuto         //10.3版本以下去appStore评分，10.3版本以上在app中弹出评分弹窗
};


@interface ATToolManger (Appstore)<SKStoreProductViewControllerDelegate>

/**
 * 打开appstore的预览下载页面
 
 @param appleID 指定软件的appid
 @param jumpStoreType  跳转到appstore样式类型
 */
- (void)openAppStoreWithAppleID:(NSString *)appleID withType:(JumpStoreType)jumpStoreType;

/**
 * appstore好评弹窗
 
 @param appleID 评分的appid
 @param scoreType 评分样式类型
 */
- (void)giveScoreWithAppleID:(NSString *)appleID withType:(ScoreType)scoreType;
/**
 * 自动好评弹窗
 * 如果能在APP内好评，优先在app内弹窗好评，但是苹果为了防止滥用弹窗，一个应用内每年最多使用3次好评弹窗。所以超过三次之后，之后会使用跳转到appstore的方式。如果手机版本不能在app内弹窗好评，就会跳转到appstore去评分
 @param appleID 评分的appid
 @param hasRequestTime 已经弹窗过弹窗的次数
 @param totalTimeLimit 需要限制弹窗评分的次数，默认值为3，大于3的时候为默认值
 */
- (void)giveScoreAutoTypeWithAppleID:(NSString *)appleID withHasRequestTime:(NSUInteger)hasRequestTime withTotalTimeLimit:(NSUInteger)totalTimeLimit;

@end
