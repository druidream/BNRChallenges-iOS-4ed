//
//  main.m
//  RandomItems
//
//  Created by John Gallagher on 1/12/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        // Challenge 03 test code
        BNRContainer *container = [BNRContainer randomItem];
        BNRContainer *subContainer = [BNRContainer randomItem];
        NSMutableArray *items = [[NSMutableArray alloc] init];
        NSMutableArray *subContainerItems = [[NSMutableArray alloc] init];

        for (int i = 0; i < 3; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        [items addObject:subContainer];
        [container setSubitems:items];

        for (int i = 0; i < 3; i++) {
            BNRItem *item = [BNRItem randomItem];
            [subContainerItems addObject:item];
        }
        [subContainer setSubitems:subContainerItems];
        
        NSLog(@"%@", container);

        // Destroy the mutable array object
        items = nil;
    }
    return 0;
}

