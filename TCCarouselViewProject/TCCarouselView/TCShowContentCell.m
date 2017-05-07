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

- (void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;
    if ([_imageUrl hasPrefix:@"http://"] || [_imageUrl hasPrefix:@"https://"]) {
        NSLog(@"网络下载");
    } else {
        self.imageView.image = [UIImage imageNamed:_imageUrl];
    }
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
