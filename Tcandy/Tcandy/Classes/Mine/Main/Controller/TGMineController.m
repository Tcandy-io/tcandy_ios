//
//  TGMineController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMineController.h"

#import "TGMineHeadView.h"
#import "TGMineInvitationView.h"
#import "TGMWalletOrderView.h"
#import "TGMOrdeListView.h"
#import "TGMUpdateOrderView.h"

#define KOrderHeight 60

@interface TGMineController ()

@property (nonatomic,strong) TGMineHeadView *headView;
@property (nonatomic,strong) TGMineInvitationView *invitationView;
@property (nonatomic,strong) TGMWalletOrderView *walletView;
@property (nonatomic,strong) TGMOrdeListView *orderView;
@property (nonatomic,strong) TGMUpdateOrderView *updateView;

@end

@implementation TGMineController

#pragma mark - Lazy

- (TGMUpdateOrderView *)updateView {
    if (_updateView == nil) {
        _updateView = [[TGMUpdateOrderView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, KOrderHeight)];
    }
    return _updateView;
}

- (TGMOrdeListView *)orderView {
    if (_orderView == nil) {
        _orderView = [[TGMOrdeListView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, KOrderHeight + 120)];
    }
    return _orderView;
}

- (TGMWalletOrderView *)walletView {
    if (_walletView == nil) {
        _walletView = [[TGMWalletOrderView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, KOrderHeight + 90)];
    }
    return _walletView;
}

- (TGMineInvitationView *)invitationView {
    if (_invitationView == nil) {
        _invitationView = [[TGMineInvitationView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, KOrderHeight)];
    }
    return _invitationView;
}

- (TGMineHeadView *)headView {
    if (_headView == nil) {
        _headView = [TGMineHeadView loadViewFromXib_ND];
        _headView.frame = CGRectMake(0, 0, Main_Screen_Width, 300);
    }
    return _headView;
}


#pragma mark - ui

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    self.tableView.bounces = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);

    self.view.backgroundColor = kBackgroundColor;
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

}

- (void)viewDidLayoutSubviews {
    self.tableView.frame = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - TabBar_HEIGHT);
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = [NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    if (indexPath.section == 0) {
        [cell.contentView addSubview:self.headView];
    }
    else if (indexPath.section == 1) {
        [cell.contentView addSubview:self.invitationView];
    }
    else if (indexPath.section == 2) {
        [cell.contentView addSubview:self.walletView];
    }
    else if (indexPath.section == 3) {
        [cell.contentView addSubview:self.orderView];
    }
    else if (indexPath.section == 4) {
        [cell.contentView addSubview:self.updateView];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 300;
    }
    else if (indexPath.section == 1 || indexPath.section == 4) {
        return KOrderHeight;
    }
    else if (indexPath.section == 2) {
        return KOrderHeight + 90;
    }
    else if (indexPath.section == 3) {
        return KOrderHeight + 120;
    }
    else {
        return 200;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


@end
