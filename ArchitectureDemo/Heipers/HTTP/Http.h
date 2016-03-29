//
//  Http.h
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/29.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define API_BASE_URL @"http://api.momentshere.com/v1/"



#define API_KEY @""
#define API_SECET @""
#define API_URL(mothed) [NSString stringWithFormat:@"%@%@",API_BASE_URL,mothed]

@interface Http : NSObject
+ (void)HTTP_GET:(NSString *)method
          params:(NSDictionary *)params
        callback:(void (^)(NSDictionary *result,NSError *error))block;

+ (void)HTTP_POST:(NSString *)method
           params:(NSDictionary *)params
         callback:(void (^)(NSDictionary *result,NSError *error))block;

+ (void)http_P0ST:(NSString *)method
           params:(NSDictionary *)params
        imageFile:(UIImage *)image
         callback:(void (^)(NSDictionary *result,NSError *error))block;

+ (void)HTTP_P0ST:(NSString *)method
           params:(NSDictionary *)params
        fileArray:(NSArray *)file
         callback:(void (^)(NSDictionary *result,NSError *error))block;

+ (void)clearCookie;

@end
