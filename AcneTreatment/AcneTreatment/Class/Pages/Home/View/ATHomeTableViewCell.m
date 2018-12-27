//
//  ATHomeTableViewCell.m
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/21.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATHomeTableViewCell.h"

@implementation ATHomeTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"ATHomeTableViewCell";
    ATHomeTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ATHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(void)ATSinitConfingViews{
    
    
}

@end
