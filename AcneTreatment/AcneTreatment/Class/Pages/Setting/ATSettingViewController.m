//
//  ATSettingViewController.m
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATSettingViewController.h"
#import "ATSettingTableViewCell.h"
#import "ATSettingBottomView.h"
#import "ATSettingItemModel.h"
@interface ATSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *lists;
@property(nonatomic,strong)ATSettingBottomView *bottomView;
@end

@implementation ATSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设置";
    [self configViews];
    [self loadDataSoucre];
}

-(void)configViews{
    _bottomView = ({
        ATSettingBottomView *iv = [[ATSettingBottomView alloc]init];
        iv.backgroundColor = [UIColor clearColor];
        [self.view addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(0);
            make.height.mas_equalTo(60.0f);
            if (iOS11) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            }else{
                make.bottom.mas_equalTo(0);
            }
        }];
        iv;
    });
    
    _tableView = ({
        UITableView *iv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];;
        iv.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:iv];
        iv.showsVerticalScrollIndicator =NO;
        iv.showsHorizontalScrollIndicator =NO;
        iv.separatorStyle = UITableViewCellSeparatorStyleNone;
        iv.dataSource = self;
        iv.delegate = self;
        iv.rowHeight = 44.0f;
        iv.estimatedSectionFooterHeight = 0;
        iv.estimatedSectionHeaderHeight = 0;
        iv.tableFooterView  = [UIView new];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(self.bottomView.mas_top);
        }];
        iv;
    });
    
    @weakify(self);
    self.bottomView.resultBlock = ^(NSInteger index) {
        @strongify(self);
        [self loginOut];
    };
}

-(void)loadDataSoucre{
    NSArray *settings = [NSArray array];
    settings = @[@{@"title":@"更换已绑定的手机号",@"subTitle":@"13437253905",@"type":@(ATSettingItemTypeArrow)},
                 @{@"title":@"清除缓存",@"subTitle":@"1000KB",@"type":@(ATSettingItemTypeArrow)}];
    self.lists = [ATSettingItemModel mj_objectArrayWithKeyValuesArray:settings];
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lists.count;
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
    ATSettingTableViewCell *cell = [ATSettingTableViewCell CellWithTableView:tableView];
    [cell InitDataWithModel:self.lists[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
