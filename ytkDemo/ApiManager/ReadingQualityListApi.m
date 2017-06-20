//
//  ReadingQualityListApi.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "ReadingQualityListApi.h"

@implementation ReadingQualityListApi

- (NSString *)requestUrl {
    return @"/v2/dailies/latest";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (id)requestArgument {
    return @{@"app_key":@"nid5puvc9t0v7hltuy1u",
             @"signature":@"d3ccaf73d28a93289c3cd5b9b41428bf33bc0c5d",
             @"timestamp":@"1481186713"};
}
@end
