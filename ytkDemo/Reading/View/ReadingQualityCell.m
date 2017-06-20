//
//  ReadingQualityCell.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "ReadingQualityCell.h"
#import "ReadingQualityArticleModel.h"
#import "ReadingUserModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIButton+ImageTitleSpacing.h"

static const CGFloat cellHeight = 100;

@interface ReadingQualityCell ()
@property (nonatomic, weak)UILabel *titleLabel;
@property (nonatomic, weak)UIImageView *imgView;
@property (nonatomic, weak)UILabel *author;
@property (nonatomic, weak)UIButton *likeBtn;
@property (nonatomic, weak)UIButton *commentBtn;
@end

@implementation ReadingQualityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 12, kScreenWidth - 64, 0)];
    [self.contentView addSubview:titleLabel];
    titleLabel.textColor = [UIColor colorForHex:@"333333"];
    titleLabel.font = kFont(17);
    titleLabel.numberOfLines = 2;
    self.titleLabel = titleLabel;
    
    CGFloat imgWidth = 40;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 10 - imgWidth, 20, imgWidth, imgWidth)];
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
    
    CGFloat authorLabelWidth = kScreenWidth / 2;
    UILabel *authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 10 - authorLabelWidth, CGRectGetMaxY(imgView.frame) + 10, authorLabelWidth, 16)];
    authorLabel.textAlignment = NSTextAlignmentRight;
    authorLabel.font = kFont(13);
    authorLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:authorLabel];
    self.author = authorLabel;
    
    CGFloat btnWidth = 36;
    CGFloat btnHeight = 20;
    UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [likeBtn setFrame:CGRectMake(18, cellHeight - 10 - btnHeight, btnWidth, btnHeight)];
    [likeBtn setImage:[UIImage imageNamed:@"btn_cell_like"] forState:UIControlStateNormal];
    [likeBtn setTitle:@"0" forState:UIControlStateNormal];
    [likeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    likeBtn.titleLabel.font = kFont(12);
    [likeBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:2];
    [self.viewForLastBaselineLayout addSubview:likeBtn];
    self.likeBtn = likeBtn;
    
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [commentBtn setFrame:CGRectMake(CGRectGetMaxX(likeBtn.frame) + 5, cellHeight - 10 - btnHeight, btnWidth, btnHeight)];
    [commentBtn setImage:[UIImage imageNamed:@"btn_cell_comment_gray"] forState:UIControlStateNormal];
    [commentBtn setTitle:@"0" forState:UIControlStateNormal];
    [commentBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    commentBtn.titleLabel.font = kFont(12);
    [commentBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:2];
    [self.viewForLastBaselineLayout addSubview:commentBtn];
    self.commentBtn = commentBtn;
}

+ (CGFloat)getCellHeight {
    return cellHeight;
}

- (void)setArticleModel:(ReadingQualityArticleModel *)articleModel {
    _articleModel = articleModel;

    self.titleLabel.text = articleModel.title;
    NSDictionary *attrs = @{NSFontAttributeName : self.titleLabel.font};
    CGSize maxSize = CGSizeMake(self.titleLabel.width, MAXFLOAT);
    CGSize size = [articleModel.title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    self.titleLabel.height = size.height;
    
    ReadingUserModel *usrModel = articleModel.user;
    NSDictionary *subjectDict = articleModel.subject;
    if ([subjectDict[@"image"] isKindOfClass:[NSString class]]) {
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:subjectDict[@"image"]]];
    }else{
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:usrModel.avatar]];
    }
    self.author.text = subjectDict[@"name"];

    [self.likeBtn setTitle:articleModel.like_count forState:UIControlStateNormal];
    
    [self.commentBtn setTitle:articleModel.comment_count forState:UIControlStateNormal];
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
