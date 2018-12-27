//
//  ATToolManger.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATToolManger : NSObject
/**
 *  将图片转换成颜色
 */
+(UIColor *)img2color:(UIImage *)image;
/**
 *  获取当前视频帧图片
 */
+(nullable UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;
/**
 *  获取当前视频第一帧
 */
+(nullable UIImage *)firstFrameWithVideoURL:(NSURL *)url size:(CGSize)size;
/**
 *  获取视频文件的时长
 */
+ (CGFloat)getVideoLengthWithVideoUrl:(NSURL *)URL;
/**
 *  压缩视频，返回压缩地址
 */
+ (NSURL *)condenseVideoWithUrl:(NSURL *)url;
/**
 *  获取视频文件的大小，返回的是单位是KB
 */
+ (CGFloat)getFileSizeWithPath:(NSString *)path;
/**
 *  获取当前时间
 */
+ (NSString *)getCurrentTime;
/**
 *  判断摄像头权限
 */
+(BOOL)getMediaTypeVideo;
/**
 *  判断麦克风权限
 */
+(BOOL)canRecord;
/**
 *  64base字符串转图片
 */
+ (UIImage *)stringToImage:(NSString *)str;
/**
 *  图片转64base字符串
 */
+ (NSString *)imageToString:(UIImage *)image;
@end
