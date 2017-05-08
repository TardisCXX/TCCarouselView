//
//  ViewController.m
//  TCCarouselViewProject
//
//  Created by TARDIS on 2017-4-27.
//  Copyright © 2017年 tardis_cxx. All rights reserved.
//

#import "ViewController.h"
#import "TCCarouselView.h"
#import "TCDemoViewController.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

@interface ViewController () <TCCarouselViewDelegate>

/// 轮播器
@property (nonatomic, weak) TCCarouselView *carouselView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TCCarouselView *carouselView = [[TCCarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 3)];
    self.carouselView = carouselView;
    self.carouselView.delegate = self;
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
    NSString *imagePath = nil;
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 1; i < 10; i++) {
        imagePath = [NSString stringWithFormat:@"mm0%d", i];
        [arrM addObject:imagePath];
    }
    
    self.carouselView.images = arrM.copy;
}

#pragma mark - TCCarouselViewDelegate

- (void)carouselView:(TCCarouselView *)carouselView didSelectedIndex:(NSInteger)index {
    TCDemoViewController *vc = [[TCDemoViewController alloc] init];
    switch (index) {
        case 0: {
            vc.color = [UIColor redColor];
            [self presentViewController:vc animated:YES completion:NULL];
            
            break;
        }
        case 2: {
            vc.color = [UIColor blueColor];
            [self presentViewController:vc animated:YES completion:NULL];
            
            break;
        }
        case 4: {
            vc.color = [UIColor blackColor];
            [self presentViewController:vc animated:YES completion:NULL];
            
            break;
        }
        case 6: {
            vc.color = [UIColor orangeColor];
            [self presentViewController:vc animated:YES completion:NULL];
            
            break;
        }
            
            
        default: {
            vc.color = [UIColor purpleColor];
            [self presentViewController:vc animated:YES completion:NULL];
            
            break;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
