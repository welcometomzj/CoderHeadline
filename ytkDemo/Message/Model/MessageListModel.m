//
//  MessageListModel.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/13.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "MessageListModel.h"

@implementation MessageListModel

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon
{
    self = [super init];
    if (self) {
        self.icon = icon;
        self.title = title;
    }
    return self;
}

+ (instancetype)modelWithTitle:(NSString *)title icon:(NSString *)icon
{
    return [[self alloc] initWithTitle:title icon:icon];
}
@end
