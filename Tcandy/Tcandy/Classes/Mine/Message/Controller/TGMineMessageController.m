//
//  TGMineMessageController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/22.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMineMessageController.h"

#import "TGMineMessageCell.h"

#define KTGMineMessageCellID @"KTGMineMessageCellID"

@interface TGMineMessageController ()

@end

@implementation TGMineMessageController

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
    
    self.navigationItem.title = @"消息中心";
    
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TGMineMessageCell class]) bundle:nil] forCellReuseIdentifier:KTGMineMessageCellID];
    
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TGMineMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:KTGMineMessageCellID forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.imgStr = @"m1";
        cell.nameStr = @"官方公告";
        cell.desStr = @"为了防止个别用户用不正当手段刷下线";
    }
    else if (indexPath.row == 1) {
        cell.imgStr = @"m2";
        cell.nameStr = @"我的消息";
        cell.desStr = @"专属权益、积分提醒等在这里查看哦~";
    }
    else if (indexPath.row == 2) {
        cell.imgStr = @"m1";
        cell.nameStr = @"订单助手";
        cell.desStr = @"订单信息在这里查看哦~";
    }
    else {
        cell.imgStr = @"m2";
        cell.nameStr = @"客服中心";
        cell.desStr = @"有任何问题点我为你服务哦~";
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


@end
