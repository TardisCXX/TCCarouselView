//
//  TCDemoViewController.m
//  TCCarouselViewProject
//
//  Created by TARDIS on 2017-5-7.
//  Copyright © 2017年 tardis_cxx. All rights reserved.
//

#import "TCDemoViewController.h"

@interface TCDemoViewController ()

@end

@implementation TCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}


- (void)setupUI {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.center = self.view.center;
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setTitle:@"dimiss" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    btn.layer.borderWidth = 2.0;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    [btn addTarget:self action:@selector(onBtnTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)onBtnTap:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)setColor:(UIColor *)color {
    _color = color;
    
    self.view.backgroundColor = _color;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
