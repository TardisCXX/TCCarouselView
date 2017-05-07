//
//  TCCarouselView.m
//  TCCarouselViewProject
//
//  Created by TARDIS on 2017-4-27.
//  Copyright © 2017年 tardis_cxx. All rights reserved.
//

#import "TCCarouselView.h"
#import "TCShowContentCell.h"

static NSString *const kTCShowContentCellIndentifier = @"TCShowContentCell";

@interface TCCarouselView () <UICollectionViewDelegate, UICollectionViewDataSource>

/// 滚动视图
@property (nonatomic, strong) UICollectionView *collectionView;
/// 布局
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
/// 时钟
@property (nonatomic, strong) NSTimer *timer;
/// 当前索引
@property (nonatomic, assign) NSInteger currentIndex;

/// itemCount
@property (nonatomic, assign) NSInteger totalItemCount;

/// 图片路径数组
@property (nonatomic, strong) NSArray<NSString *> *imagePaths;

@end

@implementation TCCarouselView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.flowLayout.itemSize = self.frame.size;
    self.collectionView.frame = self.bounds;
    if (self.collectionView.contentOffset.x == 0 && self.totalItemCount) {
        NSInteger targetIndex = 0;
        targetIndex = self.totalItemCount * 0.5;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
    
    [self startTimer];    
}

#pragma mark - UI

- (void)setupUI {
    [self addSubview:self.collectionView];
    
    [self.collectionView registerClass:[TCShowContentCell class] forCellWithReuseIdentifier:kTCShowContentCellIndentifier];
}

#pragma mark - networking method


#pragma mark - timer

- (void)startTimer {
    if (self.timer != nil) {
        return;
    }
    
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)updateTimer {
    NSLog(@"------------");
    
    if (self.totalItemCount == 0) {
        return;
    }
    
    NSInteger currentIndex = self.collectionView.bounds.size.width == 0 ? 0 : MAX(0, (self.collectionView.contentOffset.x + self.flowLayout.itemSize.width * 0.5) / self.flowLayout.itemSize.width);
    NSInteger targetIndex = currentIndex + 1;
    if (targetIndex >= self.totalItemCount) {
        targetIndex = self.totalItemCount * 0.5;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        return;
    }
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
   
}


#pragma mark - action



#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.totalItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TCShowContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTCShowContentCellIndentifier forIndexPath:indexPath];
    NSInteger index = [self getCurrentIndex:indexPath];
    cell.imageUrl = self.imagePaths[index];
    
    NSLog(@"index:%zd item:%zd", index,indexPath.item);
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger offset = self.collectionView.contentOffset.x / self.collectionView.bounds.size.width;
    self.currentIndex = offset + 1;
    
    NSLog(@"offset:%zd-----要显示图片索引:%zd", offset, self.currentIndex);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView setContentOffset:CGPointMake(scrollView.bounds.size.width, 0) animated:YES];
    });
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath:%@", @(indexPath.item));
    
    if ([self.delegate respondsToSelector:@selector(carouselView:didSelectedIndex:)]) {
        [self.delegate carouselView:self didSelectedIndex:[self getCurrentIndex:indexPath]];
    }
    
}

#pragma mark - private

- (NSInteger)getCurrentIndex:(NSIndexPath *)indexPath {
    return indexPath.item % self.imagePaths.count;
}


#pragma mark - setter

- (void)setImages:(NSArray<NSString *> *)images {
    _images = images;
    self.imagePaths = images;
    self.totalItemCount = self.imagePaths.count * 100;
    if (self.imagePaths.count != 1) {
        [self startTimer];
    }
    
    [self.collectionView reloadData];
}

- (void)setImageUrls:(NSArray<NSString *> *)imageUrls {
    _imageUrls = imageUrls;
    self.imagePaths = imageUrls;
}

#pragma mark - getter

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    
    return _flowLayout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.scrollsToTop = NO;
        _collectionView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    }
    
    return _collectionView;
}


@end
