//
//  UIDevice+Hardware.m
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/29.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "UIDevice+Hardware.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <mach/mach.h>
#import <sys/utsname.h>
#import <CommonCrypto/CommonDigest.h>
@implementation UIDevice (Hardware)
// 运营商类型
/*
 MNC	运营商
 00	中国移动
 01	中国联通
 02	中国移动
 03	中国电信
 05	中国电信
 06	中国联通
 07	中国移动
 20	中国铁通
 */
//CTCarrier对象包含有关用户的信息*家移动电话服务提供商。
-(void)getcarrierName{
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    NSString *currentCountry=[carrier carrierName];
    NSLog(@"[carrier isoCountryCode]==%@,[carrier allowsVOIP]=%d,[carrier mobileCountryCode=%@,[carrier mobileCountryCode]=%@",[carrier isoCountryCode],[carrier allowsVOIP],[carrier mobileCountryCode],[carrier mobileNetworkCode]);
}
#pragma mark- 获取设备类型
- (NSString *)platform {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}
#pragma mark- 获取wifi的名字
- (NSString *)getCurrentWifiHotSpotName {
    
    NSString *wifiName = @"";
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        NSLog(@"info:%@",info);
        if (info[@"SSID"]) {
            wifiName = info[@"SSID"];
        }
        NSLog(@"id:%@",[info valueForKey:@"BSSID"]);
    }
    return wifiName;
}

- (NSString *)getCurrentWifiHotId {
    
    NSString *wifiId = @"";
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        
        NSLog(@"id:%@",[info valueForKey:@"BSSID"]);
        wifiId =[info valueForKey:@"BSSID"];
    }
    return wifiId;
}
- (NSString *)timestamp{
    NSTimeInterval timestamp=[[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%0.0f",timestamp];
}
//- (NSString*)UUID
//{
//    //1.读取keychain的缓存
//    NSString *deviceID = [self getUUIDString];
//    if (kIsStringValid(deviceID))
//    {
//        return deviceID;
//    }
//    else
//    {
//        //2.取UUID,可能会取不到
//        deviceID = [self getUUID];
//        if (kIsStringValid(deviceID)) {
//            [self setUUIDString:deviceID];
//            return deviceID;
//        }else{ //3.如果取不了uuid 就md5(时间戳+随机数)
//            NSString *did=[self createDeviceId];
//            [self setUUIDString:did];
//            return did;
//        }
//        
//    }
//    //4.再取不到尼玛我也没办法了,你牛B.
//    return @"";
//}
//# pragma mark - Keychain
//- (NSString*)getUUIDString
//{
//    NSString *idfaStr = [KeychainHelper load:@"com.tutu.once.uuid"];
//    if (kIsStringValid(idfaStr))
//    {
//        return idfaStr;
//    }
//    else
//    {
//        return nil;
//    }
//}
//
//- (BOOL)setUUIDString:(NSString *)secValue
//{
//    if (kIsStringValid(secValue))
//    {
//        [KeychainHelper save:@"com.tutu.once.uuid" data:secValue];
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//}
@end
