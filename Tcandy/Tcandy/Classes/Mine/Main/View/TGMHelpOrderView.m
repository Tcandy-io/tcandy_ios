//
//  TGMOrdeListView.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

@interface TGMHelpOrderBtn : UIButton


@end

@implementation TGMHelpOrderBtn

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imgBackH = contentRect.size.height * 0.65;
    CGFloat imgW = 36;
    CGFloat imgH = imgW;
    CGFloat imgX = contentRect.size.width * 0.5 - imgW * 0.5;
    CGFloat imgY = imgBackH * 0.5 - imgW * 0.5;
    
    return CGRectMake(imgX, imgY, imgW, imgH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * 0.35;
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * 0.65;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}


- (void)setHighlighted:(BOOL)highlighted {
}

@end

#import "TGMHelpOrderView.h"

#define KTGMHelpOrderCellID @"KTGMHelpOrderCellID"

@interface TGMHelpOrderView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UIView *lineV;

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation TGMHelpOrderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        
        [self setSubViews];
    }
    return self;
}

- (void)setSubViews {
    
    [self setHeadView];
    
    [self setContentView];
}

- (void)setContentView {

    UIView *contentView = [[UIView alloc]init];
    contentView.frame = CGRectMake(0, 61 + 10,  self.bounds.size.width, self.bounds.size.height - 61 - 20);
    [self addSubview:contentView];

    CGFloat viewW = contentView.bounds.size.width / 4.0;
    CGFloat viewH = contentView.bounds.size.height / 3.0;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(viewW, viewH);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:contentView.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [contentView addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:KTGMHelpOrderCellID];
}

- (void)setHeadView {
    UIView *headView = [[UIView alloc]init];
    [self addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    UIView *tagView = [[UIView alloc]init];
    tagView.backgroundColor = RGB(246, 84, 135);
    [headView addSubview:tagView];
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(8);
        make.height.equalTo(headView.mas_height).multipliedBy(0.4);
        make.centerY.equalTo(headView.mas_centerY).mas_equalTo(0);
    }];
    
    UILabel *leftLab = [[UILabel alloc]init];
    leftLab.font = [UIFont systemFontOfSize:17];
    [headView addSubview:leftLab];
    leftLab.text = @"订单不显示请点找回订单即可";
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tagView.mas_right).mas_equalTo(10);
        make.centerY.equalTo(headView.mas_centerY).mas_equalTo(0);
    }];
   
    
    _lineV = [[UIView alloc]init];
    _lineV.backgroundColor = kBackgroundColor;
    [self addSubview:_lineV];
    [_lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView.mas_bottom).mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTGMHelpOrderCellID forIndexPath:indexPath];
    
    CGFloat viewW = self.bounds.size.width / 4.0;
    CGFloat viewH = (self.bounds.size.height - 61 - 20) / 3.0;
    
    
    NSArray *titleA = @[@"全部订单",@"即将到账",@"已到账",@"无效订单",@"全部订单",@"即将到账",@"已到账",@"无效订单",@"全部订单",@"即将到账"];
    NSArray *imgA = @[@"my_order_shz",@"my_order_jjdz",@"my_order_ydz",@"my_order_wxdd",@"my_order_shz",@"my_order_jjdz",@"my_order_ydz",@"my_order_wxdd",@"my_order_shz",@"my_order_jjdz"];
    
    TGMHelpOrderBtn *btn = [[TGMHelpOrderBtn alloc]initWithFrame:CGRectMake(0, 0 , viewW, viewH)];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitle:titleA[indexPath.row] forState:0];
    [btn setTitleColor:[UIColor lightGrayColor] forState:0];
    [btn setImage:[UIImage imageNamed:imgA[indexPath.row]] forState:0];
    [cell.contentView addSubview:btn];;
    
    return cell;
}

@end
