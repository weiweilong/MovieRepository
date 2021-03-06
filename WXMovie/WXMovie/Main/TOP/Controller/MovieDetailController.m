//
//  MovieDetailController.m
//  WXMovie
//
//  Created by imac on 15/9/18.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "MovieDetailController.h"
#import "MovieDetailModel.h"
#import "MovieHeaderView.h"
#import "CommentModel.h"
#import "CommentCell.h"

@interface MovieDetailController ()
{
    NSMutableArray *_data;
}
@end

@implementation MovieDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableV.delegate = self;
    _tableV.dataSource =self;
    _tableV.rowHeight = 100;
    _tableV.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableV];
    
    //头视图数据加载
    [self _loadHeaderData];
    
    [self _loadCommentData];
    
}
- (void)_loadHeaderData{
    
    NSDictionary *dic = [WXDataService requestData:movie_detail];
    
    MovieDetailModel *model = [[MovieDetailModel alloc] initContentWithDic:dic];
    
    MovieHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"MovieHeaderView" owner:self options:nil] lastObject];
    headerView.movieDetail = model;
    _tableV.tableHeaderView = headerView;
    
}

- (void)_loadCommentData{
    NSDictionary *dic =[WXDataService requestData:movie_comment];
    NSArray *arr = [dic objectForKey:@"list"];
    
    _data = [NSMutableArray arrayWithCapacity:arr.count];
    
    for (NSDictionary *dic1 in arr) {
        CommentModel *model = [[CommentModel alloc] initContentWithDic:dic1];
        
        [_data addObject:model];
        
    }
    
    [_tableV reloadData];
    
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:self options:nil] lastObject];
    }
    
    cell.model = _data[indexPath.row];
    
    return cell;
}
//设置单元格的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.currentIndex) {

        CommentModel *model = _data[indexPath.row];
        NSString *content = model.content;
        
        UIFont *font = [UIFont systemFontOfSize:17];
        
        CGSize fontSize = CGSizeMake(235, 1000);
        
//        CGSize frame = [content sizeWithFont:font constrainedToSize:fontSize];
        
        
        
        
        CGRect frame = [content boundingRectWithSize:fontSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
        
        return frame.size.height + 60;
    }
    return 100;
    
}
//单元格被点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.currentIndex = indexPath.row;
//    tableView刷新
    //[_tableV reloadData];
    
//    [_tableV reloadSections:<#(NSIndexSet *)#> withRowAnimation:<#(UITableViewRowAnimation)#>]
    
    [_tableV reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

@end
