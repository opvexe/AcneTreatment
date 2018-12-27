//
//  ATOppointViewController.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATOppointViewController.h"
#import "ATOppointTableViewCell.h"
@interface ATOppointViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *lists;
@end
static  int currentPage ;
@implementation ATOppointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"预约";
    [self configViews];
    [self tableViewDidTriggerHeaderRefresh];
}

-(void)configViews{
    _tableView = ({
        UITableView *iv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];;
        [self.view addSubview:iv];
        iv.backgroundColor = [UIColor whiteColor];
        iv.showsVerticalScrollIndicator =NO;
        iv.showsHorizontalScrollIndicator =NO;
        iv.separatorStyle = UITableViewCellSeparatorStyleNone;
        iv.dataSource = self;
        iv.delegate = self;
        iv.rowHeight = NumberHeight(120.0f);
        iv.estimatedSectionFooterHeight = 0;
        iv.estimatedSectionHeaderHeight = 0;
        iv.tableFooterView  =[UIView new];
        @weakify(self);
        iv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self);
            [self tableViewDidTriggerHeaderRefresh];
        }];
        iv.mj_header.automaticallyChangeAlpha = YES;
        iv.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
            @strongify(self);
            [self tableViewDidTriggerFooterRefresh];
        }];
        iv.mj_footer.automaticallyChangeAlpha = YES;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            if (iOS11) {
                make.edges.mas_equalTo(self.view.safeAreaInsets);
            }else{
                make.edges.mas_equalTo(self.view);
            }
        }];
        iv;
    });
}

- (void)tableViewDidTriggerHeaderRefresh{
    currentPage = 1;
    [self loadDataSoucre];
}
- (void)tableViewDidTriggerFooterRefresh{
    currentPage++;
    [self loadDataSoucre];
}

-(void)loadDataSoucre{
    
    
}


#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark 适配ios11
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATOppointTableViewCell *cell = [ATOppointTableViewCell CellWithTableView:tableView];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

@end
