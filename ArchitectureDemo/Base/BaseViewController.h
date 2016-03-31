//
//  BaseViewController.h
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/28.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property(strong,nonatomic) UIView *navigationView;
@property(strong,nonatomic) UIButton *navigationLeftItme;
@property(strong,nonatomic) UIButton *navigationRigthItme;
@property(strong,nonatomic) UILabel *titleLabel;
@property(strong,nonatomic) UIImageView *navBackImage;
- (void)navigationTitle:(NSString *)title hasreturn:(BOOL)isfirst;
- (void)goBack;
- (void)next;
- (void)navigationTitle:(NSString *)title;
@end
