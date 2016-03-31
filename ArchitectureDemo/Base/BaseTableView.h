//
//  BaseTableView.h
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/28.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@protocol TableViewRefreshDelegate <NSObject>
- (void)didHeadRefresWithView;
- (void)didFootRefresWithView;
@end
@interface BaseTableView : UITableView
//@interface BaseTableView : UITableView<statusActionDelegate>
@property(nonatomic,strong) MJRefreshFooter *refreshFooter;
@property(nonatomic,strong) MJRefreshHeader *refreshHeader;
//@property(nonatomic,strong) StatusView *stateView;
@property(nonatomic,assign) id<TableViewRefreshDelegate>refreshDelegate;
- (void)addFooter;
- (void)didHeadRefresWithView;
- (void)didFootRefresWithView;
- (void)doneRefres:(BOOL)ishead;
- (void)lastPage;

@end
