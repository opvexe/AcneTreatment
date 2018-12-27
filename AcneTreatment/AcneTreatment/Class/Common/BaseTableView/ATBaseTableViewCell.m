//
//  ATBaseTableViewCell.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATBaseTableViewCell.h"

@implementation ATBaseTableViewCell

+(id)CellWithTableView:(UITableView *)tableview{
    return nil;
};

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
        
        [self ATSinitConfingViews];
        [self ATConfigSignalDataSoucre];
    }
    return  self ;
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

+(CGFloat)getCellHeight:(ATBaseModel *)model{
    
    return  0.0f;
}

-(void)dealloc{
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
}
@end
