//
//  ATMineViewController.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATMineViewController.h"
#import "ATBaseTableViewCell.h"
#import "ATPersonalViewController.h"
#import "ATSettingItemModel.h"
#import "ATMineHeadView.h"
@interface ATMineViewController ()<UITableViewDataSource,UITableViewDelegate,ATBaseTableViewCellActionProtocol>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *lists;
@property(nonatomic,strong)ATMineHeadView *headView;
@end

@implementation ATMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    [self configViews];
    [self loadDataSoucre];
}

-(void)configViews{
    
    _headView = ({
        ATMineHeadView *iv = [[ATMineHeadView alloc]init];
        iv.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120.0f);
        iv.backgroundColor = [UIColor whiteColor];
        iv;
    });
    
    _tableView = ({
        UITableView *iv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];;
        [self.view addSubview:iv];
        iv.backgroundColor = [UIColor whiteColor];
        iv.showsVerticalScrollIndicator =NO;
        iv.showsHorizontalScrollIndicator =NO;
        iv.separatorStyle = UITableViewCellSeparatorStyleNone;
        iv.dataSource = self;
        iv.delegate = self;
        iv.estimatedSectionFooterHeight = 0;
        iv.estimatedSectionHeaderHeight = 0;
        iv.tableHeaderView  = self.headView;
        iv.tableFooterView  =[UIView new];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            if (iOS11) {
                make.edges.mas_equalTo(self.view.safeAreaInsets);
            }else{
                make.edges.mas_equalTo(self.view);
            }
        }];
        iv;
    });
    
    @weakify(self);
    [self.headView WH_whenTapped:^{
        @strongify(self);
        ATPersonalViewController *personal = [[ATPersonalViewController alloc]init];
        [self.navigationController pushViewController:personal animated:YES];
    }];
}

-(void)loadDataSoucre{
    NSArray *settings = [NSArray array];
    settings = @[@{@"sections":@[@{@"CellClass":@"ATMineItemsTableViewCell",@"headTitle":@"YES",
                                   @"datas":@[@{@"icon":PlaceholdImageNAME,@"title":@"消费",@"ClassName":@"ATConsumeViewController"},
                                              @{@"icon":PlaceholdImageNAME,@"title":@"保单",@"ClassName":@"ATInsuranceViewController"},
                                              @{@"icon":PlaceholdImageNAME,@"title":@"钱包",@"ClassName":@"ATConsumeViewController"},
                                              @{@"icon":PlaceholdImageNAME,@"title":@"相册",@"ClassName":@"ATConsumeViewController"},
                                              @{@"icon":PlaceholdImageNAME,@"title":@"评价",@"ClassName":@"ATConsumeViewController"}]}]},
                 
                 @{@"sections":@[@{@"title":@"皮肤检查报告",@"type":@(ATSettingItemTypeArrow),@"ClassName":@"ATReportViewController",@"CellClass":@"ATMineTableViewCell"},
                                 @{@"title":@"投诉建议",@"type":@(ATSettingItemTypeArrow),@"ClassName":@"ATFeedBackViewController",@"CellClass":@"ATMineTableViewCell"},
                                 @{@"title":@"关于我们",@"type":@(ATSettingItemTypeArrow),@"ClassName":@"ATAboutViewController",@"CellClass":@"ATMineTableViewCell"},
                                 @{@"title":@"密码设置",@"type":@(ATSettingItemTypeArrow),@"ClassName":@"ATSettingViewController",@"CellClass":@"ATMineTableViewCell"}]}];
    self.lists = [ATSettingItemModel mj_objectArrayWithKeyValuesArray:settings];
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ATSettingItemModel *model = self.lists[section];
    return model.sections.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.lists.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATSettingItemModel *model = self.lists[indexPath.section];
    ATSettingItemModel *items = model.sections[indexPath.row];
    return [NSClassFromString(items.CellClass) getCellHeight:items];
}
#pragma mark 适配ios11
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    ATSettingItemModel *model = self.lists[section];
    if (!model.headTitle.length||model==nil) {
        return nil;
    }
    UIView *headBackView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10.0f)];
    headBackView.backgroundColor = [UIColor whiteColor];
    return headBackView;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    ATSettingItemModel *model = self.lists[section];
    if (!model.headTitle.length||model==nil) {
        return 0.01f;
    }
    return  10.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATSettingItemModel *model = self.lists[indexPath.section];
    ATSettingItemModel *items = model.sections[indexPath.row];
    ATBaseTableViewCell  *cell  = [NSClassFromString(items.CellClass) CellWithTableView:tableView];
    [cell InitDataWithModel:items];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ATSettingItemModel *model = self.lists[indexPath.section];
    ATSettingItemModel *items = model.sections[indexPath.row];
    if (items.ClassName.length) {
        Class class = NSClassFromString(items.ClassName);
        if (class) {
            if ([class isSubclassOfClass:[ATBaseViewController class]]) {
                UIViewController *tempClass = [[class alloc] init];
                [self.navigationController pushViewController:tempClass animated:YES];
            }
        }
    }
}

#pragma mark ATBaseTableViewCellActionProtocol
-(void)ClickTableViewCell:(ATBaseTableViewCell *)cell AtItems:(NSInteger)items model:(ATSettingItemModel *)model{
    
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
