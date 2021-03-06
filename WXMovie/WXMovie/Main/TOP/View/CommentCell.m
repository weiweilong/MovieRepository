//
//  CommentCell.m
//  WXMovie
//
//  Created by imac on 15/9/18.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "CommentCell.h"
#import "CommentModel.h"

@implementation CommentCell

- (void)awakeFromNib {
    _userImageV.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)setModel:(CommentModel *)model{
    _model = model;
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_userImageV setImageWithURL:[NSURL URLWithString:_model.userImage]];
    _nickName.text = _model.nickname;
    _ratingLabel.text = _model.rating;
    _commentLabel.text = _model.content;
    
//    UIFont *font = [UIFont systemFontOfSize:17];
//    
//    CGSize fontSize = CGSizeMake(235, 1000);
//    
//    CGSize frame = [_model.content sizeWithFont:font constrainedToSize:fontSize];
    
    _commentLabel.height = self.height - 56;
    
    _bgImageView.height = self.height - 10;
}
@end
