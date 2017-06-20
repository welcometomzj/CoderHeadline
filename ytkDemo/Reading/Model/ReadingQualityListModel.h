//
//  ReadingQualityListModel.h
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadingQualityListModel : NSObject

///当天日期
@property (nonatomic, copy)NSString *date;

///当天日期前一天
@property (nonatomic, copy)NSString *pre_date;

///当天日期后一天
@property (nonatomic, copy)NSString *next_date;

///是否今天
@property (nonatomic, copy)NSString *is_today;

///分享的网址
@property (nonatomic, copy)NSString *share_url;

///文章列表
@property (nonatomic, strong)NSArray *article;

@end
