//
//  TGHomeSelectShopsView.m
//  Tcandy
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGHomeSelectShopKindsView.h"
#import "TGConfigure.h"
#import "TGHomeSelectShopKindsCRView.h"
#define kShopKindsTitles @[@"全部",@"女装",@"男装",@"内衣",@"母婴",@"化妆品",@"居家",@"鞋包配饰",@"美食",@"文体车品",@"数码家电",@"预告"]

@interface TGHomeSelectShopKindsView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    UIButton *m_moreBtn;
    NSInteger currentSelectTag;
}
@property(nonatomic,strong)NSMutableArray *m_shopKindBtns;
@property(assign) CGFloat normal_size;
@property(assign) CGFloat select_size;
@property(nonatomic,strong) UIScrollView *m_shopKindsScrollView;
//

@property(nonatomic,strong)UICollectionView *m_mainCollectionView;
@end
@implementation TGHomeSelectShopKindsView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _normal_size = 15;
        _select_size = 17;
        currentSelectTag = 0;
        //
         _m_shopKindBtns = [NSMutableArray array];
        //
        self.backgroundColor = UIColor.clearColor;
        //
        _m_shopKindsScrollView = [self createKindsScrollView];
        //
        _m_mainCollectionView = [self createKindsCollectionView];
        //
        m_moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [m_moreBtn setImage:[UIImage imageNamed:@"jiantou_down"] forState:UIControlStateNormal];
        [m_moreBtn setImage:[UIImage imageNamed:@"jiantou_up"] forState:UIControlStateSelected];
        [m_moreBtn addTarget:self action:@selector(openMoreKinds:) forControlEvents:UIControlEventTouchUpInside];
         m_moreBtn.frame = CGRectMake(Main_Screen_Width - 50, 0, 50, 50);
        [m_moreBtn setBackgroundColor:UIColor.whiteColor];
        [self addSubview:m_moreBtn];
    }
    return self;
}
-(void)selectedShopKinds:(UIButton*)sender{
    NSInteger tag = sender.tag;
    currentSelectTag = tag;
    [self updataShopKinds];
    [self selectedCallback:kShopKindsTitles[currentSelectTag]];
}
-(void)selectedCallback:(NSString *)title{
    if (self.SelectedKinds != nil) {
        self.SelectedKinds(title);
    }
}
-(void)updataShopKinds{
    for (UIButton *lbtn in _m_shopKindBtns) {
        if (lbtn.tag == currentSelectTag) {
            [lbtn setTitleColor:kTGTextColorRed forState:UIControlStateNormal];
            lbtn.titleLabel.font = [UIFont systemFontOfSize:_select_size];
            if (lbtn.frame.origin.x <  _m_shopKindsScrollView.frame.size.width/2) {
                _m_shopKindsScrollView.contentOffset = CGPointZero;
            }else if (lbtn.frame.origin.x >  _m_shopKindsScrollView.contentSize.width - _m_shopKindsScrollView.frame.size.width/2){
                 _m_shopKindsScrollView.contentOffset = CGPointMake(_m_shopKindsScrollView.contentSize.width - _m_shopKindsScrollView.frame.size.width, 0);
            }else{
                 [_m_shopKindsScrollView setContentOffset:CGPointMake(lbtn.frame.origin.x-_m_shopKindsScrollView.frame.size.width/2+lbtn.frame.size.width/2, 0)];
            }
        }else{
            [lbtn setTitleColor:kTGTextColorGray forState:UIControlStateNormal];
            lbtn.titleLabel.font = [UIFont systemFontOfSize:_normal_size];
        }
    }
    //
     [_m_mainCollectionView reloadData];
    _m_mainCollectionView.hidden = YES;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 50);
}
-(void)openMoreKinds:(id)sender{
    if (m_moreBtn.selected) {
        _m_mainCollectionView.hidden = YES;
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 50);
    } else {
        _m_mainCollectionView.hidden = NO;
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, Main_Screen_Height-80-TabBar_HEIGHT);
    }
    m_moreBtn.selected = !m_moreBtn.selected;
}
//创建横向滚动选择
-(UIScrollView*)createKindsScrollView{
    NSArray *lshops = kShopKindsTitles;
    CGFloat btn_h = 50;
    CGFloat offset_x = 10;
    UIScrollView *lscrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width - 50, 50)];
    lscrollView.showsHorizontalScrollIndicator = NO;
    lscrollView.backgroundColor = UIColor.whiteColor;
    //
    [self addSubview:lscrollView];
    for (int i = 0; i < lshops.count; i++) {
        NSString *ltitle = lshops[i];
        CGSize lsize = [ltitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_normal_size]}];
        UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        lbtn.frame = CGRectMake(offset_x, 0, lsize.width + 30, btn_h);
        [lbtn setTitle:ltitle forState:UIControlStateNormal];
        [lbtn setTitleColor:kTGTextColorGray forState:UIControlStateNormal];
        if (i == 0) {
            [lbtn setTitleColor:kTGTextColorRed forState:UIControlStateNormal];
            lbtn.titleLabel.font = [UIFont systemFontOfSize:_select_size];
        } else {
            [lbtn setTitleColor:kTGTextColorGray forState:UIControlStateNormal];
            lbtn.titleLabel.font = [UIFont systemFontOfSize:_normal_size];
        }
        [lbtn addTarget:self action:@selector(selectedShopKinds:) forControlEvents:UIControlEventTouchUpInside];
        [lscrollView addSubview:lbtn];
        
        offset_x +=CGRectGetWidth(lbtn.frame);
        //
        lbtn.tag = i;
        [_m_shopKindBtns addObject:lbtn];
    }
    [lscrollView setContentSize:CGSizeMake(offset_x, btn_h)];
    return lscrollView;
}

//创建搜索
-(UICollectionView*)createKindsCollectionView{
    UICollectionViewFlowLayout *lflowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *lcollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5,5, Main_Screen_Width - 10, (kShopKindsTitles.count+4)/4*30+60) collectionViewLayout:lflowLayout];
    [self addSubview:lcollectionView];
    lcollectionView.backgroundColor = [UIColor whiteColor];
    lcollectionView.delegate = self;
    lcollectionView.dataSource = self;
    //
    [lcollectionView registerClass:[TGHomeShopKindsCell class] forCellWithReuseIdentifier:@"kTGHomeShopKindsCell"];
    [lcollectionView registerNib:[UINib nibWithNibName:@"TGHomeSelectShopKindsCRView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[TGHomeSelectShopKindsCRView headerViewIdentifier]];
    lcollectionView.hidden = YES;
    return lcollectionView;
}
#pragma mark - collectionView delegate and datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return kShopKindsTitles.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TGHomeShopKindsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kTGHomeShopKindsCell" forIndexPath:indexPath];
    if (indexPath.row == currentSelectTag) {
          [cell configCell:kShopKindsTitles[indexPath.row] isSelected:YES];
    } else {
          [cell configCell:kShopKindsTitles[indexPath.row] isSelected:NO];
    }
  
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    currentSelectTag = indexPath.row;
    [self updataShopKinds];
    m_moreBtn.selected = NO;
    
     [self selectedCallback:kShopKindsTitles[indexPath.row]];
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((Main_Screen_Width - 40)/4 , 30);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(Main_Screen_Width, 50);
}
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *lheaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[TGHomeSelectShopKindsCRView headerViewIdentifier] forIndexPath:indexPath];
    return lheaderView;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self openMoreKinds:m_moreBtn];
}
@end

#pragma collectionCell ----------------
@interface TGHomeShopKindsCell()
@property(nonatomic,strong) UILabel *kind_lab;
@end
@implementation TGHomeShopKindsCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _kind_lab = [[UILabel alloc] initWithFrame:CGRectMake(3, 3,frame.size.width - 6, frame.size.height - 3)];
        _kind_lab.textColor =kTGTextColorGray;
        _kind_lab.font=[UIFont systemFontOfSize:16];
        _kind_lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_kind_lab];
    }
    return self;
}
-(void)configCell:(NSString*)title isSelected:(BOOL)isSelected{
    if (isSelected) {
       _kind_lab.textColor =kTGTextColorRed;
        [_kind_lab.layer setBorderColor:UIColor.clearColor.CGColor];
    } else {
        [_kind_lab.layer setCornerRadius:12];
        [_kind_lab.layer setBorderWidth:1];
        [_kind_lab.layer setBorderColor:kTGTextColorGray.CGColor];
         _kind_lab.textColor =kTGTextColorGray;
    }
    _kind_lab.text = title;
}
@end
