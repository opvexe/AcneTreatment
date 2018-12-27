//
//  ATToolManger+Authorization.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATToolManger+Authorization.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import <UserNotifications/UserNotifications.h>
NSString * const PermissionStatusDidChangeNotification = @"PermissionStatusDidChangeNotification";
NSString * const PermissionNameItem = @"PermissionNameItem";
NSString * const PermissionStatusItem = @"PermissionStatusItem";
CLLocationManager *locationManager;
@implementation ATToolManger (Authorization)

/**
 是否有麦克风权限
 
 @return 是否有麦克风权限
 */
- (PrivatePermissionStatus)getAVMediaTypeAudioPermissionStatus{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (status == AVAuthorizationStatusAuthorized) {
        return Authorized;
    } else if (status == AVAuthorizationStatusNotDetermined) {
        return NotDetermined;
    } else if (status == AVAuthorizationStatusRestricted) {
        return AuthorRestricted;
    } else {
        return Denied;
    }
}


/**
 是否有拍照权限
 
 @return 相机权限
 */
- (PrivatePermissionStatus)getAVMediaTypeVideoPermissionStatus{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusAuthorized) {
        return Authorized;
    } else if (status == AVAuthorizationStatusNotDetermined) {
        return NotDetermined;
    } else if (status == AVAuthorizationStatusRestricted) {
        return AuthorRestricted;
    } else {
        return Denied;
    }
}


/**
 * 是否有相册权限
 
 @return 相册权限
 */
- (PrivatePermissionStatus)getPhotoLibraryPermissionStatus{
    PHAuthorizationStatus status=[PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusAuthorized) {
        return Authorized;
    } else if (status == PHAuthorizationStatusNotDetermined) {
        return NotDetermined;
    } else if (status == PHAuthorizationStatusRestricted) {
        return AuthorRestricted;
    } else {
        return Denied;
    }
}


/**
 * 是否有定位权限
 
 @return 定位权限
 */
- (PrivatePermissionStatus)getGPSLibraryPermissionStatus{
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus]  == kCLAuthorizationStatusAuthorizedAlways)) {
        return Authorized;
    } else if ( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        return NotDetermined;
    } else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusRestricted) {
        return AuthorRestricted;
    } else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        return Denied;
    }
    return Denied;
}


/**
 * 是否有通知权限
 
 @return 通知权限
 */
- (PrivatePermissionStatus)getNotificationPermissionStatus{
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types  == UIUserNotificationTypeNone) {
        return Denied;
    } else {
        return Authorized;
    }
}


/**
 * 申请定位权限
 
 @param GPSPermissionType 定位权限
 */
- (void)requestGPSLibraryPermissionWithType:(GPSPermissionType)GPSPermissionType{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    if (GPSPermissionType == GPSPermissionWhenInUse) {
        [locationManager requestWhenInUseAuthorization];
    } else if (GPSPermissionType == GPSPermissionAlways) {
        [locationManager requestAlwaysAuthorization];
    } else if (GPSPermissionType == GPSPermissionBoth) {
        [locationManager requestWhenInUseAuthorization];
        [locationManager requestAlwaysAuthorization];
    }
}


/**
 * 申请麦克风权限
 */
- (void)requestAVMediaTypeAudioPermission{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
        PrivatePermissionStatus permissionStatus;
        if (granted) {
            permissionStatus = Authorized;
        } else{
            permissionStatus = Denied;
        }
        NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(PermissionNameAudio),PermissionNameItem,@(permissionStatus),PermissionStatusItem, nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:PermissionStatusDidChangeNotification object:nil userInfo:userInfo];
    }];
}


/**
 * 申请拍照权限
 */
- (void)requestAVMediaTypeVideoPermission{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        PrivatePermissionStatus permissionStatus;
        if (granted) {
            permissionStatus = Authorized;
        } else {
            permissionStatus = Denied;
        }
        NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(PermissionNameVideo),PermissionNameItem,@(permissionStatus),PermissionStatusItem, nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:PermissionStatusDidChangeNotification object:nil userInfo:userInfo];
    }];
}

/**
 * 申请相册权限
 */
- (void)requestPhotoLibraryPermission{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        PrivatePermissionStatus permissionStatus;
        if (status == PHAuthorizationStatusAuthorized) {
            permissionStatus = Authorized;
        } else if (status == PHAuthorizationStatusNotDetermined) {
            permissionStatus = NotDetermined;
        } else if (status == PHAuthorizationStatusRestricted) {
            permissionStatus = AuthorRestricted;
        } else {
            permissionStatus = Denied;
        }
        NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(PermissionNamePhotoLib),PermissionNameItem,@(permissionStatus),PermissionStatusItem, nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:PermissionStatusDidChangeNotification object:nil userInfo:userInfo];
    }];
}

/**
 * 申请通知权限,iOS10.0以上才可以动态通知获取到的权限
 */
- (void)requestNotificationPermission{
    if (@available(iOS 10.0, *)) {
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UIUserNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
            PrivatePermissionStatus permissionStatus;
            if (granted) {
                permissionStatus = Authorized;
            } else {
                permissionStatus = Denied;
            }
            NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(PermissionNameNotification),PermissionNameItem,@(permissionStatus),PermissionStatusItem, nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:PermissionStatusDidChangeNotification object:nil userInfo:userInfo];
        }];
    } else {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge categories:nil]];  //注册通知
    }
}

/**
 * 打开系统设置
 */
- (void)openSystemSetting{
    NSURL *settingUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:settingUrl]) {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:settingUrl options:[NSDictionary dictionary] completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:settingUrl];
        }
    }
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    PrivatePermissionStatus permissionStatus;
    if (status == kCLAuthorizationStatusNotDetermined) {
        permissionStatus = NotDetermined;
    } else if (status == kCLAuthorizationStatusRestricted) {
        permissionStatus = AuthorRestricted;
    } else if (status == kCLAuthorizationStatusDenied) {
        permissionStatus = Denied;
    } else {
        permissionStatus = Authorized;
    }
    NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(PermissionNameGPS),PermissionNameItem,@(permissionStatus),PermissionStatusItem, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:PermissionStatusDidChangeNotification object:nil userInfo:userInfo];
}

@end
