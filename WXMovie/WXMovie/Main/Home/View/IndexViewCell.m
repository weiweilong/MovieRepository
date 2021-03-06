//
//  IndexViewCell.m
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "IndexViewCell.h"
#import "MovieModel.h"

@implementation IndexViewCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建子视图
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.width - 10, self.height- 10)];
        [self.contentView addSubview:_imageV];
        
    }
    return self;
}

- (void)setModel:(MovieModel *)model{
    _model = model;
    
    NSDictionary *dic = _model.images;
    NSString *imageStr = [dic objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:imageStr];
    
    [_imageV setImageWithURL:url];
    
    
}
@end
