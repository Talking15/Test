//
//  DownOperation.h
//  Test
//
//  Created by Murderer on 15/3/1.
//  Copyright (c) 2015年 AC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownOperation : NSOperation
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSURL *targetURL;
- (id)initWithURL:(NSURL*)url;
@end
