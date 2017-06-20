//
//  ReadingLoopBannerCell.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/8.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "ReadingLoopBannerCell.h"
#import "ReadingBannerModel.h"
#import <UIImageView+WebCache.h>

@interface ReadingLoopBannerCell ()
@property (nonatomic, weak)UIImageView *imageVIew;
@property (nonatomic, weak)UILabel *titleLabel;
@end

@implementation ReadingLoopBannerCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        {
            [self initSubView];
        }
    }
    return self;
}


- (void)initSubView {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.clipsToBounds = YES;
    [self.contentView addSubview:imgView];
    self.imageVIew = imgView;
    
    CGFloat darkViewHeight = CGRectGetHeight(self.bounds) / 4;
    UIView *darkView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - darkViewHeight, CGRectGetWidth(self.bounds), darkViewHeight)];
    darkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    [self addSubview:darkView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, kScreenWidth - 24, darkViewHeight)];
    titleLabel.font = kBoldFont(14);
    titleLabel.textColor = kWhiteColor;
    titleLabel.numberOfLines = 0;
    [darkView addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)setModel:(ReadingBannerModel *)model {
    _model = model;
    NSURL *url = [[NSURL alloc] initWithString:model.image];
    [self.imageVIew sd_setImageWithURL:url];
    
    self.titleLabel.text = model.title;
}
@end
