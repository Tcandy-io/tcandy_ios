//
//  BaseTableViewController.h
//  MobileProject
//
//  Created by 陈彤 on 2018/5/22.
//  Copyright © 2018年 wujunyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

- (void)setupUI;

- (void)loadData;

@end
