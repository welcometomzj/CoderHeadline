//
//  MessageCell.h
//  ytkDemo
//
//  Created by Jack Mo on 16/12/13.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageListModel.h"

@interface MessageCell : UITableViewCell

@property (nonatomic, strong)MessageListModel *model;
+ (CGFloat)getCellHeight;
@end
