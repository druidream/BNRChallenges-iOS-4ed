//
//  BNRContainer.m
//  RandomItems
//
//  Created by Gu Jun on 2019/3/30.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (NSArray *)subitems {
    return _subitems;
}

- (void)setSubitems:(NSArray *)subitems {
    _subitems = subitems;
}

- (int)valueInDollars {
    int sum = _valueInDollars;
    for (BNRItem *item in self.subitems) {
        sum += item.valueInDollars;
    }
    return sum;
}

- (NSString *)description {
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
     self.itemName,
     self.serialNumber,
     self.valueInDollars,
     self.dateCreated];
    if (self.subitems.count > 0) {
        descriptionString = [NSString stringWithFormat:@"%@, with %lu subitems:", descriptionString, (unsigned long)self.subitems.count];
        for (BNRItem *item in self.subitems) {
            descriptionString = [NSString stringWithFormat:@"%@\n%@", descriptionString, item];
        }
    }
    return descriptionString;
}

@end
