//
//  PhotoViewController.m
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"

@interface PhotoViewController ()
{
    BOOL isHidden; //状态栏、导航栏的显示隐藏状态
}
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.translucent = YES;
//    self.navigationController.hidesBarsOnSwipe = YES;
    
    self.title = @"图片浏览";
    //设置返回按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(itemAction)];
    self.navigationItem.leftBarButtonItem = item;

    
//创建PhotoCollectionView对象
    PhotoCollectionView *collectionV = [[PhotoCollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    为PhotoCollectionView对象赋值
    collectionV.urls = self.imageUrls;
    [self.view addSubview:collectionV];
    
    //滚动到指定的位置
    [collectionV scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];

    
    //添加通知实现显示和隐藏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:@"tapAction1" object:nil];
    
}

- (void)noti:(NSNotification *)noti{
    /*
    isHidden = !isHidden;
    
    [self.navigationController setNavigationBarHidden:isHidden animated:YES];
    
    //刷新状态栏显示隐藏状态
    [self setNeedsStatusBarAppearanceUpdate];
     */
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (BOOL)prefersStatusBarHidden{
    
    return isHidden;
    
}

- (void)itemAction{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
