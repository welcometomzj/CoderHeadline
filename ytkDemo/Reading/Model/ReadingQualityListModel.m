//
//  ReadingQualityListModel.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "ReadingQualityListModel.h"
#import "ReadingQualityArticleModel.h"

@implementation ReadingQualityListModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"article":[ReadingQualityArticleModel class]};
}
@end
