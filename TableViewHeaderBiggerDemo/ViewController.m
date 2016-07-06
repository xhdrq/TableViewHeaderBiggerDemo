//
//  HeaderViewBiggerController.m
//  header
//
//  Created by DaiRuiQuan Dai on 16/7/6.
//  Copyright © 2016年 Dai Ruiquan. All rights reserved.
//

#import "ViewController.h"

#define ScreenHeight                        [UIScreen mainScreen].bounds.size.height
#define ScreenWidth                         [UIScreen mainScreen].bounds.size.width
#define TableViewHeader_Height              106.5/320*ScreenWidth

#define Cell_Identifier                     @"Cell_Identifier"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *headerImg;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ;
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView{
    
    if (_tableView == nil) {
        
        _tableView            = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Cell_Identifier];
        
    }
    
    return _tableView;
}

- (UIView *)headerView{
    
    if (_headerView == nil) {
        
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,TableViewHeader_Height)];
        
        _headerImg = [[UIImageView alloc] initWithFrame:_headerView.bounds];
        _headerImg.image = [UIImage imageNamed:@"header"];
        _headerImg.contentMode = UIViewContentModeScaleAspectFill;
        _headerImg.clipsToBounds = YES;
        [_headerView addSubview:_headerImg];
    }
    
    return _headerView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell_Identifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    
    return cell;
}

#pragma mark - UISCrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y < 0) {
        _headerImg.frame = CGRectMake(0, scrollView.contentOffset.y, ScreenWidth, TableViewHeader_Height+ABS(scrollView.contentOffset.y));
    }
    
}
@end
