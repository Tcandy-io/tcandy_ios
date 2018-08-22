//
//  TGMAccountBindController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMAccountBindController.h"

#import "TGMAccountBindCell.h"

#define KTGMAccountBindCellID @"KTGMAccountBindCellID"

@interface TGMAccountBindController ()

@end

@implementation TGMAccountBindController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    self.view.backgroundColor = kBackgroundColor;
    
    self.navigationItem.title = @"账号关联";
    
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TGMAccountBindCell class]) bundle:nil] forCellReuseIdentifier:KTGMAccountBindCellID];
    
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TGMAccountBindCell *cell = [tableView dequeueReusableCellWithIdentifier:KTGMAccountBindCellID forIndexPath:indexPath];

    if (indexPath.row == 0) {
        cell.imgStr = @"relation_qq";
        cell.nameStr = @"QQ";
    }
    else if (indexPath.row == 1) {
        cell.imgStr = @"relation_wechat";
        cell.nameStr = @"微信";
    }
    else {
        cell.imgStr = @"relation_taobao";
        cell.nameStr = @"淘宝";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 160)];
    
    NSString *labelText = @"账户关联之后，用户可使用微信QQ淘宝账户快速登录糖果淘，\n在各个渠道进行购物时，均可同步糖果淘会员账号，享受糖果淘会员特权，同步订单物流信息。\n为了你的帐号安全，30天内不可解除账号关联。\n糖果淘承诺保障你的帐号隐私安全。";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 8;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, Main_Screen_Width - 20, 140)];
    [view addSubview:lab];
    lab.numberOfLines = 0;
    lab.textColor = [UIColor lightGrayColor];
    lab.attributedText = attributedString;
    [lab sizeToFit];

    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 160;
}

@end
