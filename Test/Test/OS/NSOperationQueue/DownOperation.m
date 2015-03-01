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

- (id)initWithURL:(NSURL*)url;
{
    if (![super init]) return nil;
    [self setTargetURL:url];
    return self;
}

- (void)main {
    NSLog(@"run operation: %@",name);
    [NSThread sleepForTimeInterval:3];
    
    
    
//    NSString *webpageString = [[NSString alloc] initWithContentsOfURL:[self targetURL]];
//    
//    NSError *error = nil;
//    NSXMLDocument *document = [[NSXMLDocument alloc] initWithXMLString:webpageString
//                                                               options:NSXMLDocumentTidyHTML
//                                                                 error:&error];
//    if (!document) {
//        NSLog(@"%s Error loading document (%@): %@", _cmd, [[self targetURL] absoluteString], error);
//        return;
//    }
//    
//    [[AppDelegate shared] performSelectorOnMainThread:@selector(pageLoaded:)
//                                           withObject:document
//                                        waitUntilDone:YES];
}

@end
