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

#pragma mark - UI

- (void)setupUI {
    [self addSubview:self.collectionView];
    
    [self.collectionView registerClass:[TCShowContentCell class] forCellWithReuseIdentifier:kTCShowContentCellIndentifier];
}

#pragma mark - networking method



#pragma mark - action


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count ?: 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TCShowContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTCShowContentCellIndentifier forIndexPath:indexPath];
    cell.image = self.images[indexPath.item];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate



#pragma mark - private



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
    }
    
    return _collectionView;
}


@end
