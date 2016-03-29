//
//  UIDevice+Hardware.h
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/29.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Hardware)
-(void)getcarrierName;
- (NSString *)platform;
- (NSString *)getCurrentWifiHotSpotName;
- (NSString *)getCurrentWifiHotId;
- (NSString*)UUID;
- (NSString *)timestamp;

@end
