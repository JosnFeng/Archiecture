//
//  HomeViewController.m
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/28.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "HomeViewController.h"
#import "BaseTableView.h"
#import "HomeCell.h"
#import "HomeModel.h"
#import "AFNetworking.h"

#define kUrl @"http://api.douban.com/v2/movie/nowplaying"
@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate, TableViewRefreshDelegate>
@property (nonatomic, strong) BaseTableView *tabbleView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation HomeViewController
@synthesize tabbleView = _tabbleView;
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self requestData];
//    self.view.backgroundColor = CCRedColor;
    [self layoutTabbleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)didHeadRefresWithView {
    [self requestData];
}
- (void)didFootRefresWithView {}
#pragma mark - setters and getters
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)layoutTabbleView {
    self.tabbleView = [BaseTableView new];
//    _tabbleView.backgroundColor = CCPurpleColor;
    _tabbleView.dataSource = self;
    _tabbleView.delegate = self;
    _tabbleView.rowHeight = 70;
    _tabbleView.refreshDelegate = self;
    [_tabbleView registerClass:[HomeCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tabbleView];
    [self.tabbleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.bottom.right.equalTo(self.view);
    }];
}
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
//    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieMdoel *model = self.dataSource[indexPath.row];
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell configureDataWith:model];
    return cell;
}
#pragma mark - requestData
- (void)requestData {
    NSDictionary *dic = @{ @"app_name": @"doubanmovie",
                           @"client" : @"e:iPhone4,1%7Cy:iPhoneOS_6.1%7Cs:mobile%7Cf:doubanmovie_2%7Cv:3.3.1%7Cm:PP_marke%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5",
                           @"alt":@"json",
                           @"city":@"%E5%8C%97%E4%BA%ACversion=2",
                           @"start":@"0",
                           @"apikey":@"0df993c66c0c636e29ecbb5344252a4a"
                           };
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:kUrl parameters:dic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        HomeModelData *model = [[HomeModelData alloc] initWithDictionary:responseObject error:nil];
//        self.dataSource = model.entries;
//        [self.tabbleView reloadData];
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        NSLog(@"请求失败");
//
//    }];
//    [manager GET:kurl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        HomeModelData *model = [[HomeModelData alloc] initWithDictionary:responseObject error:nil];
//                      self.dataSource = model.entries;
//                      [self.tabbleView reloadData];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"请求失败");
//    }];
    [Http HTTP_GET:kUrl
            params:dic
          callback:^(NSDictionary *result, NSError *error) {
              HomeModelData *model = [[HomeModelData alloc] initWithDictionary:result error:nil];
              NSLog(@"%@", result);
              self.dataSource = model.entries;
              [self.tabbleView reloadData];
          }];
}
@end
