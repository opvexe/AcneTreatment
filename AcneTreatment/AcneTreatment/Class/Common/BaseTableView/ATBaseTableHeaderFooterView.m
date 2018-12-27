//
//  ATBaseTableHeaderFooterView.m
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATBaseTableHeaderFooterView.h"

@implementation ATBaseTableHeaderFooterView

+(instancetype )headViewWithTableView:(UITableView *)tableview{
    
    return nil;
}
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self ATSinitConfingViews];
        [self ATConfigSignalDataSoucre];
    }
    return self;
}
- (void)ATSinitConfingViews{
    
}

-(void)ATConfigSignalDataSoucre{
    
}


-(void)InitDataWithModel:(ATBaseModel *)model{
    
}

+(CGFloat)getHeight:(ATBaseModel *)model{
    
    return 0.0f;
}

@end
