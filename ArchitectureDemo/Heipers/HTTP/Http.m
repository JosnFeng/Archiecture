//
//  Http.m
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/29.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "Http.h"
#import "AFNetworking.h"
#import "HttpComm.h"
@implementation Http
+ (void)HTTP_GET:(NSString *)method
          params:(NSDictionary *)params
        callback:(void (^)(NSDictionary *result,NSError *error))block{
    
    if (!method) {
        block(nil,nil);
    }
    
//    [self setCookie];
//    NSMutableDictionary *pmars=[[NSMutableDictionary alloc] initWithDictionary:params];
//    NSDictionary *http_params = [HttpComm sortParametersOnerequest:pmars];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval =20;
    NSLog(@"%@", API_URL(method));
    [manager GET:method
      parameters:params
         success:^ void(NSURLSessionDataTask * task, id responseObject) {
             //        NSLog(@"请求成功 %@", [responseObject class]);
//             [self saveCookie:method];
             
//             if (![self loginIsTimeOut:responseObject]) {
//                 
                 block(responseObject,nil);
//
//                 [[UrlResponseCache shareUrlCache] cacheResponseByurl:task.originalRequest.URL response:[responseObject JSONString]];
//             }
             
             
         } failure:^ void(NSURLSessionDataTask * operation, NSError * error) {
             
             block(nil,error);
             
         }];
}

+ (void)HTTP_POST:(NSString *)method
           params:(NSDictionary *)params
         callback:(void (^)(NSDictionary *result,NSError *error))block{
    
    if (!method) {
        block(nil,nil);
    }
    [self setCookie];
    
    
    NSMutableDictionary *pmars=[[NSMutableDictionary alloc] initWithDictionary:params];
    NSDictionary *http_params = [HttpComm sortParametersOnerequest:pmars];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval =60;
    [manager POST:API_URL(method)
       parameters:http_params
          success:^ void(NSURLSessionDataTask * task, id responseObject) {
              [self saveCookie:method];
//              if (![self loginIsTimeOut:responseObject]) {
//                  block(responseObject,nil);
//              }
              
          } failure:^ void(NSURLSessionDataTask * operation, NSError * error) {
              block(nil,error);
          }];
}
+ (void)http_P0ST:(NSString *)method
           params:(NSDictionary *)params
        imageFile:(UIImage *)image
         callback:(void (^)(NSDictionary *result,NSError *error))block{
    
    if (!method) {
        block(nil,nil);
    }
    [self setCookie];
    
    NSMutableDictionary *pmars=[[NSMutableDictionary alloc] initWithDictionary:params];
    NSDictionary *http_params = [HttpComm sortParametersOnerequest:pmars];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval =60;
    [manager POST:API_URL(method)
       parameters:http_params
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    
    NSData *data=UIImageJPEGRepresentation(image, 0.5);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // 设置时间格式
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
    [formData appendPartWithFileData:data name:@"image" fileName:fileName mimeType:@"image/png"];
    
    
} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
    [self saveCookie:method];
//    if (![self loginIsTimeOut:responseObject]) {
//        block(responseObject,nil);
//    }
    
} failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
    block(nil,error);
}];
    
}

+ (void)HTTP_P0ST:(NSString *)method
           params:(NSDictionary *)params
        fileArray:(NSArray *)file
         callback:(void (^)(NSDictionary *result,NSError *error))block{
    
    if (!method) {
        block(nil,nil);
    }
    [self setCookie];
    
    NSMutableDictionary *pmars=[[NSMutableDictionary alloc] initWithDictionary:params];
    NSDictionary *http_params =[HttpComm sortParametersOnerequest:pmars];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval =60;
    
    [manager POST:API_URL(method)
       parameters:http_params
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    
    for (NSDictionary *dict in file) {
        
        NSData *data=UIImageJPEGRepresentation([dict valueForKey:@"img"], 0.5);
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        // 设置时间格式
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
        [formData appendPartWithFileData:data name:[dict valueForKey:@"name"] fileName:fileName mimeType:@"image/png"];
    }
    
    
    
} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
    [self saveCookie:method];
//    if (![self loginIsTimeOut:responseObject]) {
//        block(responseObject,nil);
//    }
} failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
    block(nil,error);
}];
    
}
#pragma mark- 判断用户是否登录超时
//+ (BOOL)loginIsTimeOut:(id)respose{
//    
//    //    return NO;
//    if ([respose  isKindOfClass:[NSDictionary class]]) {
//        if ([[respose valueForKey:@"status"] integerValue]==2) {
//            
//            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
////                if ([User sharedUser].userID.length) {
////                    
////                    LoginViewController *logVC = [[LoginViewController alloc] init];
////                    UINavigationController *tabar= (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
////                    if ([tabar respondsToSelector:@selector(pushViewController:animated:)]) {
////                        [tabar pushViewController:logVC animated:YES];
////                    }
////                    [[User sharedUser] cleanUserInfo];
//                }
//                
//            });
//            return YES;
//        }
//    }
//    return NO;
//}
+ (void)saveCookie:(NSString *)method{
    
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:API_URL(method)]];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserDefaultsCookie];
    //    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setCookie{
    
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
    if([cookiesdata length]) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }
}

+ (void)clearCookie{
    
    NSURL *url = [NSURL URLWithString:@"http://api.momentshere.com"];
    if (url) {
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
        for (int i = 0; i < [cookies count]; i++) {
            
            NSHTTPCookie *cookie = (NSHTTPCookie *)[cookies objectAtIndex:i];
            
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
            
        }
    }
    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:[NSURLRequest requestWithURL:url]];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kUserDefaultsCookie];
}

@end
