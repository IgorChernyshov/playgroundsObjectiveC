//
//  ARCObject.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 30/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "ARCObject.h"

@implementation ARCObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"ARCObject has been initiated.");
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"ARCObject will be destroyed.");
}

@end
