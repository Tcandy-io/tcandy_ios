//
//  TGMainTabBarController.m
//  Tcandy
//
//  Created by 开发 on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMainTabBarController.h"

#import "BaseNavigationController.h"

@interface TGMainTabBarController ()
{

}
@end

@implementation TGMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addController:@"TGMineController" image:nil selectImage:nil];
    [self addController:@"UIViewController" image:nil selectImage:nil];

}

- (void)addController:(NSString *)vcName image:(NSString *)image selectImage:(NSString *)selectImage {
    
    UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
    if (image != nil) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
    }
    if (selectImage != nil) {
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    }
    
    BaseNavigationController *navc = [[BaseNavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:navc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
