//
//  ViewController.m
//  TCCarouselViewProject
//
//  Created by TARDIS on 2017-4-27.
//  Copyright © 2017年 tardis_cxx. All rights reserved.
//

#import "ViewController.h"
#import "TCCarouselView.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

/// 轮播器
@property (nonatomic, strong) TCCarouselView *carouselView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.carouselView = [[TCCarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 3)];
    [self.view addSubview:self.carouselView];
    
    [self getLocationImages];
}


- (void)getNetworkImages {
    NSArray *array = @[@"http://img1.gamedog.cn/2012/05/17/24-12051F94351.jpg",
                       @"http://img1.gamedog.cn/2012/05/17/24-12051F94350.jpg",
                       @"http://img1.gamedog.cn/2012/05/17/24-12051F94348-50.jpg",
                       @"http://img1.gamedog.cn/2012/05/17/24-12051F94348.jpg",
                       @"http://img1.gamedog.cn/2012/05/17/24-12051F94345.jpg",
                       @"http://img1.gamedog.cn/2012/05/17/24-12051F94347.jpg"];
    self.carouselView.imageUrls = array;
}


- (void)getLocationImages {
    UIImage *image = nil;
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 1; i < 10; i++) {
        image = [UIImage imageNamed:[NSString stringWithFormat:@"mm0%d", i]];
        [arrM addObject:image];
    }
    
    self.carouselView.images = arrM.copy;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
