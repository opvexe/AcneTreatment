//
//  ATToolManger+Equipment.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATToolManger.h"

@interface ATToolManger (Equipment)

/**
 *  获取APP  BunddleID
 */
NSString *zcGetAppBunddleID(void);
/**
 *  获取当前手机设置的语言  BOOL
 *  返回是否是英语
 */
int  zcGetAppLanguages(void);
/**
 *  获取手机设置语言
 */
NSString *zcGetLanguages(void);
/**
 *  获取APP名称
 */
NSString *zcGetAppName(void);
/**
 *  获取APP版本号
 */
NSString *zcGetAppVersion(void);
/**
 *  获取手机型号
 */
NSString *zcGetIphoneType(void);
/**
 *   获取当前手机的分辨率
 */
NSString *zcGetScreenScale(void);
/**
 *   获取运营商信息
 */
NSString *zcGetIphoneOperators(void);
/**
 *   获取设备UUID
 */
NSString *zcGetIphoneUUID(void);

/**
 * 是否是平板
 
 @return 平板
 */
- (BOOL)isPad;
@end
