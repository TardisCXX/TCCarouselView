//
//  ViewController.m
//  TCCarouselViewProject
//
//  Created by TARDIS on 2017-4-27.
//  Copyright © 2017年 tardis_cxx. All rights reserved.
//

#import "ViewController.h"
#import "TCCarouselView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TCCarouselView *carouselView = [[TCCarouselView alloc] init];
    NSLog(@"%@", carouselView);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end