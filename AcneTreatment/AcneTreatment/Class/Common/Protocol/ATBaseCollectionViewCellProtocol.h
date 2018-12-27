//
//  ATBaseCollectionViewCellProtocol.h
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ATBaseModel;
@protocol ATBaseCollectionViewCellProtocol <NSObject>

@optional

- (void)ATSinitConfingViews;

-(void)ATConfigSignalDataSoucre;

-(void)InitDataWithModel:(ATBaseModel *)model;

+(CGFloat)getCellHeight:(ATBaseModel *)model;

@end
