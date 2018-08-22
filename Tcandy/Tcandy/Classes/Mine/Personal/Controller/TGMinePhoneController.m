//
//  TGMinePhoneController.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMinePhoneController.h"

@interface TGMinePhoneController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;

@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end

@implementation TGMinePhoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"修改手机号";
    
    self.phoneTF.layer.cornerRadius = 5.0;
    self.phoneTF.layer.borderWidth = 1.0;
    self.phoneTF.layer.borderColor = RGB(165, 165, 165).CGColor;
    self.phoneTF.placeholder = @"请输入手机号";
    if (self.isEmail) {
        self.phoneTF.placeholder = @"请输入邮箱";
    }
    
    self.codeTF.layer.cornerRadius = 5.0;
    self.codeTF.layer.borderWidth = 1.0;
    self.codeTF.layer.borderColor = RGB(165, 165, 165).CGColor;
    self.codeTF.placeholder = @"请输入验证码";
    
    self.codeBtn.layer.cornerRadius = 5.0;
    self.codeBtn.layer.borderWidth = 1.0;
    self.codeBtn.layer.borderColor = RGB(165, 165, 165).CGColor;

}

- (IBAction)sureBtnClicked:(UIButton *)sender {
    NSLog(@"%s",__func__);
}

@end
