//
//  TGHotSearchViewController.m
//  Tcandy
//
//  Created by mac on 2018/8/22.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGHotSearchViewController.h"
#import "TGHotSearchCell.h"
#import "TGConfigure.h"
@interface TGHotSearchViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView *m_collectionView;

@end

@implementation TGHotSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setRootTitleString:@"全天销量榜"];
    [self setRootNavigationBarColor:kTGTextColorRed];
   _m_collectionView =  [self createCollectionView];
}
//创建搜索
-(UICollectionView*)createCollectionView{
    UICollectionViewFlowLayout *lflowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *lcollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10,kTGSafeAreaTop, Main_Screen_Width - 20,CGRectGetHeight(self.view.frame)-kTGSafeAreaTop-kTGSafeAreaBottom) collectionViewLayout:lflowLayout];
    [self.view addSubview:lcollectionView];
    lcollectionView.showsVerticalScrollIndicator = NO;
    lcollectionView.backgroundColor = [UIColor whiteColor];
    lcollectionView.delegate = self;
    lcollectionView.dataSource = self;
    //
    [lcollectionView registerNib:[UINib nibWithNibName:@"TGHotSearchCell" bundle:nil] forCellWithReuseIdentifier:[TGHotSearchCell cellIdentifier]];
    
    return lcollectionView;
}
#pragma mark - collectionView delegate and datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TGHotSearchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TGHotSearchCell cellIdentifier] forIndexPath:indexPath];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((Main_Screen_Width - 30)/2 , (Main_Screen_Width - 30)/2+50);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

@end
