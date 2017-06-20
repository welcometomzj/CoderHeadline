//
//  MessageViewController.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageListModel.h"
#import "MessageCell.h"

@interface MessageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSubViews];
    [self initData];
}

- (void)initData
{
    self.dataArray = @[[MessageListModel modelWithTitle:@"订阅消息" icon:@"chat_avatar_subscribe"],
                       [MessageListModel modelWithTitle:@"评论消息" icon:@"chat_avatar_comment"],
                       [MessageListModel modelWithTitle:@"关注消息" icon:@"chat_avatar_follow"],
                       [MessageListModel modelWithTitle:@"系统消息" icon:@"chat_avatar_notice"],
                       [MessageListModel modelWithTitle:@"赞" icon:@"chat_avatar_like"]];
    
    [self.tableView reloadData];
    
}

- (void)initSubViews
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"btn_icon_navi_chat"] forState:UIControlStateNormal];
    [rightBtn setFrame:CGRectMake(0, 0, 25, 19)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"msg";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:0 reuseIdentifier:identifier];
    }
    MessageListModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MessageCell getCellHeight];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
