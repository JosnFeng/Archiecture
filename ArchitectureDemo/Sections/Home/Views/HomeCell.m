//
//  HomeCell.m
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/29.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+WebCache.h"
@interface HomeCell ()
@property (nonatomic, strong) UIImageView *picImage;
@property (nonatomic, strong) UILabel *place;
@property (nonatomic, strong) UILabel *time;
@end
@implementation HomeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI {
    _picImage = [UIImageView new];
//    _picImage.backgroundColor = CCWhiteColor;
    [self.contentView addSubview:_picImage];
    
    _place = [UILabel new];
    _place.numberOfLines = 1;
//    _place.backgroundColor = CCYellowColor;
    [self.contentView addSubview:_place];
    
    _time = [UILabel new];
    _time.font = CCSystemBoldFont(13);
//    _time.backgroundColor = CCGrayColor;
    [self.contentView addSubview:_time];
    
    [_picImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_picImage.superview).offset(10);
        make.left.equalTo(_picImage.superview).offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 50));

    }];
    [_place mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(_place.superview).insets(UIEdgeInsetsMake(10, 0, 0, 10));
        make.left.equalTo(_picImage.mas_right).offset(10);
        make.height.equalTo(@(20));
    }];
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_place.mas_left);
        make.top.equalTo(_place.mas_bottom).offset(10);
        make.size.equalTo(_place);

    }];
    
}
- (void)configureDataWith:(MovieMdoel *)model {
    [self.picImage sd_setImageWithURL:model.images.large];
    self.place.text = model.title;
    self.time.text = model.stars;
}
@end
