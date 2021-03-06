//
//  MovieDetailModel.h
//  WXMovie
//
//  Created by imac on 15/9/18.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "BaseModel.h"

@interface MovieDetailModel : BaseModel

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *titleCn;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, retain) NSArray *type;
@property (nonatomic, retain) NSArray *directors;
@property (nonatomic, retain) NSArray *actors;
@property (nonatomic, retain) NSDictionary *releaseLocation;
@property (nonatomic, retain) NSArray *images;
@property (nonatomic, retain) NSArray *videos;



@end
