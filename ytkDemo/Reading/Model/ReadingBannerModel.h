//
//  ReadingBannerModel.h
//  ytkDemo
//
//  Created by Jack Mo on 16/12/8.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadingBannerModel : NSObject

@property (nonatomic, copy)NSString *ad_id;

@property (nonatomic, copy)NSString *article;

@property (nonatomic, copy)NSString *content_type;

///图片
@property (nonatomic, copy)NSString *image;

///标题
@property (nonatomic, copy)NSString *title;
@end
