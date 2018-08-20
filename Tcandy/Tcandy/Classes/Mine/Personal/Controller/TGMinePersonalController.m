//
//  TGMineSettingController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/20.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMinePersonalController.h"

#import "TGMineSettingCell.h"

#define KTGMineSettingCellID @"KTGMineSettingCellID"

@interface TGMinePersonalController ()

@end

@implementation TGMinePersonalController

#pragma mark - ui

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)setupUI {
    self.view.backgroundColor = kBackgroundColor;
    
    self.navigationItem.title = @"个人资料";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TGMineSettingCell class]) bundle:nil] forCellReuseIdentifier:KTGMineSettingCellID];
    
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 5;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TGMineSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:KTGMineSettingCellID forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.imgStr = @"set_service";
        cell.nameStr = @"帮助与客服";
    }
    else if (indexPath.section == 1) {
        NSArray *imgArr = @[@"set_safe",@"set_our",@"set_opinion",@"set_help",@"set_agreement"];
        NSArray *nameArr = @[@"账户安全",@"关于我们",@"意见反馈",@"帮助中心",@"服务协议"];
        
        cell.imgStr = imgArr[indexPath.row];
        cell.nameStr = nameArr[indexPath.row];
    }
    else {
        cell.imgStr = @"set_clear";
        cell.nameStr = @"清空缓存";
        cell.hasNextImg = NO;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return 100;
    }
    else {
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    
    UIButton *outBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    outBtn.frame = CGRectMake(10, 15, Main_Screen_Width - 10 * 2, 50);
    [outBtn setTitle:@"退出登录" forState:0];
    [outBtn setTitleColor:[UIColor blackColor] forState:0];
    [outBtn setBackgroundColor:[UIColor whiteColor]];
    outBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [view addSubview:outBtn];
    
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
