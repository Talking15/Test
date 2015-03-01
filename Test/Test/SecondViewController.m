//
//  SecondViewController.m
//  Test
//
//  Created by Murderer on 15/3/1.
//  Copyright (c) 2015年 AC. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController
- (void)btnAction {
    ThirdViewController *tvc = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tvc];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

- (void)viewDidLoad {
     [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(123, 123, 67, 67);
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
