//
//  AppDelegate.h
//  Test
//
//  Created by Murderer on 15/3/1.
//  Copyright (c) 2015年 AC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownOperation.h"
#import <objc/runtime.h>
#import <libxml/tree.h>//http://www.tuicool.com/articles/Nraau2
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSOperationQueue *queue;
}

@property (strong, nonatomic) UIWindow *window;

+ (id)shared;
//- (void)pageLoaded:(NSXMLDocument*)document;
@end

