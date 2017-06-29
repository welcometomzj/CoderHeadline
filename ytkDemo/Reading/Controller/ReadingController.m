//
//  ReadingController.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/8.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "ReadingController.h"
#import "ReadingBannerApi.h"
#import "ReadingQualityListApi.h"
#import "ReadingBannerModel.h"
#import "ReadingQualityListModel.h"
#import "ReadingQualityArticleModel.h"
#import "ReadingLoopBanner.h"
#import "ReadingQualityCell.h"
#import <MJRefresh/MJRefresh.h>

@interface ReadingController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_latestList;
}

@property (nonatomic, strong)ReadingLoopBanner *bannerView;
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ReadingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSubViews];
    
    [self initData];
}

#pragma mark - 获取数据
- (void)initData {
    //轮播图数据
    ReadingBannerApi *bannerApi = [[ReadingBannerApi alloc] init];
    [bannerApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSDictionary *obj = request.responseJSONObject;
        if ([[obj[@"errcode"] stringValue] isEqualToString:@"0"]) {
            NSArray *bannerModels = [ReadingBannerModel mj_objectArrayWithKeyValuesArray:obj[@"data"]];
            self.bannerView.bannerModels = bannerModels;
            
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
    }];
    
    //精选
    ReadingQualityListApi *quality = [[ReadingQualityListApi alloc] init];
    [quality startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSDictionary *obj = request.responseJSONObject;
        if ([[obj[@"errcode"] stringValue] isEqualToString:@"0"]) {
            ReadingQualityListModel *model = [ReadingQualityListModel mj_objectWithKeyValues:obj[@"data"]];
            _latestList = model.article;
            [self.tableView reloadData];
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

- (void)reloadData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [_tableView.mj_header endRefreshing];
        
    });
    
}

#pragma mark - 创建UI
- (void)initSubViews {
    
    //列表
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _latestList.count;
}

//行内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"latest";
    ReadingQualityCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ReadingQualityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row >= _latestList.count) {
        return nil;
    }else{
        ReadingQualityArticleModel *article = [_latestList objectAtIndex:indexPath.row];
        cell.articleModel = article;
        return cell;
    }
}

#pragma mark - UITableViewDelegate

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ReadingQualityCell getCellHeight];
}

//选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -懒加载
- (ReadingLoopBanner *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[ReadingLoopBanner alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth / 2)];
    }
    return _bannerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight - kTabBarHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.bannerView;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData)];
        header.lastUpdatedTimeLabel.hidden = YES;
        _tableView.mj_header = header;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
