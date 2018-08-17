//
//  TGMineController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMineController.h"

#import "TGMineHeadView.h"

@interface TGMineController ()

@property (nonatomic,strong) TGMineHeadView *headView;

@end

@implementation TGMineController

#pragma mark - Lazy

- (TGMineHeadView *)headView {
    if (_headView == nil) {
        _headView = [TGMineHeadView loadViewFromXib_ND];
        _headView.frame = CGRectMake(0, 0, Main_Screen_Width, 300);
        _headView.backgroundColor = random_Color;
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
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);

    self.view.backgroundColor = random_Color;
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

}

- (void)viewDidLayoutSubviews {
//    self.tableView.frame = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - TabBar_HEIGHT);
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 300;
    }
    else {
        return 200;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


@end
