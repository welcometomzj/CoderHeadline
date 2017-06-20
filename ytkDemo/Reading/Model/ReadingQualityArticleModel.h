//
//  ReadingQualityArticleModel.h
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReadingUserModel.h"

@interface ReadingQualityArticleModel : NSObject

///标题
@property (nonatomic, copy)NSString *title;

@property (nonatomic, strong)ReadingUserModel *user;

@property (nonatomic, strong)NSDictionary *subject;

///评论数量
@property (nonatomic, copy)NSString *comment_count;

///点赞数量
@property (nonatomic, copy)NSString *like_count;
//
//@property (nonatomic, copy)NSString *;
@end
