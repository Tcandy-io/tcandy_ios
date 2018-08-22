//
//  TGPreferentialViewController.m
//  Tcandy
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGPreferentialViewController.h"
#import "SGPagingView.h"
#import "TGConfigure.h"
#import "TGPreferentialSubViewController.h"
@interface TGPreferentialViewController ()<SGPageTitleViewDelegate, SGPageContentCollectionViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentCollectionView *pageContentCollectionView;
@property(nonatomic,strong) NSString *titleString;
@end

@implementation TGPreferentialViewController
+(instancetype)createViewControllerWithValue:(id)value{
    TGPreferentialViewController *vc = [TGPreferentialViewController new];
    vc.titleString =value;
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setRootTitleString:self.titleString];
    [self setRootNavigationBarColor:kTGTextColorRed];
    
    NSArray *titleArr =@[@"全部",@"女装",@"男装",@"内衣",@"母婴",@"化妆品",@"居家",@"鞋包配饰",@"美食",@"文体车品",@"数码家电",@"预告"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleSelectedColor = kTGTextColorRed;
    configure.titleColor = kTGTextColorGray;
    configure.indicatorStyle = SGIndicatorStyleCover;
    configure.indicatorColor = [UIColor whiteColor];
    configure.indicatorAdditionalWidth = 120;
    configure.indicatorHeight = 122;
    configure.titleFont = [UIFont systemFontOfSize:15];
    configure.titleGradientEffect = YES;
    
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0,kStatusBarHeight+44, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSString *ltitle in titleArr) {
        TGPreferentialSubViewController *lvc = [TGPreferentialSubViewController new];
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
