//
//  BNRContainer.h
//  RandomItems
//
//  Created by Gu Jun on 2019/3/30.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNRContainer : BNRItem
{
    NSArray *_subitems;
}

- (void)setSubitems:(NSArray *)subitems;
- (NSArray *)subitems;

@end

NS_ASSUME_NONNULL_END
