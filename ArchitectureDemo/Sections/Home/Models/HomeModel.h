//
//  HomeModel.h
//  ArchitectureDemo
//
//  Created by 曾经 on 16/3/29.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface HomeModel : NSObject

@end

@interface ImageModel : JSONModel
@property (nonatomic, strong) NSURL <Optional> *large;
@property (nonatomic, strong) NSURL <Optional> *small;
@property (nonatomic, strong) NSURL <Optional> *medium;
@end
@protocol ImageModel <NSObject>
@end

@interface MovieMdoel : JSONModel
@property (nonatomic, strong) NSString <Optional> *rating;
@property (nonatomic, strong) NSString <Optional> *pubdate;
@property (nonatomic, strong) NSString <Optional> *title;
@property (nonatomic, strong) NSString <Optional> *wish;
@property (nonatomic, strong) NSString <Optional> *original_title;
@property (nonatomic, strong) NSString <Optional> *orignal_title;
@property (nonatomic, strong) NSString <Optional> *collection;
@property (nonatomic, strong) NSString <Optional> *stars;
@property (nonatomic, strong) ImageModel <Optional> *images;
@end
@protocol MovieMdoel <NSObject>
@end

@interface HomeModelData : JSONModel
@property (nonatomic, strong) NSString <Optional> *title;
@property (nonatomic, strong) NSString <Optional> *total;
@property (nonatomic, strong) NSMutableArray <Optional, MovieMdoel, ConvertOnDemand> *entries;

@end

/*
 {
 "title": "正在上映的电影",
 "total": 20,
 "entries": [
 {
 "rating": "6.7",
 "pubdate": "2016-03-25",
 "title": "蝙蝠侠大战超人：正义黎明",
 "wish": 14559,
 "original_title": "Batman v Superman: Dawn of Justice",
 "orignal_title": "Batman v Superman: Dawn of Justice",
 "collection": 60295,
 "stars": "35",
 "images": {
 "large": "http://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2316834186.jpg",
 "small": "http://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2316834186.jpg",
 "medium": "http://img3.doubanio.com/view/movie_poster_cover/spst/public/p2316834186.jpg"
 },
 "id": "24750534"
 },
 */