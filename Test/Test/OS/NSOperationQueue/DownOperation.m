//
//  DownOperation.m
//  Test
//
//  Created by Murderer on 15/3/1.
//  Copyright (c) 2015年 AC. All rights reserved.
//

#import "DownOperation.h"

@implementation DownOperation

@synthesize name;

- (void)main {
    NSLog(@"run operation: %@",name);
    [NSThread sleepForTimeInterval:3];
}

@end
