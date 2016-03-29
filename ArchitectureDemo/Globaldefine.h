//
//  Globaldefine.h
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/28.
//  Copyright © 2016年 sandy. All rights reserved.
//

#ifndef Globaldefine_h
#define Globaldefine_h

#define TTProjectBundleID [[NSBundle mainBundle] bundleIdentifier]
////////////////////////////////------Color-----/////////////////////////////////////

#define CCRGBColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
#define CCRGBAColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define CCHexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0]


#define CCNewsHexColor(hexValue) [UIColor colorWithRed:((NSInteger)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((NSInteger)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((NSInteger)(hexValue & 0xFF)) / 255.0 alpha:1.0]

#define CCWhiteColor [UIColor whiteColor]
#define CCBlackColor [UIColor blackColor]
#define CCClearColor [UIColor clearColor]
#define CCWhiteColor [UIColor whiteColor]
#define CCBlackColor [UIColor blackColor]
#define CCGrayColor [UIColor grayColor]
#define CCDarkGrayColor [UIColor darkGrayColor]
#define CCLightGrayColor [UIColor lightGrayColor]
#define CCRedColor [UIColor redColor]
#define CCGreenColor [UIColor greenColor]
#define CCBlueColor [UIColor blueColor]
#define CCYellowColor [UIColor yellowColor]
#define CCOrangeColor [UIColor orangeColor]
#define CCPurpleColor [UIColor purpleColor]
#define CCBrownColor [UIColor brownColor]

#define CCGloableMainColor CCHexColor(0xf7f7f7)
#define CCGloableMainTextColor CCHexColor(0x58c9d4)

////////////////////////////////------iOS Version Checking-----/////////////////////////////////////
//
#define CC_SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
//大于
#define CC_SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
//大于等于
#define CC_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

//小于
#define CC_SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
//小于等于
#define CC_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

////////////////////////////////------iOS Version compare-----/////////////////////////////////////
// Version Checking
#define CC_VERSION_EQUAL_TO(v1,v2) ([v1 compare:v2 options:NSNumericSearch] == NSOrderedSame)
//大于
#define CC_VERSION_GREATER_THAN(v1,v2) ([v1 compare:v2 options:NSNumericSearch] == NSOrderedDescending)
//大于等于
#define CC_VERSION_GREATER_THAN_OR_EQUAL_TO(v1,v2) ([v1 compare:v2 options:NSNumericSearch] != NSOrderedAscending)
//小于
#define CC_VERSION_LESS_THAN(v1,v2) ([v1 compare:v2 options:NSNumericSearch] == NSOrderedAscending)
//小于等于
#define CC_VERSION_LESS_THAN_OR_EQUAL_TO(v1,v2) ([v1 compare:v2 options:NSNumericSearch] != NSOrderedDescending)

////////////////////////////////------iOS Version-----/////////////////////////////////////
// check system version, make adapter for ios6 and 7
#define CC_IS_IOS9_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0)
#define CC_IS_IOS8_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
#define CC_IS_IOS7_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define CC_IS_IOS6_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
// check device type, iphone or ipad, 2 stands for ipad, 1 stands for iphone
#define CCDeviceType (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? 1 : 2

////////////////////////////////------iOS devices-----/////////////////////////////////////
#define CC_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define CC_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define CC_IS_FOURINCH (CC_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define CC_PHONE5_P (CC_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height >= 568.0f)

#define CC_IS_IPHONE6 (CC_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0f)
#define CC_IS_IPHONE6PLUS (CC_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0f)
#define CC_IS_IPHONE4 (CC_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)

#define CCScreenHeight [[UIScreen mainScreen] bounds].size.height
#define CCScreenWidth [[UIScreen mainScreen] bounds].size.width

#define kCCGlobalCellSepLineHeight (1.0/[UIScreen mainScreen].scale)


#define CCSystemFont(size) [UIFont systemFontOfSize:size]
#define CCSystemBoldFont(size) [UIFont boldSystemFontOfSize:size]

#define CCGlobalColor CCHexColor(0x007aff)

#define CCProjectVersion              \
[[[NSBundle mainBundle] infoDictionary] \
objectForKey:@"CFBundleShortVersionString"]

#define CCProjectBundleID [[NSBundle mainBundle] bundleIdentifier]

#define CCTextAlignmentCenter CC_IS_IOS7_AND_UP?:UITextAlignmentCenter


#define CCCheckIsValied(SomeValue)                       \
{                                                    \
if (!(SomeValue)) {                              \
NSLog(@"Failure on line %d", __LINE__); \
abort();                                     \
}                                                \
}

#define kTTGlobalCellHeight (CC_IS_IPHONE6PLUS ? 97.0f : 82.0f)


#define DocumentsFolderPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define TemporaryFolderPath NSTemporaryDirectory()

#define LaunchAdvFilesFolder @"LaunchAdvFilesFolder"
#define LaunchAdvFilesDirectory [DocumentsFolderPath stringByAppendingPathComponent:LaunchAdvFilesFolder]

#define CCFestivalAdvFilesFolder @"CCFestivalAdvFiles"
#define CCFestivalAdvFilesDirectory [DocumentsFolderPath stringByAppendingPathComponent:CCFestivalAdvFilesFolder]
#define TTTemporaryFolderPath NSTemporaryDirectory()

#define CCTaskFilesFolder @"CCPlayFiles"
#define CCTaskFilesFolderDirectory [DocumentsFolderPath stringByAppendingPathComponent:CCTaskFilesFolder]


#define CCAppNotificaitonKey @"CCPlay_AppNotificaitonKey"
#define CCAppOnLineNotificaiton @"CCPlay_AppNotificaitonKey_Online"
#define TTTencentAppID              @"1101491790"
#define kWeiXinAppId               @"wx72232c8283720917"

#define kUserDefaultsCookie @"once_app_cookie"

#define CCImage(imagename) [UIImage imageNamed:imagename]

#define kWidthScale (CCScreenWidth / 375)
#define kHeightScale (CCScreenHeight / 667)
#endif


#ifndef CGWidth
#define CGWidth(rect)                   rect.size.width
#endif

#ifndef CGHeight
#define CGHeight(rect)                  rect.size.height
#endif

#ifndef CGOriginX
#define CGOriginX(rect)                 rect.origin.x
#endif

#ifndef CGOriginY
#define CGOriginY(rect)                 rect.origin.y
#endif /* Globaldefine_h */

#define  TagPointScaleWith 320/CCScreenWidth
#define  TagPointScaleHeigth 480/CCScreenHeight

