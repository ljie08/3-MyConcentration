//
//  HistoryViewController.m
//  MyConcentration
//
//  Created by ljie on 2017/8/9.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryCell.h"
#import "HistoryLongCell.h"
#import "HeaderViewCell.h"

@interface HistoryViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *historyTab;

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

#pragma mark - UI
- (void)initUIView {
    [self setBackButton:YES];
    
    self.historyTab.tableFooterView = [UIView new];
    
    [self addNavigationWithTitle:NSLocalizedString(@"history", nil) leftItem:nil rightItem:nil titleView:nil];
}

#pragma mark - table

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section == 0) return 30;
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) return CGFLOAT_MIN;
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) return 190;//*Heigt_Scale;
    return 160;//*Heigt_Scale;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [UIView new];
    } else {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width-30, 30)];
        label.textColor = MyColor;
        label.backgroundColor = [UIColor clearColor];
        if (section == 1) {
            label.text = NSLocalizedString(@"hisdata", nil);
        } else {
            label.text = NSLocalizedString(@"hisbest", nil);
        }
        return label;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HeaderViewCell *cell = [HeaderViewCell myCellWithTableview:tableView];
        return cell;
    } else if (indexPath.section == 1) {
        HistoryCell *cell = [HistoryCell myCellWithTableview:tableView];
        
        return cell;
        
    } else {
        HistoryLongCell *cell = [HistoryLongCell myCellWithTableview:tableView];
        
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
