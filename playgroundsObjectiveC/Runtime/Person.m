//
//  Person.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 17/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)someString
{
    NSString *firstString = @"1234";
    NSString *secondString = @"1234";
    // Both created in global memory. References are equal.
    if (firstString == secondString) {
        NSLog(@"firstString == secondString");
    }
    return @"Some String";
}

@end
