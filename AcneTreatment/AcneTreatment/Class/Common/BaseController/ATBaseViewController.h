//
//  ATBaseViewController.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIView+Toast.h>

typedef NS_ENUM(NSUInteger, ToastPositionType) {
    ToastPositionTypeTop,
    ToastPositionTypeCenter,
    ToastPositionTypeBottom,
};

@interface ATBaseViewController : UIViewController

/**
 * 加载视图

 @param message 返回错误弹框提示
 */
-(void)makeToast:(NSString *)message;
-(void)makeToast:(NSString *)message backImageView:(NSString *)image;
-(void)makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(ToastPositionType )position;

/**
 * 网络失败展示图

 @param view 网络失败展示图
 */
-(void)networkErrorWithView:(UIView*)view;


#pragma mark  占位图
- (void)createPlaceholderView:(NSString *) title
                      message:(NSString *)message
                        image:(UIImage *)image
                     withView:(UIView *)superView;

- (void)createPlaceholderView:(NSString *) title
                      message:(NSString *)message
                        image:(UIImage *)image
                     withView:(UIView *)superView action:(SEL)reloadAction;

- (void)createPlaceholderView:(NSString *) title
                      message:(NSString *)message
                        image:(UIImage *)image
                     withView:(UIView *)superView refTitle:(NSString *)reftitle action:(SEL)reloadAction;

- (void)removePlaceholderView;

///MARK: TOOD
-(void)dismissKeyBoard;
-(void)reloadDataSoucre;
-(void)loginOut;

@end
