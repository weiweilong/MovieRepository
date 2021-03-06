//
//  PosterViewCell.m
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "PosterViewCell.h"
#import "MovieModel.h"
#import "MovieDetailView.h"

@implementation PosterViewCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建子视图
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.width - 10, self.height- 10)];
        [self.contentView addSubview:_imageV];
        NSLog(@"%@",_imageV);
        
        _detailView = [[[NSBundle mainBundle] loadNibNamed:@"MovieDetailView" owner:self options:nil] lastObject];
        _detailView.hidden = YES;
        _detailView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_bg_all-64@2x"]];
        [self.contentView insertSubview:_detailView belowSubview:_imageV];
        
    }
    return self;
}

- (void)setModel:(MovieModel *)model{
    _model = model;
    
    NSDictionary *dic = _model.images;
    NSString *imageStr = [dic objectForKey:@"large"];
    NSURL *url = [NSURL URLWithString:imageStr];
    
    [_imageV setImageWithURL:url];
    
    _detailView.model = _model;
}
- (void)flips{
    
    //查找两个视图的索引
//    NSInteger first = [self.contentView.subviews indexOfObject:_imageV];
//    NSInteger second = [self.contentView.subviews indexOfObject:_detailView];
    
    UIViewAnimationOptions left = _imageV.hidden ? UIViewAnimationOptionTransitionFlipFromLeft :
    UIViewAnimationOptionTransitionFlipFromRight;
    
    //进行翻转
    [UIView transitionWithView:self.contentView duration:0.3 options:left animations:^{
        _detailView.hidden = !_detailView.hidden;
        _imageV.hidden = !_imageV.hidden;
//        [self.contentView exchangeSubviewAtIndex:first withSubviewAtIndex:second];
    } completion:^(BOOL finished) {
        
    }];
}
- (void)reset{
    
    if (_imageV.hidden == YES) {
//        [self.contentView bringSubviewToFront:_imageV];
        _detailView.hidden = !_detailView.hidden;
        _imageV.hidden = !_imageV.hidden;
    }

}
@end
