//
//  ATMessageEventButton.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ATMessageEventButton;
@protocol ATMessageEventButtonDelegate <NSObject>
@optional
-(void)ClickedWithMessageButton:(ATMessageEventButton*)messageButton;
@end

@interface ATMessageEventButton : UIButton

@property (nonatomic, copy) NSString *normalStateImageName;

@property (nonatomic, copy) NSString *highlightedStateImageName;

@property (nonatomic, copy) NSString *selectedStateImageName;

@property (nonatomic, copy) NSString *normalStateBgImageName;

@property (nonatomic, copy) NSString *highlightedStateBgImageName;

@property (nonatomic, copy) NSString *selectedStateBgImageName;

@property(nonatomic)NSUInteger countdownBeginNumber;

@property(nonatomic,weak)id<ATMessageEventButtonDelegate>delegate;

-(void)startBeginNumber;

@end
