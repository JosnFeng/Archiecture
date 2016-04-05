//
//  BaseTableView.m
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/28.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView
@synthesize refreshDelegate = _refreshDelegate;
//@synthesize stateView = _stateView;
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self addHeader];
        
//        _stateView = [[StatusView alloc] init];
//        _stateView.statusDelegate = self;
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addHeader];
}

- (void)lastPage{
    [_refreshFooter setState:MJRefreshStateIdle];
}
- (void)addFooter
{
    __unsafe_unretained BaseTableView *vc = self;
    
    
    _refreshFooter = [MJRefreshFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用）
        // 这里的refreshView其实就是footer
        if (vc.refreshDelegate&&[self.refreshDelegate respondsToSelector:@selector(didFootRefresWithView)]) {
            [vc.refreshDelegate didFootRefresWithView];
        }else{
            [vc performSelector:@selector(didFootRefresWithView) withObject:nil afterDelay:1.0];
        }
    }];
//    _refreshFooter.scrollView = self;
//    _refreshFooter.refreshingBlock = ^(MJRefreshBaseView *refreshView) {
//        
//        // 模拟延迟加载数据，因此2秒后才调用）
//        // 这里的refreshView其实就是footer
//        if (vc.refreshDelegate&&[self.refreshDelegate respondsToSelector:@selector(didFootRefresWithView)]) {
//            [vc.refreshDelegate didFootRefresWithView];
//        }else{
//            [vc performSelector:@selector(didFootRefresWithView) withObject:nil afterDelay:1.0];
//        }
//        
//        
//        //        NSLog(@"%@----开始进入刷新状态", refreshView.class);
//    };
    //    _footer = footer;
}

- (void)addHeader
{
    __unsafe_unretained BaseTableView *vc = self;
    
//    _refreshHeader = [MJRefreshHeader he:^{
//        NSLog(@"111");
//    }];
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (vc.refreshDelegate&&[self.refreshDelegate respondsToSelector:@selector(didHeadRefresWithView)]) {
            [vc.refreshDelegate didHeadRefresWithView];
        }else{
            [vc performSelector:@selector(didHeadRefresWithView) withObject:nil afterDelay:2.0];
        }

    }];
//    self.refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        // 进入刷新状态就会回调这个Block
//        
//        NSLog(@"1111");
//        // 模拟延迟加载数据，因此2秒后才调用）
//        // 这里的refreshView其实就是header
//        if (vc.refreshDelegate&&[self.refreshDelegate respondsToSelector:@selector(didHeadRefresWithView)]) {
//            [vc.refreshDelegate didHeadRefresWithView];
//        }else{
//            [vc performSelector:@selector(didHeadRefresWithView) withObject:nil afterDelay:2.0];
//        }
//    }];
     [self.mj_header beginRefreshing];
//    _refreshHeader = [MJRefreshHeader header];
////    _refreshHeader.scrollView = self;
//    _refreshHeader.refreshingBlock = ^(MJRefreshBaseView *refreshView) {
//        // 进入刷新状态就会回调这个Block
//        
//        
//        // 模拟延迟加载数据，因此2秒后才调用）
//        // 这里的refreshView其实就是header
//        if (vc.refreshDelegate&&[self.refreshDelegate respondsToSelector:@selector(didHeadRefresWithView)]) {
//            [vc.refreshDelegate didHeadRefresWithView];
//        }else{
//            [vc performSelector:@selector(didHeadRefresWithView) withObject:nil afterDelay:2.0];
//        }
//        //        [self performSelector:@selector(didHeadRefresWithView) withObject:_refreshHeader afterDelay:2.0];
//        
//        //        NSLog(@"%@----开始进入刷新状态", refreshView.class);
//    };
    
//    _refreshHeader.endStateChangeBlock = ^(MJRefreshBaseView *refreshView) {
//        // 刷新完毕就会回调这个Block
//        //        NSLog(@"%@----刷新完毕", refreshView.class);
//    };
//    //    header.refreshStateChangeBlock = ^(MJRefreshBaseView *refreshView, MJRefreshState state) {
//    //        // 控件的刷新状态切换了就会调用这个block
//    //        switch (state) {
//    //            case MJRefreshStateNormal:
//    //                NSLog(@"%@----切换到：普通状态", refreshView.class);
//    //                break;
//    //
//    //            case MJRefreshStatePulling:
//    //                NSLog(@"%@----切换到：松开即可刷新的状态", refreshView.class);
//    //                break;
//    //
//    //            case MJRefreshStateRefreshing:
//    //                NSLog(@"%@----切换到：正在刷新状态", refreshView.class);
//    //                break;
//    //            default:
//    //                break;
//    //        }
//    //    };
   
//    //    _header = header;
}

- (void)didHeadRefresWithView{
    [self doneRefresWithView:_refreshHeader];
}

- (void)didFootRefresWithView{
    [self doneRefresWithView:_refreshFooter];
}

- (void)doneRefres:(BOOL)ishead{
    
    if (ishead) {
        [self doneRefresWithView:_refreshHeader];
    }else{
        [self doneRefresWithView:_refreshFooter];
    }
}

- (void)doneRefresWithView:(MJRefreshComponent *)refreshView
{
    // 刷新表格
    //    [self reloadData];
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.mj_header endRefreshing];
}
-(void)actionForStatus{
    
    [_refreshHeader beginRefreshing];
    
}
@end
