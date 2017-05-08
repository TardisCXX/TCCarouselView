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
    
    UIColor *color = [UIColor darkGrayColor];
    UIImage *image = [self getImage:color];
    self.imageView.image = image;
}

#pragma mark - action


#pragma mark - private

- (UIImage *)getImage:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - setter

- (void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;
    if ([_imageUrl hasPrefix:@"http://"] || [_imageUrl hasPrefix:@"https://"]) {
        NSLog(@"网络下载");
        NSURL *url = [NSURL URLWithString:_imageUrl];
        __block NSError *error = nil;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingMappedAlways error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = [UIImage imageWithData:data];
            });
        });
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
