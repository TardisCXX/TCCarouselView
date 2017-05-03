//
//  TCCarouselView.h
//  TCCarouselViewProject
//
//  Created by TARDIS on 2017-4-27.
//  Copyright © 2017年 tardis_cxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCCarouselView : UIView

/// 本地图片集合
@property (nonatomic, strong) NSArray<UIImage *> *images;
/// 网络图片URL集合
@property (nonatomic, strong) NSArray<NSString *> *imageUrls;

@end
