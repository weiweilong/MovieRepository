//
//  PosterView.h
//  WXMovie
//
//  Created by imac on 15/9/14.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
@class PosterCollectionView;
@class IndexCollectionView;

@interface PosterView : UIView
{
    UIView *_headerView; //头部视图
    PosterCollectionView *_posterCollectionV; // 海报视图
    UILabel *_label;  //标题
    
    
    IndexCollectionView *_indexCollectionV;  //头视图上索引视图

}

@property(nonatomic,retain)NSArray *data; //数据

@end
