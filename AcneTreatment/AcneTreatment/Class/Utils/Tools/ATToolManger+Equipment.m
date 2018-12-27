//
//  ATToolManger+Equipment.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATToolManger+Equipment.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <sys/utsname.h>
@implementation ATToolManger (Equipment)

NSString *zcGetAppBunddleID(void){
    NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
    return identifier;
}

int  zcGetAppLanguages(void){
    NSString * lanStr  = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    if ([lanStr hasPrefix:@"en"]) {
        return 1;
    }else if ([lanStr hasPrefix:@"zh-Hans"]){
        return 0;
    }
    return 0;
}

NSString *zcGetLanguages(void){
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
}

NSString *zcGetAppName(void){
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

NSString *zcGetAppVersion(void){
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

NSString *zcGetIphoneType(void){
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,3"])  return@"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,2"])  return@"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone9,4"])  return@"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone10,1"]) return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,4"]) return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,2"]) return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,5"]) return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,3"]) return@"iPhone X";
    
    if([platform isEqualToString:@"iPhone10,6"]) return@"iPhone X";
    
    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
    
    // http://www.jianshu.com/p/02bba9419df8   参考资料
    // https://www.cnblogs.com/weiming4219/p/7693304.html
}

NSString *zcGetScreenScale(void){
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"320x480";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"320x480";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"320x480";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"320x480";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"320x480";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"640x960";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"640x960";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"640x1136";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"640x1136";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"640x1136";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"640x1136";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"640x1136";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"640x1136";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"1242x2208";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"750x1334";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"750x1334";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"1242x2208";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"640x1136";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"750x1334";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"1242x2208";
    
    if ([platform isEqualToString:@"iPod1,1"]) return @"320x480";
    
    if ([platform isEqualToString:@"iPod2,1"]) return @"320x480";
    
    if ([platform isEqualToString:@"iPod3,1"]) return @"320x480";
    
    if ([platform isEqualToString:@"iPod4,1"]) return @"640x960";
    
    if ([platform isEqualToString:@"iPod5,1"]) return @"640x1136";
    
    if ([platform isEqualToString:@"iPad1,1"]) return @"1024x768";
    
    if ([platform isEqualToString:@"iPad2,1"]) return @"1024x768";
    
    if ([platform isEqualToString:@"iPad2,2"]) return @"1024x768";
    
    if ([platform isEqualToString:@"iPad2,3"]) return @"1024x768";
    
    if ([platform isEqualToString:@"iPad2,4"]) return @"1024x768";
    
    if ([platform isEqualToString:@"iPad2,5"]) return @"1024x768";
    
    if ([platform isEqualToString:@"iPad2,6"]) return @"1024x768";
    
    if ([platform isEqualToString:@"iPad2,7"]) return @"1024x768";
    
    if ([platform isEqualToString:@"iPad3,1"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad3,2"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad3,3"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad3,4"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad3,5"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad3,6"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad4,1"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad4,2"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad4,3"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad4,4"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad4,5"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"iPad4,6"]) return @"2048x1536";
    
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
}

NSString *zcGetIphoneOperators(void){
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *imsi = [NSString stringWithFormat:@"%@%@", [carrier mobileCountryCode], [carrier mobileNetworkCode]];
    if ([imsi isEqualToString:@"46000"] || [imsi isEqualToString:@"46002"] || [imsi isEqualToString:@"46007"]) {
        return  @"中国移动";
    }else if([imsi isEqualToString:@"46001"] || [imsi isEqualToString:@"46006"] || [imsi isEqualToString:@"46009"]){
        return @"中国联通";
    }else if ([imsi isEqualToString:@"46003"] || [imsi isEqualToString:@"46005"] || [imsi isEqualToString:@"46011"]){
        return @"中国电信";
    }else if ([imsi isEqualToString:@"46020"]){
        return @"铁通";
    }
    return @"未知";
}

NSString *zcGetIphoneUUID(void){
    NSString * retrieveuuid;
    retrieveuuid =  [[UIDevice currentDevice].identifierForVendor UUIDString];
    retrieveuuid = [NSString stringWithFormat:@"2%@",retrieveuuid];
    retrieveuuid = [retrieveuuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return retrieveuuid;
}

- (BOOL)isPad{
    return [[UIDevice currentDevice].model isEqualToString:@"iPad"];
}

@end
