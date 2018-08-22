//
//  TGTodayScareBuySubViewController.m
//  Tcandy
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGTodayScareBuySubViewController.h"
#import "TGTodayScareBuySubCell.h"
@interface TGTodayScareBuySubViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *m_tableView;
@end

@implementation TGTodayScareBuySubViewController
+(TGTodayScareBuySubViewController*)createTGTodayScareBuySubViewControllerWithType:(BOOL)isBuying{
    TGTodayScareBuySubViewController *vc = [[TGTodayScareBuySubViewController alloc]init];
    
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _m_tableView = [self createTableView];
    [_m_tableView registerNib:[UINib nibWithNibName:@"TGTodayScareBuySubCell" bundle:nil] forCellReuseIdentifier:[TGTodayScareBuySubCell cellIdentifier]];
}

//创建tableView
-(UITableView*)createTableView{
    UITableView *ltableView = [[UITableView alloc]init];
    ltableView.delegate =self;
    ltableView.dataSource =self;
    [self.view addSubview:ltableView];
    
    [ltableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    return ltableView;
}
#pragma mark -- tableview delegate and datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TGTodayScareBuySubCell *cell = [tableView dequeueReusableCellWithIdentifier:[TGTodayScareBuySubCell cellIdentifier]];
    return cell;
}
@end
