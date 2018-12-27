//
//  ATBaseCollectionViewCell.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATBaseCollectionViewCell.h"

@implementation ATBaseCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        [self ATSinitConfingViews];
        [self ATConfigSignalDataSoucre];
        
    }
    return self;
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

+(CGSize)getHeight:(ATBaseModel* )model{
    
    return CGSizeZero;
}

-(void)dealloc{
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
}


@end
