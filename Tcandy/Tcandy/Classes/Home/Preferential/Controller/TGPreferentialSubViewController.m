//
//  TGPreferentialSubViewController.m
//  Tcandy
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGPreferentialSubViewController.h"
#import "TGSortBarView.h"
#import "TGPreferentialSubCell.h"
@interface TGPreferentialSubViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView *m_collectionView;
@end

@implementation TGPreferentialSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _m_collectionView = [self createCollectionView];
    
    TGSortBarView *lv = [[TGSortBarView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 30)];
    [self.view addSubview:lv];
}
//创建搜索
-(UICollectionView*)createCollectionView{
    UICollectionViewFlowLayout *lflowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *lcollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5,30, Main_Screen_Width - 10,CGRectGetHeight(self.view.frame)-74) collectionViewLayout:lflowLayout];
    [self.view addSubview:lcollectionView];
    lcollectionView.backgroundColor = [UIColor whiteColor];
    lcollectionView.delegate = self;
    lcollectionView.dataSource = self;
    //
    [lcollectionView registerNib:[UINib nibWithNibName:@"TGPreferentialSubCell" bundle:nil] forCellWithReuseIdentifier:[TGPreferentialSubCell cellIdentifier]];
    
    return lcollectionView;
}
#pragma mark - collectionView delegate and datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TGPreferentialSubCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TGPreferentialSubCell cellIdentifier] forIndexPath:indexPath];

    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((Main_Screen_Width - 10)/2 , (Main_Screen_Width - 10)/2+50);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
@end
