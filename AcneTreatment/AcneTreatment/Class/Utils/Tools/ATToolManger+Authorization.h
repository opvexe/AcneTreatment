//
//  ATToolManger+Authorization.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATToolManger.h"
#import <CoreLocation/CoreLocation.h>
///申请的权限
typedef NS_ENUM(NSUInteger, PrivatePermissionName) {
    PermissionNameAudio,     //麦克风权限 Microphone permissions
    PermissionNameVideo,     //摄像头权限 Camera permissions
    PermissionNamePhotoLib,  //相册权限 Photo album permissions
    PermissionNameGPS,       //GPS权限 GPS permissions
    PermissionNameNotification, //通知权限 Notification permissions
};

///申请定位权限的类型
typedef NS_ENUM(NSUInteger, GPSPermissionType) {
    GPSPermissionWhenInUse,      //申请使用期间访问位置 Access location WhenInUse
    GPSPermissionAlways,         //申请一直访问位置  Always
    GPSPermissionBoth            //两者都申请 Both
};

///申请权限状态 Application permissions status
typedef NS_ENUM(NSUInteger, PrivatePermissionStatus) {
    Authorized = 1,  //用户允许 Authorized
    AuthorRestricted,//被限制修改不了状态,比如家长控制选项等
    Denied,          //用户拒绝 Denied
    NotDetermined    //用户尚未选择 NotDetermined
};

FOUNDATION_EXPORT NSString * const PermissionStatusDidChangeNotification; ///系统权限授权变化通知
FOUNDATION_EXPORT NSString * const PermissionNameItem; ///系统变化通知中的userinfo的key，标记名字
FOUNDATION_EXPORT NSString * const PermissionStatusItem; ///系统变化通知中的userinfo的key，标记状态
@interface ATToolManger (Authorization)<CLLocationManagerDelegate>

/**
 是否有麦克风权限
 
 @return 是否有麦克风权限
 */
- (PrivatePermissionStatus)getAVMediaTypeAudioPermissionStatus;


/**
 是否有拍照权限
 
 @return 相机权限
 */
- (PrivatePermissionStatus)getAVMediaTypeVideoPermissionStatus;


/**
 * 是否有相册权限
 
 @return 相册权限
 */
- (PrivatePermissionStatus)getPhotoLibraryPermissionStatus;


/**
 * 是否有定位权限
 
 @return 定位权限
 */
- (PrivatePermissionStatus)getGPSLibraryPermissionStatus;


/**
 * 是否有通知权限
 
 @return 通知权限
 */
- (PrivatePermissionStatus)getNotificationPermissionStatus;


/**
 * 申请定位权限
 
 @param GPSPermissionType 定位权限
 */
- (void)requestGPSLibraryPermissionWithType:(GPSPermissionType)GPSPermissionType;


/**
 * 申请麦克风权限
 */
- (void)requestAVMediaTypeAudioPermission;


/**
 * 申请拍照权限
 */
- (void)requestAVMediaTypeVideoPermission;

/**
 * 申请相册权限
 */
- (void)requestPhotoLibraryPermission;

/**
 * 申请通知权限,iOS10.0以上才可以动态通知获取到的权限
 */
- (void)requestNotificationPermission;

/**
 * 打开系统设置
 */
- (void)openSystemSetting;

@end
