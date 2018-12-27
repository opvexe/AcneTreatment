//
//  ATBaseTableViewCellActionProtocol.h
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ATBaseModel;
@class ATBaseTableViewCell;
@protocol ATBaseTableViewCellActionProtocol <NSObject>

@optional
-(void)ClickTableViewCell:(ATBaseTableViewCell *)cell AtItems:(NSInteger)items model:(ATBaseModel *)model;

@end
