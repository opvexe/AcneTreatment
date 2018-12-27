//
//  ATAlertShowView.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATBaseView.h"

typedef NS_ENUM(NSUInteger, ATAlertShowViewType) {
    ATAlertShowViewTypeCode,
    ATAlertShowViewTypeLogin,
};

@interface ATAlertShowView : ATBaseView

+ (ATAlertShowView *)showWithCompelet:(void(^)(ATAlertShowViewType type,NSString  *iphone,NSString *code))completeBlock;

-(void)dismiss;

@end
