//
//  MessageListModel.h
//  ytkDemo
//
//  Created by Jack Mo on 16/12/13.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageListModel : NSObject
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *title;

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)modelWithTitle:(NSString *)title icon:(NSString *)icon;
@end
