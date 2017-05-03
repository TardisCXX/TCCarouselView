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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TCCarouselView *carouselView = [[TCCarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 3)];
    [self.view addSubview:carouselView];
    
    UIImage *image = nil;
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 1; i < 10; i++) {
        image = [UIImage imageNamed:[NSString stringWithFormat:@"mm0%d", i]];
        [arrM addObject:image];
    }
    
    carouselView.images = arrM.copy;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
