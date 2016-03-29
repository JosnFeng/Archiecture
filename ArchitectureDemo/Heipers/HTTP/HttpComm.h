//
//  HttpComm.h
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/29.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpComm : NSObject
@property (nonatomic,strong) NSDictionary *commPamars;
@property (nonatomic,strong) NSDictionary *commHead;

+(NSMutableDictionary *)sortParametersOnerequest:(NSMutableDictionary *)paramaters;
+ (NSString *)once_password:(NSString *)str;
+ (NSString *) md5:(NSString *)str;
@end
