//
//  HomeModel.m
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/29.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end

@implementation ImageModel
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end

@implementation MovieMdoel
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end

@implementation HomeModelData
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end
