//
//  TCShowContentCell.m
//  TCCarouselViewProject
//
//  Created by TARDIS on 2017-5-3.
//  Copyright © 2017年 tardis_cxx. All rights reserved.
//

#import "TCShowContentCell.h"

@interface TCShowContentCell ()

/// 图片视图
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TCShowContentCell

#pragma mark - init 

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.bounds;
}

#pragma mark - UI

- (void)setupUI {
    [self.contentView addSubview:self.imageView];
    
}

#pragma mark - action


#pragma mark - private


#pragma mark - setter

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = _image;
}

#pragma mark - getter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    
    return _imageView;
}

@end
