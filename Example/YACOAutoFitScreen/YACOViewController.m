//
//  YACOViewController.m
//  YACOAutoFitScreen
//
//  Created by 751185567@qq.com on 05/15/2020.
//  Copyright (c) 2020 751185567@qq.com. All rights reserved.
//

#import "YACOViewController.h"
#import "YACOAutoFitScreen.h"
@interface YACOViewController ()

@end

@implementation YACOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    UILabel *testLabel = [UILabel new];
    testLabel.frame = CGRectMake(0, 0, kYACOFitModule(80), kYACOFitModule(90));
    testLabel.font = kYACOFitFontNormal(17.0);
    [self.view addSubview:testLabel];
}

@end
