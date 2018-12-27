//
//  ATMoudleProtocol.h
//  AcneTreatment
//
//  Created by FaceBook on 2018/12/27.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ATCallBlock)(id parameter);


@protocol ATMoudleProtocol <NSObject>
/*
 协议接口控制器
 */
@property(nonatomic,weak)UIViewController *interfaceViewController;

/*
 回调事件
 */
@property(nonatomic,copy)ATCallBlock callBlock;

@end


@protocol ATHomeModel <ATMoudleProtocol>

/*
 其他控制器入口
 */
@property(nonatomic,weak)UIViewController *nextViewController;
/*
 传入参数
 */
@property (nonatomic, copy) NSString *paramter;

@end



NS_ASSUME_NONNULL_END
