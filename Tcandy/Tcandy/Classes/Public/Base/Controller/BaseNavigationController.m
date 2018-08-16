//
//  BaseNavigationController.m
//  DeepAM
//
//  Created by 陈彤 on 2018/6/12.
//  Copyright © 2018年 ct. All rights reserved.
//

#import "BaseNavigationController.h"

#import "UIBarButtonItem+CT.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIViewController *root = self.viewControllers[0];
        if (root != viewController) {
            
            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"nav_back" highlightedIcon:@"nav_back" target:self action:@selector(back)];
            if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
                self.interactivePopGestureRecognizer.delegate = nil;
                
            }
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
