//
//  HttpComm.m
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/29.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "HttpComm.h"
#import <CommonCrypto/CommonDigest.h>
#import "UIDevice+Hardware.h"
#define once_tutu_com_authkey @"3df6a123c9671a43986448d4ef7ed0f7" //md5 32
#define once_tutu_com_secertkey @"7b077ffd32d41d1fd3c1c7c2c49b42f8" //

@implementation HttpComm
#pragma mark- 加密提交的参数
+(NSMutableDictionary *)sortParametersOnerequest:(NSMutableDictionary *)paramaters{
//    [paramaters setObject:[UIDevice currentDevice].UUID forKey:@"did"];
//    [paramaters setObject:TTProjectVersionNumber forKey:@"appversion"];
    [paramaters setObject:TTProjectBundleID forKey:@"appbid"];
    [paramaters setObject:[UIDevice currentDevice].timestamp forKey:@"timestamp"];
//    if ([User sharedUser].phpSessID) {
//        [paramaters setObject:[User sharedUser].phpSessID forKey:@"token"];
//    }
    
    NSArray *keys = [paramaters allKeys];
    //按照key排序
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [(NSString *)obj1 compare:(NSString *)obj2];
    }];
    
    //按照key顺序，拼接值
    NSMutableString *sortHashString = [NSMutableString new];
    
    NSInteger totalCount = keys.count;
    for (int i = 0; i < totalCount; i++) {
        NSString *key = [keys objectAtIndex:i];
        [sortHashString appendFormat:@"%@",[paramaters objectForKey:key]];
    }
    //    [paramaters setObject:sortHashString forKey:@"psign"];
//    NSString *sign = [self once_sign:sortHashString];
//    [paramaters setObject:sign forKey:@"sign"];
    
//    [paramaters removeObjectForKey:@"PHPSESSID"];
    
    return  paramaters;

}
+ (NSString *)once_sign:(NSString *)str{
    
    NSString *once_key=once_tutu_com_authkey;
    NSString *newPass=[NSString stringWithFormat:@"%@_%@_%@",once_key,str,once_key];
    
    return  [self md5:newPass];
}

+ (NSString *)once_password:(NSString *)str{
    
    if (str) {
        str = [str stringByTrimmingCharactersInSet:
               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSString *once_key=once_tutu_com_secertkey;
        NSString *newPass=[NSString stringWithFormat:@"%@*/%@&*%@",once_key,str,once_key];
        return  [self md5:newPass];
    }
    
    return nil;
    
}


+ (NSString *) md5:(NSMutableString *)str
{
    if (str==nil) {
        return nil;
    }
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString *) md52:(char *)cStr
{
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
