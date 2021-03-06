//
//  StarView.m
//  WXMovie
//
//  Created by imac on 15/9/8.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "StarView.h"

@implementation StarView
//在xib文件中加载时调用，相当于已代码形式创建的init
-(void)awakeFromNib{
    
    [self _creatSubViews];
}
//初始化
- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _creatSubViews];
    }
    return self;
}

- (void)_creatSubViews{
    
    UIImage *grayImage = [UIImage imageNamed:@"gray"];
    grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayImage.size.width * 5, grayImage.size.height)];
    grayView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    [self addSubview:grayView];
    
    UIImage *yellowImage = [UIImage imageNamed:@"yellow"];
    yellowView = [[UIView alloc] initWithFrame:CGRectMake(0 , 0, grayImage.size.width * 5, grayImage.size.height)];
    yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    [self addSubview:yellowView];
    
    //   100  100
    //   20   20
    
    //放大的倍数
    CGFloat abc = self.frame.size.height / grayImage.size.height;
    //根据放大的倍数进行放大
    grayView.transform = CGAffineTransformMakeScale(abc, abc);
    yellowView.transform = CGAffineTransformMakeScale(abc, abc);
    
    //不能用以下的方式修改视图的宽度
    //        grayView.frame.size.width = 100;
    
    //获取要修改的视图的frame
    CGRect frame2 = grayView.frame;
    //        将得到的frame进行修改
    frame2.origin = CGPointMake(0, 0);
    //        将修改后的frame付给要修改的视图
    grayView.frame = frame2;
    
    CGRect frame1 = yellowView.frame;
    frame1.origin = CGPointMake(0, 0);
    yellowView.frame = frame1;
    
    
    //        //3.设置当前视图的宽度为5个星星的宽度
    CGFloat star5Width = self.frame.size.width * 5;
    CGRect frame = self.frame;
    frame.size.width = star5Width;
    self.frame = frame;
}

- (void)setRating:(float)rating{
    _rating = rating;
    
    CGRect frame1 = yellowView.frame;
    frame1.size.width = _rating / 10.0 *grayView.frame.size.width;
    yellowView.frame = frame1;
    
    
}

@end
