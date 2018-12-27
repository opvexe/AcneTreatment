//
//  ATBaseTabelHeaderFooterViewProtocol.h
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ATBaseModel;
@protocol ATBaseTabelHeaderFooterViewProtocol <NSObject>

@optional

- (void)ATSinitConfingViews;

-(void)ATConfigSignalDataSoucre;

+(instancetype)headViewWithTableView:(UITableView *)tableview;

-(void)InitDataWithModel:(ATBaseModel *)model;

+(CGFloat)getHeight:(ATBaseModel *)model;

@end
