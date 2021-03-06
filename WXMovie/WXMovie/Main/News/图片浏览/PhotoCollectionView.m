//
//  PhotoCollectionView.m
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCell.h"

@implementation PhotoCollectionView

- (id)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *flowFlayout = [[UICollectionViewFlowLayout alloc] init];
    //设置item的大小
    flowFlayout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    //设置滚动方向
    flowFlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置单元格之间的间隙
    flowFlayout.minimumLineSpacing = 0;
    
    self = [super initWithFrame:frame collectionViewLayout:flowFlayout];
    if (self) {
        //设置代理对象
        self.delegate = self;
        self.dataSource = self;

        //设置分页效果
        self.pagingEnabled = YES;
        
        //注册单元格
        identify = @"UICollectionViewCell";
        
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:identify];

    }
    return self;
}
#pragma mark - UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.urls.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    
    cell.urlStr = self.urls[indexPath.item];
    
    return cell;
    
}
//不在页面上显示  调用改方法
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCell *cell1 = (PhotoCell *)cell;
    
    [cell1.scrollV setZoomScale:1 animated:YES];
    
    
}

/*
//减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    CGFloat width = scrollView.contentOffset.x;
    NSInteger item = width/scrollView.width;
//    NSLog(@"%ld",item);
    if (_currentItem != item) {
//        NSLog(@",,,,,,,,");
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_currentItem inSection:0];
        PhotoCell *cell = (PhotoCell *)[self cellForItemAtIndexPath:indexPath];
        [cell.scrollV setZoomScale:1 animated:YES];
    }
    self.currentItem = item;
}
*/

@end
