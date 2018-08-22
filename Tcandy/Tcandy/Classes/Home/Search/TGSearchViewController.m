//
//  TGSearchViewController.m
//  Tcandy
//
//  Created by mac on 2018/8/22.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGSearchViewController.h"
#import "TGHomeSectionHeaderView.h"
#import "TGSaveData.h"
@interface TGSearchViewController ()<UITableViewDataSource,UITableViewDelegate,TGHomeSectionHeaderViewDelegate>
@property (weak, nonatomic) IBOutlet TGHomeSectionHeaderView *channalView;
@property (weak, nonatomic) IBOutlet UITextField *input_txtF;
@property (weak, nonatomic) IBOutlet UITableView *m_tableView;
@property (strong,nonatomic) NSArray *saveRes;
- (IBAction)backButtonPressed:(id)sender;
- (IBAction)searchButtonPressed:(id)sender;
- (IBAction)cleanButtonPressed:(id)sender;
@end

@implementation TGSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _channalView.delegate = self;
    _m_tableView.tableFooterView = [UIView new];
    _saveRes = [TGSaveData shareTGSaveData].getSearchRecord;
}
#pragma mark -- tableview delegate and datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _saveRes.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *kCell = @"kCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCell];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = _saveRes[indexPath.row];
    return cell;
}
#pragma mark --- selectChannal
-(void)selectedShopChannal:(NSString *)name channalCode:(NSInteger)code{
    _input_txtF.text = @"";
    _input_txtF.placeholder = [NSString stringWithFormat:@"请输入%@商品标题或关键字",name];
}
//
- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)searchButtonPressed:(id)sender {
    NSString *lsearchString =[_input_txtF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (lsearchString.length > 0) {
        [[TGSaveData shareTGSaveData] saveSearchRecord:lsearchString];
    }
    [_input_txtF resignFirstResponder];
}

- (IBAction)cleanButtonPressed:(id)sender {
    [[TGSaveData shareTGSaveData] cleanSearchRecord];
    _saveRes = [TGSaveData shareTGSaveData].getSearchRecord;
    [_m_tableView reloadData];
}
@end
