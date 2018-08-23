//
//  TGShopDetailViewController.m
//  Tcandy
//
//  Created by mac on 2018/8/23.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGShopDetailViewController.h"
#import "TGConfigure.h"
#import "TGShopDetailHeaderReusableView.h"
#import "TGShopVoucherReusableView.h"
#import "TGShopSectionHeaderReusableView.h"
#import "TGShopDescribeCollectionViewCell.h"
#import "TGShopRelationShopCollectionViewCell.h"
#import "TGShopDetailNavigationBarView.h"
@interface TGShopDetailViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,TGShopDetailNavigationBarViewDelegate>
{
    UIButton *backBtn;
    TGShopDetailNavigationBarView *barView;
}
@property(nonatomic,strong) UICollectionView *m_collectionView;

@end

@implementation TGShopDetailViewController
+(instancetype)createViewControllerWithValue:(id)value{
    TGShopDetailViewController *vc = [TGShopDetailViewController new];
    
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hideNavigationView:YES];
    
   _m_collectionView = [self createCollectionView];
    [_m_collectionView registerNib:[UINib nibWithNibName:@"TGShopDetailHeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[TGShopDetailHeaderReusableView reusableIdentifier]];
    [_m_collectionView registerNib:[UINib nibWithNibName:@"TGShopVoucherReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[TGShopVoucherReusableView reusableIdentifier]];
    [_m_collectionView registerNib:[UINib nibWithNibName:@"TGShopSectionHeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[TGShopSectionHeaderReusableView reusableIdentifier]];
    [_m_collectionView registerNib:[UINib nibWithNibName:@"TGShopDescribeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:[TGShopDescribeCollectionViewCell cellIdentifier]];
    [_m_collectionView registerNib:[UINib nibWithNibName:@"TGShopRelationShopCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:[TGShopRelationShopCollectionViewCell cellIdentifier]];
    //
    backBtn = [self createBackButton];
    barView = [self createBarView];
}
-(TGShopDetailNavigationBarView*)createBarView{
    TGShopDetailNavigationBarView *lv = [TGShopDetailNavigationBarView createNavigationBarViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kTGSafeAreaTop) titles:@[@"宝贝",@"详情",@"推荐"]];
    lv.backgroundColor = UIColor.whiteColor;
    lv.delegate = self;
    [self.view addSubview:lv];
    return lv;
}
//创建返回按钮
-(UIButton*)createBackButton{
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lbtn.frame = CGRectMake(20, kTGSafeAreaTop -30, 40, 40);
    [lbtn setBackgroundImage:[UIImage imageNamed:@"return2"] forState:UIControlStateNormal];
    [lbtn addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lbtn];
    return lbtn;
}
-(void)backButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//创建搜索
-(UICollectionView*)createCollectionView{
    UICollectionViewFlowLayout *lflowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *lcollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5,0, Main_Screen_Width -10,CGRectGetHeight(self.view.frame)-kTGSafeAreaBottom) collectionViewLayout:lflowLayout];
    [self.view addSubview:lcollectionView];
    lcollectionView.showsVerticalScrollIndicator = NO;
    lcollectionView.backgroundColor = [UIColor whiteColor];
    lcollectionView.delegate = self;
    lcollectionView.dataSource = self;
    //
    return lcollectionView;
}
#pragma mark - collectionView delegate and datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 2) {
        return 2;
    }else if (section == 3){
        return 3;
    }
    return 0;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        TGShopDescribeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TGShopDescribeCollectionViewCell cellIdentifier] forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 3){
        TGShopRelationShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TGShopRelationShopCollectionViewCell cellIdentifier] forIndexPath:indexPath];
        return cell;
    }
    return nil;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return CGSizeMake(CGRectGetWidth(_m_collectionView.frame), CGRectGetWidth(_m_collectionView.frame));
    }else if (indexPath.section == 3){
        return CGSizeMake((CGRectGetWidth(_m_collectionView.frame) - 15)/2, (CGRectGetWidth(_m_collectionView.frame) - 15)/2+75);
    }
    return CGSizeZero;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(CGRectGetWidth(_m_collectionView.frame), CGRectGetWidth(_m_collectionView.frame)+120);
    }else if (section == 1){
        return CGSizeMake(CGRectGetWidth(_m_collectionView.frame), 80*KScaleX);
    }else if(section == 2 || section == 3){
        return CGSizeMake(CGRectGetWidth(_m_collectionView.frame), 60);
    }
    return CGSizeZero;
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        TGShopDetailHeaderReusableView *lsectionView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[TGShopDetailHeaderReusableView reusableIdentifier] forIndexPath:indexPath];
        return lsectionView;
    }else if (indexPath.section == 1){
        TGShopVoucherReusableView *lsectionView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[TGShopVoucherReusableView reusableIdentifier] forIndexPath:indexPath];
        return lsectionView;
    }else if (indexPath.section == 2){
        TGShopSectionHeaderReusableView *lsectionView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[TGShopSectionHeaderReusableView reusableIdentifier] forIndexPath:indexPath];
        lsectionView.headerTitle_lab.text = @"商品详情";
        return lsectionView;
    }else if (indexPath.section == 3){
        TGShopSectionHeaderReusableView *lsectionView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[TGShopSectionHeaderReusableView reusableIdentifier] forIndexPath:indexPath];
        lsectionView.headerTitle_lab.text = @"相关商品";
        return lsectionView;
    }
    return nil;
}
#pragma mark -- 顶部切换
-(void)currentTitle:(NSString *)title index:(NSInteger)index{
    if (index == 0) {
        [self moveToSection:0];
    }else if (index == 1){
        [self moveToSection:2];
    }else if (index == 2){
        [self moveToSection:3];
    }
}
-(void)moveToSection:(int)index{
    NSIndexPath* cellIndexPath = [NSIndexPath indexPathForItem:0 inSection:index];
    UICollectionViewLayoutAttributes* attr = [_m_collectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:cellIndexPath];
    UIEdgeInsets insets = _m_collectionView.scrollIndicatorInsets;
    
    CGRect rect = attr.frame;
    rect.size = _m_collectionView.frame.size;
    rect.size.height -= insets.top + insets.bottom;
    CGFloat offset = (rect.origin.y + rect.size.height) - _m_collectionView.contentSize.height;
    if ( offset > 0.0 ) rect = CGRectOffset(rect, 0, -offset);
    
    [_m_collectionView scrollRectToVisible:rect animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_m_collectionView.contentOffset.y > 100) {
        backBtn.hidden = YES;
        barView.hidden = NO;
    }else{
        backBtn.hidden = NO;
        barView.hidden = YES;
    }
    static  NSInteger currentIndex = 0;
    CGPoint pInView = [self.view convertPoint:CGPointMake(100, 200) toView:_m_collectionView];
    // 获取这一点的indexPath
    
    NSIndexPath *indexPathNow = [_m_collectionView indexPathForItemAtPoint:pInView];
    if (currentIndex == indexPathNow.section || indexPathNow == nil) {
        return;
    }
    currentIndex = indexPathNow.section;
    if (currentIndex == 3) {
        [barView selectedIndex:2];
    }else if (currentIndex == 2){
       [barView selectedIndex:1];
    }else if (currentIndex == 0){
        [barView selectedIndex:0];
    }
    
}
@end
