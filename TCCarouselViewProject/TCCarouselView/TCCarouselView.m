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

@end

@implementation TCCarouselView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupTimer];
        [self setupUI];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
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
    if (self.timer == nil || !self.timer.isValid) {
        return;
    }
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)updateTimer {
    [self.collectionView setContentOffset:CGPointMake(self.bounds.size.width * 2, 0) animated:YES];
    [self scrollViewDidEndDecelerating:self.collectionView];
    NSLog(@"------------");
}


#pragma mark - action



#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.images.count > 0) {
        return self.images.count;
    }
    
    if (self.imageUrls.count > 0) {
        return self.imageUrls.count;
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TCShowContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTCShowContentCellIndentifier forIndexPath:indexPath];
    NSInteger index = 0;
    if (self.images.count > 0) {
        index = (indexPath.item - 1 + self.images.count + self.currentIndex) % self.images.count;
        cell.image = self.images[index];
        NSLog(@"index:%zd", index);
        
        return cell;
    }
    
    if (self.imageUrls.count > 0) {
        cell.imageUrl = self.imageUrls[indexPath.item];
        
        return cell;
    }
    
    return [UICollectionViewCell new];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath:%@", @(indexPath.item));
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width - 1;
    NSLog(@"offset:%zd", offset);
    
    if (offset == 0) {
        return;
    }
    
    self.currentIndex = (self.currentIndex + offset + self.images.count) % self.images.count;
    NSLog(@"要显示图片索引:%zd", self.currentIndex);
    
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

#pragma mark - private

- (void)setupTimer {
    if (self.images.count > 0 || self.imageUrls.count > 0) {
        [self setupDefaultUI];        
    }
    
    if (self.images.count > 2) {
        [self startTimer];
        return;
    }
    if (self.imageUrls.count > 2) {
        [self startTimer];
        return;
    }
}

- (void)setupDefaultUI {
    self.collectionView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    self.currentIndex = 0;
}


#pragma mark - setter



#pragma mark - getter

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.itemSize = self.frame.size;
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
    }
    
    return _collectionView;
}


@end
