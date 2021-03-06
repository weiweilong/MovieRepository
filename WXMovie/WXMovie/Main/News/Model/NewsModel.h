//
//  NewsModel.h
//  WXMovie
//
//  Created by imac on 15/9/9.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
/*
 {
 "id" : 1491520,
 "type" : 0,
 "title" : "科幻大作《全面回忆》全新预告片发布",
 "summary" : "",
 "image" : "http://img31.mtime.cn/mg/2012/06/28/100820.21812355.jpg"
 }
 */


@property(nonatomic,copy)NSString *newsID;  //新闻ID
@property(nonatomic,retain)NSNumber *type;   //新闻类型
@property(nonatomic,copy)NSString *title;  //标题
@property(nonatomic,copy)NSString *summary;  //新闻简介
@property(nonatomic,copy)NSString *image; // 图片


@end
