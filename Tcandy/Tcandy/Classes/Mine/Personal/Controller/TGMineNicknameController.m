//
//  TGMineNicknameController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMineNicknameController.h"

@interface TGMineNicknameController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

@implementation TGMineNicknameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.title = @"修改昵称";
    
    self.nameTF.layer.cornerRadius = 5.0;
    self.nameTF.layer.borderWidth = 1.0;
    self.nameTF.layer.borderColor = RGB(165, 165, 165).CGColor;
    
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(modifiedToComplete)];
    [rightitem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [rightitem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateHighlighted];
    self.navigationItem.rightBarButtonItem = rightitem;
}

- (void)modifiedToComplete {
    NSLog(@"%s",__func__);
}

@end
