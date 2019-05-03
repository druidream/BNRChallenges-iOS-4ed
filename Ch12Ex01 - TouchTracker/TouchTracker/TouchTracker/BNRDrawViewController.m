//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by John Gallagher on 1/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

- (void)saveState
{
    BNRDrawView *dv = (BNRDrawView *)self.view;
    NSArray *lines = [dv getLines];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:lines];

    BOOL success = [data writeToFile:[self filepath] atomically:YES];
    
    NSLog(@"archiveRootObject success? %d", success);
}

- (void)loadState
{
    BNRDrawView *dv = (BNRDrawView *)self.view;

    NSArray *lines = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filepath]];
    
    [dv setLines:lines];
    
    NSLog(@"unarchiveObjectWithFile result: %@", lines);
}

- (NSString *)filepath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"ios.archiver"];
    
    return path;
}

@end
