//
//  MessageCell.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/13.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "MessageCell.h"
#define CellHeight 64

@interface MessageCell ()
@property (nonatomic, weak)UIImageView *imgView;
@property (nonatomic, weak)UILabel *titleLabel;
@end

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    CGFloat imgHeight = 50;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (CellHeight - imgHeight) / 2, imgHeight, imgHeight)];
    imgView.layer.cornerRadius = imgHeight / 2;
    imgView.clipsToBounds = YES;
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
    
    CGFloat titleWidth = kScreenWidth / 2;
    CGFloat titleHeight = 20;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgView.frame)+10, (CellHeight - titleHeight) / 2, titleWidth, titleHeight)];
    titleLabel.textColor = [UIColor colorForHex:@"000000"];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    CGFloat indicatorWidth = 15;
    UIImageView *indicator = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 16 - indicatorWidth, (CellHeight - indicatorWidth) / 2, indicatorWidth, indicatorWidth)];
    indicator.image = [UIImage imageNamed:@"forwardbutton"];
    [self.contentView addSubview:indicator];
}

+ (CGFloat)getCellHeight
{
    return CellHeight;
}

- (void)setModel:(MessageListModel *)model
{
    _model = model;
    self.imgView.image = [UIImage imageNamed:model.icon];
    
    self.titleLabel.text = model.title;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
