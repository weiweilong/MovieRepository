//
//  MoreViewController.m
//  WXMovie
//
//  Created by imac on 15/9/18.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "MoreViewController.h"
#import "SDImageCache.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    NSLog(@"%@",NSHomeDirectory());
    
}




- (double)jisuan{
    
    long sum = 0;
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/ImageCache"];
    //文件管理  单例类
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取每一个子文件
    NSArray *fileArray = [fileManager subpathsAtPath:path];
    for (NSString *file in fileArray) {
        NSString *filePath = [path stringByAppendingPathComponent:file];
        //获取子文件的属性
        NSDictionary *dic = [fileManager attributesOfItemAtPath:filePath error:nil];
        //获取子文件的大小
        NSNumber *sizeItem = [dic objectForKey:NSFileSize];
        
        long sizeitem = [sizeItem longValue];
        //计算总大小
        sum += sizeitem;
        
    }
    //转换单位为M
    double size = sum / 1000 / 1000.0;
    
    return size;
}

#pragma mark - Table view data source
//cell将要显示的时候调用
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:100];
    //计算缓存大小
    double size = [self jisuan];
    
    label.text = [NSString stringWithFormat:@"%.1fM",size];
    
}
//点击单元格方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        //创建UIAlertView提示用户是否删除
        UIAlertView *alerV = [[UIAlertView alloc] initWithTitle:@"清除缓存" message:@"是否是要清楚缓存" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alerV show];
        
    }
    
    
}
#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        //利用第三方清除缓存
        [[SDImageCache sharedImageCache] clearDisk];
        
        [self.tableView reloadData];
        
    }
    
    
}




@end
