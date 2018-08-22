//
//  TGMineSettingController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/20.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMinePersonalController.h"

#import "TGMinePersonHeadImgCell.h"
#import "TGMinePersonContentCell.h"

#import "TGMineNicknameController.h"
#import "TGMinePhoneController.h"
#import "TGMAccountBindController.h"

#define KTGMinePersonHeadImgCellID @"KTGMinePersonHeadImgCellID"
#define KTGMinePersonContentCellID @"KTGMinePersonContentCellID"

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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TGMinePersonHeadImgCell class]) bundle:nil] forCellReuseIdentifier:KTGMinePersonHeadImgCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TGMinePersonContentCell class]) bundle:nil] forCellReuseIdentifier:KTGMinePersonContentCellID];

}

#pragma mark - UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    else if (section == 1) {
        return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        TGMinePersonHeadImgCell *cell = [tableView dequeueReusableCellWithIdentifier:KTGMinePersonHeadImgCellID forIndexPath:indexPath];
        
        
        return cell;
    }
    
    TGMinePersonContentCell *cell = [tableView dequeueReusableCellWithIdentifier:KTGMinePersonContentCellID forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            cell.desStr = @"昵称";
            cell.nameStr = @"18777777777";
        }
    }
    else if (indexPath.section == 1) {
        NSArray *nameArr = @[@"钱包地址",@"手机号",@"邮箱",@"所在地"];
        cell.desStr = nameArr[indexPath.row];
        
        if (indexPath.row == 0) {
            cell.hasBind = YES;
        }
        else if (indexPath.row == 1) {
            cell.nameStr = @"18777777777";
        }
        else if (indexPath.row == 2) {
            cell.hasBind = YES;
        }
    }
    else {
        cell.desStr = @"账号关联";
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 90;
    }
    return 54;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 44)];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, 44)];
        [view addSubview:lable];
        lable.text = @"账号";
        
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 44;
    }
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return 10;
    }
    else {
        return 0.01;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            TGMineNicknameController *vc = [[TGMineNicknameController alloc]initWithNibName:NSStringFromClass([TGMineNicknameController class]) bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 1) {
            TGMinePhoneController *vc = [[TGMinePhoneController alloc]initWithNibName:NSStringFromClass([TGMinePhoneController class]) bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 2) {
            TGMinePhoneController *vc = [[TGMinePhoneController alloc]initWithNibName:NSStringFromClass([TGMinePhoneController class]) bundle:nil];
            vc.isEmail = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    else if (indexPath.section == 2) {
        TGMAccountBindController *vc = [[TGMAccountBindController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
