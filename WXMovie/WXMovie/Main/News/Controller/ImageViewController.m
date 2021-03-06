//
//  ImageViewController.m
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "ImageViewController.h"
#import "ImageModel.h"
#import "PhotoViewController.h"
#import "BaseNavigationController.h"

@interface ImageViewController ()
{
    NSMutableArray *_data; //图片要显示的全部数据
}
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //加载数据
    [self requestData];
    
    
    
    
}
- (void)requestData{
    
    NSArray *jsonArr =[WXDataService requestData:image_list];
    
    _data = [NSMutableArray arrayWithCapacity:jsonArr.count];
    
    for (NSDictionary *dic in jsonArr) {
        
        ImageModel *model = [[ImageModel alloc] initContentWithDic:dic];
        
//        model.imageID = dic[@"id"];
//        model.image = dic[@"image"];
//        model.type = dic[@"type"];
        
        [_data addObject:model];
    }
    [_collectionV reloadData];
    
}


#pragma mark - UICollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    UIImageView *imageV = (UIImageView *)[cell.contentView viewWithTag:100];
    
    ImageModel *model = _data[indexPath.item];
    
    NSString *urlStr = model.image;
    NSURL *url = [NSURL URLWithString:urlStr];
    
    [imageV setImageWithURL:url];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //[url1],[url1],[url1],[url1],[url1],
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:_data.count];
    //URL的获取
    for (ImageModel *model in _data) {
        NSString *urlStr = model.image;
        [images addObject:urlStr];
    }
    
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    //设置要显示的数据
    photoVC.imageUrls =images;
    
    photoVC.indexPath = indexPath;
    
//    BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:photoVC];
    
    [self presentViewController:photoVC animated:YES completion:^{
//        self.tabBarItem.selectedImage
    }];
    
}


@end
