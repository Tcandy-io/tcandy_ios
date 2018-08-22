//
//  TGSortBarView.m
//  Tcandy
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGSortBarView.h"
#import "TGConfigure.h"
#import "TGSortBarModel.h"
#import "TGSortSelectModel.h"

#define kSortBar_y 0
#define kSortBar_h 30

@interface TGSortBarView()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray<TGSortBarModel*> *sortAry;
    NSMutableArray *sortBtns;
    UIButton *currentBtn;
    //
    NSArray <TGSortSelectModel*> *selectSortAry;
}
@property(nonatomic,strong) UIView *sortBarView;
@property(nonatomic,strong) UITableView *m_tableView;
@end

@implementation TGSortBarView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       NSArray *resAry = @[
                             @{@"title":@"综合",
                               @"normalImageName":@"list_down",
                               @"upImageName":@"list_up",
                               @"downImageName":@"list_down",
                               @"data":@[@{@"title":@"综合",@"isSelected":@"1"},
                                         @{@"title":@"销量从高到低",@"isSelected":@"0"},
                                         @{@"title":@"领劵量从高到低",@"isSelected":@"0"},
                                         @{@"title":@"收益",@"isSelected":@"0"}
                                        ],
                               },
                             @{@"title":@"销量",
                               @"normalImageName":@"",
                               @"upImageName":@"",
                               @"downImageName":@"",
                               @"data":@[],
                               },
                             @{@"title":@"最新",
                               @"normalImageName":@"",
                               @"upImageName":@"",
                               @"downImageName":@"",
                               @"data":@[],
                               },
                             @{@"title":@"到手价",
                               @"normalImageName":@"high_price_off",
                               @"upImageName":@"high_price_up",
                               @"downImageName":@"high_price_down",
                                @"data":@[],
                               }
                             ];
        sortBtns = [NSMutableArray array];
        selectSortAry = @[];
        //
        sortAry =[[TGSortBarModel mj_objectArrayWithKeyValuesArray:resAry] copy];
        //
        _sortBarView =  [self createSortBarView];
        //
        currentBtn = sortBtns[0];
        //
        _m_tableView = [self createTableView];
    }
    return self;
}
-(UITableView*)createTableView{
    UITableView *ltableView = [[UITableView alloc]init];
    ltableView.backgroundColor = UIColor.whiteColor;
    ltableView.delegate = self;
    ltableView.dataSource = self;
    [self addSubview:ltableView];
    return ltableView;
}
-(UIView*)createSortBarView{
    UIView *lv = [[UIView alloc]initWithFrame:CGRectMake(0, kSortBar_y, CGRectGetWidth(self.frame), kSortBar_h)];
    lv.backgroundColor = [UIColor clearColor];
    CGFloat btn_w =CGRectGetWidth(self.frame)/sortAry.count;
    for (int i = 0; i < sortAry.count; i ++) {
       TGSortBarModel *sortM = sortAry[i];
        UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
            [lbtn setTitleColor:kTGTextColorRed forState:UIControlStateNormal];
             [lbtn setImage:[sortM.downImageName isEqualToString:@""] ? nil:[UIImage imageNamed:sortM.downImageName] forState:UIControlStateNormal];
        } else {
            [lbtn setTitleColor:kTGTextColorGray forState:UIControlStateNormal];
             [lbtn setImage:[sortM.normalImageName isEqualToString:@""] ? nil:[UIImage imageNamed:sortM.normalImageName] forState:UIControlStateNormal];
        }
        lbtn.titleLabel.font = [UIFont systemFontOfSize:14];
        lbtn.frame = CGRectMake(btn_w*i, 0, btn_w, kSortBar_h);
        [lbtn setTitle:sortM.title forState:UIControlStateNormal];
       
        lbtn.titleLabel.backgroundColor = [UIColor clearColor];
        lbtn.imageView.backgroundColor = [UIColor clearColor];
        lbtn.imageEdgeInsets = UIEdgeInsetsMake(0,lbtn.titleLabel.frame.size.width+2, 0, -lbtn.titleLabel.frame.size.width-2);
        lbtn.titleEdgeInsets = UIEdgeInsetsMake(0,-lbtn.imageView.frame.size.width-2, 0, lbtn.imageView.frame.size.width+2);
        [lv addSubview:lbtn];
      
        //
        [lbtn addTarget:self action:@selector(sortButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        //
        lbtn.tag = i;
        [sortBtns addObject:lbtn];
    }
    [self addSubview:lv];
    return lv;
}
-(void)sortButtonPressed:(id)sender{
    UIButton *lbtn = (UIButton*)sender;
    currentBtn = lbtn;
    //
    for (int i = 0; i < sortAry.count; i++) {
        TGSortBarModel *sortM = sortAry[i];
        UIButton *objBtn = sortBtns[i];
        if (objBtn == lbtn) {
            if (objBtn.selected) {
                [lbtn setImage:[sortM.upImageName isEqualToString:@""] ? nil:[UIImage imageNamed:sortM.upImageName] forState:UIControlStateNormal];
            } else {
                [lbtn setImage:[sortM.downImageName isEqualToString:@""] ? nil:[UIImage imageNamed:sortM.downImageName] forState:UIControlStateNormal];
            }
            [lbtn setTitleColor:kTGTextColorRed forState:UIControlStateNormal];
        } else {
            [objBtn setTitleColor:kTGTextColorGray forState:UIControlStateNormal];
            [objBtn setImage:[sortM.normalImageName isEqualToString:@""] ? nil:[UIImage imageNamed:sortM.normalImageName] forState:UIControlStateNormal];
            objBtn.selected = NO;
        }
    }
    lbtn.selected = !lbtn.selected;
    [self hideSelectTableView];
    //
    TGSortBarModel *lcurrentSortM = sortAry[lbtn.tag];
    if (lcurrentSortM.data.count > 0 && lbtn.selected) {
        selectSortAry = [TGSortSelectModel mj_objectArrayWithKeyValuesArray:lcurrentSortM.data];
        self.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight([self superview].frame));
        _m_tableView.frame =CGRectMake(0, 30, CGRectGetWidth(self.frame), selectSortAry.count*40);
        [_m_tableView reloadData];
    }
}
-(void)hideSelectTableView{
    self.m_tableView.frame = CGRectMake(0, 0, 0, 0);
    self.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame),kSortBar_h);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return selectSortAry.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *kCell = @"kCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCell];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = kTGTextColorGray;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
   TGSortSelectModel* lselectM =  selectSortAry[indexPath.row];
    cell.textLabel.text =lselectM.title;
    if (lselectM.isSelected) {
        UIImageView *arrow  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 21, 16)];
        arrow.image =[UIImage imageNamed:@"list_choose_on"];
        cell.accessoryView = arrow;
        cell.textLabel.textColor = kTGTextColorRed;
    } else {
        cell.accessoryView = nil;
        cell.textLabel.textColor = kTGTextColorGray;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TGSortSelectModel* lselectM =  selectSortAry[indexPath.row];
    for (TGSortSelectModel *lsortM in selectSortAry) {
        if (lselectM == lsortM) {
             lselectM.isSelected = YES;
        } else {
             lsortM.isSelected = NO;
        }
    }
    //
    [self hideSelectTableView];
    currentBtn.selected = NO;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     [self hideSelectTableView];
     currentBtn.selected = NO;
}
@end
