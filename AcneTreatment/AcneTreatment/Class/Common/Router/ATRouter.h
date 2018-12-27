//
//  ATRouter.h
//  AcneTreatment
//
//  Created by FaceBook on 2018/12/27.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATRouter : NSObject<NSCopying,NSMutableCopying>
/*
 单利路由模式
 */
+ (instancetype)router;
/*
  通过协议获取对应的Module
 */
- (id)interfaceForProtocol:(Protocol *)protocol;
/*
 通过URL获取对应的Module
 */
- (id)interfaceForURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
