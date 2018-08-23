//
//  TGTodayScareBuyViewController.m
//  Tcandy
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGTodayScareBuyViewController.h"
#import "SGPagingView.h"
#import "TGConfigure.h"
#import "TGTodayScareBuySubViewController.h"
@interface TGTodayScareBuyViewController ()<SGPageTitleViewDelegate, SGPageContentCollectionViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentCollectionView *pageContentCollectionView;
@end

@implementation TGTodayScareBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setImageTitle:@"logo_rob" url:nil];
    
    NSArray *titleArr = @[@"19:00\n正在疯抢", @"19:00\n正在疯抢", @"19:00\n正在疯抢", @"19:00\n正在疯抢",@"19:00\n正在疯抢",@"19:00\n正在疯抢", @"19:00\n正在疯抢", @"19:00\n正在疯抢", @"19:00\n正在疯抢"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleSelectedColor = [UIColor whiteColor];
    configure.titleColor = [UIColor whiteColor];
    configure.indicatorStyle = SGIndicatorStyleCover;
    configure.indicatorColor = kTGTextColorRed;
    configure.indicatorAdditionalWidth = 120;
    configure.indicatorHeight = 122;
    configure.titleFont = [UIFont systemFontOfSize:13];
    configure.titleGradientEffect = YES;
    
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0,kStatusBarHeight+44, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    self.pageTitleView.backgroundColor = UIColor.blackColor;
    [self.view addSubview:_pageTitleView];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSString *ltitle in titleArr) {
        TGTodayScareBuySubViewController *lvc = [TGTodayScareBuySubViewController createTGTodayScareBuySubViewControllerWithType:YES];
        [viewControllers addObject:lvc];
    }
    CGFloat ContentCollectionViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame);
    self.pageContentCollectionView = [[SGPageContentCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), self.view.frame.size.width, ContentCollectionViewHeight) parentVC:self childVCs:viewControllers];
    _pageContentCollectionView.delegatePageContentCollectionView = self;
    [self.view addSubview:_pageContentCollectionView];
}
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentCollectionView setPageContentCollectionViewCurrentIndex:selectedIndex];
}

- (void)pageContentCollectionView:(SGPageContentCollectionView *)pageContentCollectionView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}
@end
