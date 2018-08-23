//
//  TGHomeController.m
//  Tcandy
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGHomeController.h"
#import "TGHomeHeaderView.h"
#import "TGHomeSectionHeaderView.h"
#import "TGHomeCell.h"
#import "TGHomeSearchBarView.h"
#import "TGHomeSelectShopKindsView.h"

#import "TGNetwork.h"
#define  kHomeTableViewHeader_H  440

@interface TGHomeController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *m_tableView;
@property(nonatomic,strong) UIView *m_headerView;
@property(nonatomic,strong) UIView *m_searchView;
@property(nonatomic,strong) TGHomeSelectShopKindsView *m_shopKindsView;
@end

@implementation TGHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hideNavigationView:YES];
    
    _m_tableView =  [self createTableView];
    _m_tableView.tableHeaderView = [self createTableViewHeaderView];
    [self createTableViewSectionView];
    [self createTableViewCell];
    
    _m_searchView = [self createSearchBarView];
    _m_shopKindsView = [self createShopKindsView];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
//创建tableView
-(UITableView*)createTableView{
    UITableView *ltableView = [[UITableView alloc]init];
    ltableView.delegate =self;
    ltableView.dataSource =self;
    [self.view addSubview:ltableView];
    
    [ltableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(-kStatusBarHeight);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-TabBar_HEIGHT);
    }];
    
    return ltableView;
}
//创建tableviewHeaderView
-(UIView*)createTableViewHeaderView{
    UIView *lheaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, kHomeTableViewHeader_H)];
    TGHomeHeaderView *ltgheaderView = [[[NSBundle mainBundle]loadNibNamed:@"TGHomeHeaderView" owner:self options:nil] firstObject];
    ltgheaderView.frame = lheaderView.frame;
    [lheaderView addSubview:ltgheaderView];
    
    [ltgheaderView loadAds:nil];
    return lheaderView;
}
// 淘宝、京东、拼多多切换
-(void)createTableViewSectionView{
    [_m_tableView registerClass:[TGHomeSectionHeaderView class] forHeaderFooterViewReuseIdentifier:@"kSectionIdentify"];
}
//创建cell
-(void)createTableViewCell{
    [_m_tableView registerNib:[UINib nibWithNibName:@"TGHomeCell" bundle:nil] forCellReuseIdentifier:[TGHomeCell cellIdentifier]];
}
//搜索栏
-(UIView*)createSearchBarView{
    TGHomeSearchBarView *lsearchView = [[TGHomeSearchBarView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 60+kStatusBarHeight)];
    lsearchView.backgroundColor = UIColor.clearColor;
    [self.view addSubview:lsearchView];
    return lsearchView;
}
//商品种类
-(TGHomeSelectShopKindsView*)createShopKindsView{
    TGHomeSelectShopKindsView *lshopKindsView = [[TGHomeSelectShopKindsView alloc]initWithFrame:CGRectMake(0, 60+kStatusBarHeight, Main_Screen_Width, 50)];
    [self.view addSubview:lshopKindsView];
    lshopKindsView.hidden = YES;
    __weak typeof(self) weakSelf = self;
    lshopKindsView.SelectedKinds = ^(NSString *kind) {
        [UIView animateWithDuration:0.25 animations:^{
              [weakSelf.m_tableView setContentOffset:CGPointMake(0, kHomeTableViewHeader_H-80 -kStatusBarHeight)];
        }];
    };
    return lshopKindsView;
}

#pragma mark -- tableview delegate and datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TGHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:[TGHomeCell cellIdentifier]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 50;
    }
    return 0;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *lsectionheader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"kSectionIdentify"];
    return lsectionheader;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Class class = NSClassFromString(@"TGShopDetailViewController");
    if (class != nil) {
        [self.navigationController pushViewController:[class new] animated:YES];
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat alpha =scrollView.contentOffset.y/200.0;
    if (alpha <= 0) {
        alpha = 0;
    }else if (alpha >= 1.0){
        alpha = 1.0;
    }else{
        _m_searchView.backgroundColor = RGBA(235, 35, 123, alpha);
    }
    //
    if (kHomeTableViewHeader_H < scrollView.contentOffset.y+kStatusBarHeight) {
         _m_shopKindsView.hidden = NO;
    } else {
         _m_shopKindsView.hidden = YES;
    }
    
}


@end
