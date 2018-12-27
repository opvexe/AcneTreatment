//
//  ATBaseView.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATBaseView.h"

@implementation ATBaseView
-(instancetype)init{
    
    if (self = [super init]) {
        
        [self ATSinitConfingViews];
        [self ATConfigSignalDataSoucre];
    }
    return  self;
    
}
-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self ATSinitConfingViews];
    [self ATConfigSignalDataSoucre];
}

- (void)ATSinitConfingViews{
    
}

-(void)ATConfigSignalDataSoucre{
    
}

-(void)InitDataWithModel:(ATBaseModel *)model{
    
}

-(void)dealloc{
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
}

@end
