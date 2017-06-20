//
//  ReadingQualityCell.h
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ReadingQualityArticleModel;

@interface ReadingQualityCell : UITableViewCell

@property (nonatomic, strong)ReadingQualityArticleModel *articleModel;

+ (CGFloat)getCellHeight;
@end
