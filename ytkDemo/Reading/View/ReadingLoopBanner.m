//
//  ReadingLoopBanner.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/8.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "ReadingLoopBanner.h"
#import "ReadingLoopBannerCell.h"

@interface ReadingLoopBanner ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak)UICollectionView *loopBanner;
@property (nonatomic, weak)UIPageControl *pageControl;
@end

@implementation ReadingLoopBanner

static NSString *identifier = @"bannerCell";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = self.bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    UICollectionView *loopBanner = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    loopBanner.delegate = self;
    loopBanner.dataSource = self;
    loopBanner.bounces = NO;
    loopBanner.pagingEnabled = YES;
    loopBanner.showsHorizontalScrollIndicator = NO;
    loopBanner.backgroundColor = kWhiteColor;
    [loopBanner registerClass:[ReadingLoopBannerCell class] forCellWithReuseIdentifier:identifier];
    [self addSubview:loopBanner];
    self.loopBanner = loopBanner;
    
    CGFloat pageControlWidth = 100;
    CGFloat pageControlHeight = 15;
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake((kScreenWidth - pageControlWidth) / 2, CGRectGetMaxY(self.bounds) - pageControlHeight, pageControlWidth, pageControlHeight);
    pageControl.currentPageIndicatorTintColor = kMainColor;
    pageControl.pageIndicatorTintColor = [UIColor colorForHex:@"f0f0f0"];
    [self addSubview:pageControl];
    self.pageControl = pageControl;
}

#pragma mark - UICollectionViewDataSource

//个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.bannerModels.count;
}

//cell
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ReadingLoopBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.model = _bannerModels[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    self.pageControl.currentPage = indexPath.row;
}

#pragma mark -setter

- (void)setBannerModels:(NSArray *)bannerModels {
    _bannerModels = bannerModels;
    _pageControl.numberOfPages = bannerModels.count;
    [self.loopBanner reloadData];
}

@end
