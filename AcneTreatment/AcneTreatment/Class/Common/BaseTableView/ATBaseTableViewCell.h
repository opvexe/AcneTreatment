//
//  ATBaseTableViewCell.h
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATBaseTableViewCellProtocol.h"
#import "ATBaseTableViewCellActionProtocol.h"
@interface ATBaseTableViewCell : UITableViewCell<ATBaseTableViewCellProtocol,ATBaseTableViewCellActionProtocol>

+(id)CellWithTableView:(UITableView *)tableview;

@property(nonatomic,weak) id <ATBaseTableViewCellActionProtocol>delegate;
@end
