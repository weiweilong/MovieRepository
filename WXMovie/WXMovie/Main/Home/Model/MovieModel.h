//
//  MovieModel.h
//  WXMovie
//
//  Created by imac on 15/9/8.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject
/*{
 box = 27361000;
 new = 1;
 rank = 1;
 subject =             {
 alt = "http://movie.douban.com/subject/3170961/";
 "collect_count" = 49;
 id = 3170961;
 images ={       };
 "original_title" = "2 Guns";
 rating ={   };
 subtype = movie;
 title = "\U53cc\U67aa";
 year = 2013;
 };
 },
*/

@property(nonatomic,copy)NSString *title;  //标题
@property(nonatomic,retain)NSNumber *average; //评分
@property(nonatomic,copy)NSString *year;//上映年份
@property(nonatomic,retain)NSDictionary *images;//图片
@property(nonatomic,copy)NSString *original_title; //英文名称
@property(nonatomic,retain)NSNumber *collect_count;//收藏数
@property(nonatomic,copy)NSString *subtype;//类型
@property(nonatomic,copy)NSString *movieID; //电影ID

@end
