//
//  ReadingBannerApi.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/8.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "ReadingBannerApi.h"

@implementation ReadingBannerApi

- (NSString *)requestUrl {
    return @"/v2/banner";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (id)requestArgument {
    return @{@"app_key":@"nid5puvc9t0v7hltuy1u",
             @"signature":@"d2ae2b7de7ad023d156dcd5c7e2787c7f43373fc",
             @"timestamp":@"1481185589"};
}

@end
