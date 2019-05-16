//
//  memoryManagement.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 14/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

void recursiveStackOverflowMethod()
{
    NSLog(@"Next\n");
    recursiveStackOverflowMethod();
}

void createObjectOnHeap()
{
    // Basically everything that has a pointer is located in a heap
    NSArray *array = [NSArray new];
    NSLog(@"%@", array);
}

/*
 void createBunchOfObjectsInLoopCorrect()
 {
    for (NSUInteger i=0; i<1000; ++i) {
        @autoreleasepool {
            NSObject *obj = [[NSObject new] autorelease];
            NSLog(@"%@ %@", @(i),obj);
        }
    }
 }
 */

/*
- (NSString *)correctGetter {
    return [[_correctGetter retain] autorelease];
}
*/
