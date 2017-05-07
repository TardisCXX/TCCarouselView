//
//  TCCarouselView.h
//  TCCarouselViewProject
//
//  Created by TARDIS on 2017-4-27.
//  Copyright © 2017年 tardis_cxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TCCarouselViewDelegate;

@interface TCCarouselView : UIView

/// 代理
@property (nonatomic, weak) id<TCCarouselViewDelegate> delegate;

/// 本地图片集合(设置本地图片轮播)
@property (nonatomic, strong) NSArray<NSString *> *images;
/// 网络图片URL集合(设置网络图片轮播)
@property (nonatomic, strong) NSArray<NSString *> *imageUrls;

@end

@protocol TCCarouselViewDelegate <NSObject>

@optional

- (void)carouselView:(TCCarouselView *)carouselView didSelectedIndex:(NSInteger)index;

@end
