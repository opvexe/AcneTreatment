//
//  ATAboutViewController.m
//  AcneTreatment
//
//  Created by FaceBook on 2018/8/20.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATAboutViewController.h"
#import "ATSettingItemModel.h"
#import "ATAboutTableViewCell.h"
@interface ATAboutViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *lists;
@end

@implementation ATAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"关于我们";
    [self configViews];
    [self loadDataSoucre];
}

-(void)configViews{
    _tableView = ({
        UITableView *iv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];;
        [self.view addSubview:iv];
        iv.showsVerticalScrollIndicator =NO;
        iv.showsHorizontalScrollIndicator =NO;
        iv.separatorStyle = UITableViewCellSeparatorStyleNone;
        iv.dataSource = self;
        iv.delegate = self;
        iv.rowHeight = 44.0f;
        iv.estimatedSectionFooterHeight = 0;
        iv.estimatedSectionHeaderHeight = 0;
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
}

-(void)loadDataSoucre{
    NSArray *settings = [NSArray array];
    settings = @[@{@"title":@"版本升级",@"subTitle":@"已是最新版本",@"type":@(ATSettingItemTypeArrow)},
                 @{@"title":@"祛痘护理宝简介",@"type":@(ATSettingItemTypeArrow)}];
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
    UIView *headBackView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160.0f)];
    headBackView.backgroundColor = [UIColor whiteColor];
    FLAnimatedImageView *bgImageView = [[FLAnimatedImageView alloc]initWithFrame:CGRectZero];
    bgImageView.contentMode =UIViewContentModeScaleAspectFill;
    bgImageView.clipsToBounds = YES;
    bgImageView.image = ATImageNamed(@"");
    [headBackView addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
    }];
    return headBackView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 160.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATAboutTableViewCell *cell = [ATAboutTableViewCell CellWithTableView:tableView];
    [cell InitDataWithModel:self.lists[indexPath.row]];
    return cell;
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
