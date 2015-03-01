//
//  ThirdViewController.m
//  Test
//
//  Created by Murderer on 15/3/1.
//  Copyright (c) 2015年 AC. All rights reserved.
//

#import "ThirdViewController.h"
#import "OSController.h"
@interface ThirdViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ThirdViewController
@synthesize table;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableSampleIdentifier];
    }
    
    cell.textLabel.text = @"O...S";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OSController *ocvc = [[OSController alloc] initWithNibName:@"OSController" bundle:nil];
    [self.navigationController pushViewController:ocvc animated:YES];
}

@end
