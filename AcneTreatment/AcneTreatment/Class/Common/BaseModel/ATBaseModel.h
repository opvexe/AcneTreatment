//
//  ATBaseModel.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATBaseModel : NSObject

@property (nonatomic,copy) NSString * ID;

@property(nonatomic,copy)NSString *CellClass;

@property(nonatomic,copy)NSString *ClassName;

@property(nonatomic,strong)NSArray *datas;

@property(nonatomic,strong)NSArray *sections;

@end
