//
//  BNRLine.m
//  TouchTracker
//
//  Created by John Gallagher on 1/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRLine.h"

@implementation BNRLine

- (instancetype)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        double beginx = [aDecoder decodeDoubleForKey:@"beginx"];
        double beginy = [aDecoder decodeDoubleForKey:@"beginy"];
        double endx = [aDecoder decodeDoubleForKey:@"endx"];
        double endy = [aDecoder decodeDoubleForKey:@"endy"];
        self.begin = CGPointMake(beginx, beginy);
        self.end = CGPointMake(endx, endy);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    [coder encodeDouble:self.begin.x forKey:@"beginx"];
    [coder encodeDouble:self.begin.y forKey:@"beginy"];
    [coder encodeDouble:self.end.x forKey:@"endx"];
    [coder encodeDouble:self.end.y forKey:@"endy"];
}

@end
