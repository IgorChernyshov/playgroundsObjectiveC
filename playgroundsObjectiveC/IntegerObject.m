//
//  IntegerObject.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 02/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "IntegerObject.h"

@implementation IntegerObject

/**
 Uses weakSelf to avoid retain cycle.
 This block will be lost in case it's owner is destroyed.
 */
- (void)createNonRetainCycleBlock
{
    __weak typeof(self) weakSelf = self;
    self.exampleBlock = ^{
        weakSelf.value = 10;
        NSLog(@"%ld", weakSelf.value);
    };
    self.exampleBlock();
}

/**
 Allows to use block as a reference and pass it between variables and classes.
 */
- (void)createBlockAsObject
{
    __weak typeof(self) weakSelf = self;
    self.exampleBlock = [^{
        weakSelf.value = 10;
        NSLog(@"%ld", weakSelf.value);
    } copy];
    self.exampleBlock();
}

@end
