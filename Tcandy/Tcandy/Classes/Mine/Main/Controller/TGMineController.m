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
#import "TGMHelpOrderView.h"

#import "TGMinePersonalController.h"
#import "TGMineSettingController.h"
#import "TGMineWalletController.h"
#import "TGMineMessageController.h"
#import "TGMDailyCheckController.h"

#define KOrderHeight 60

@interface TGMineController ()

@property (nonatomic,strong) TGMineHeadView *headView;
@property (nonatomic,strong) TGMineInvitationView *invitationView;
@property (nonatomic,strong) TGMWalletOrderView *walletView;
@property (nonatomic,strong) TGMOrdeListView *orderView;
@property (nonatomic,strong) TGMUpdateOrderView *updateView;
@property (nonatomic,strong) TGMHelpOrderView *helpView;

@property (nonatomic,assign) BOOL isLogIn;

@end

@implementation TGMineController

#pragma mark - Lazy

- (TGMHelpOrderView *)helpView {
    if (_helpView == nil) {
        _helpView = [[TGMHelpOrderView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, KOrderHeight + 300)];
    }
    return _helpView;
}

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
        [_walletView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToWalletController)]];

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
        [_headView.settingBtn addTarget:self action:@selector(goToSetting) forControlEvents:UIControlEventTouchUpInside];
        [_headView.headBtn addTarget:self action:@selector(goToPersonalController) forControlEvents:UIControlEventTouchUpInside];
        [_headView.messageBtn addTarget:self action:@selector(goToMessageController) forControlEvents:UIControlEventTouchUpInside];
        [_headView.dayBtn addTarget:self action:@selector(goToDailyCheckController) forControlEvents:UIControlEventTouchUpInside];
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
    
    self.isLogIn = YES;
}

- (void)setupUI {
    self.tableView.bounces = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);

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

#pragma mark - method

- (void)goToDailyCheckController {
    TGMDailyCheckController *vc = [[TGMDailyCheckController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)goToMessageController {
    TGMineMessageController *vc = [[TGMineMessageController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)goToWalletController {
    TGMineWalletController *vc = [[TGMineWalletController alloc]initWithNibName:NSStringFromClass([TGMineWalletController class]) bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)goToPersonalController {
    TGMinePersonalController *vc = [[TGMinePersonalController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)goToSetting {
    TGMineSettingController *vc = [[TGMineSettingController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
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
    else {
        if (self.isLogIn) {
            [cell.contentView addSubview:self.helpView];
        }
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
    else if (indexPath.section == 5) {
        return KOrderHeight + 300;
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
