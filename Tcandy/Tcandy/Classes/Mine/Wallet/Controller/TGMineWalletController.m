//
//  TGMineWalletController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMineWalletController.h"

@interface TGMineWalletController ()

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstBtnH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomBtnY;


@end

@implementation TGMineWalletController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUpUI];
}

- (void)setUpUI {
    
    self.view.backgroundColor = RGB(238, 238, 238);
    
    self.firstBtnH.constant = KScaleY * 83;
    self.bottomBtnY.constant = KScaleY * 50;

    self.firstBtn.layer.cornerRadius = 8.0;
    self.secondBtn.layer.cornerRadius = 8.0;
    self.thirdBtn.layer.cornerRadius = 8.0;

}

- (IBAction)backBtnClicked:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
