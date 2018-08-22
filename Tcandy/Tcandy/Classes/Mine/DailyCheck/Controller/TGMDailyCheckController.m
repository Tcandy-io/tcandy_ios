//
//  TGMDailyCheckController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/22.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMDailyCheckController.h"

#import "TGMDailyCheckHeadView.h"
#import "TGMDailyCheckAwardCell.h"

#define kDailyCheckHeadViewH 222
#define KTGMDailyCheckAwardCellID @"KTGMDailyCheckAwardCellID"

@interface TGMDailyCheckController ()

@property (nonatomic,strong) TGMDailyCheckHeadView *headView;

@end

@implementation TGMDailyCheckController

- (TGMDailyCheckHeadView *)headView {
    if (_headView == nil) {
        _headView = [TGMDailyCheckHeadView loadViewFromXib_ND];
        _headView.frame = CGRectMake(0, - kDailyCheckHeadViewH, Main_Screen_Width, kDailyCheckHeadViewH);
        _headView.backgroundColor = random_Color;
    }
    return _headView;
}

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
    
    self.navigationItem.title = @"每日签到";
    
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TGMDailyCheckAwardCell class]) bundle:nil] forCellReuseIdentifier:KTGMDailyCheckAwardCellID];
    
    [self.tableView addSubview:self.headView];
    self.tableView.contentInset = UIEdgeInsetsMake(kDailyCheckHeadViewH, 0, 0, 0);

}

#pragma mark - UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TGMDailyCheckAwardCell *cell = [tableView dequeueReusableCellWithIdentifier:KTGMDailyCheckAwardCellID forIndexPath:indexPath];
    

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

@end
