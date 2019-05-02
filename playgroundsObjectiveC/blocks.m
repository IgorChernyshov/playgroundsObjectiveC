//
//  Blocks.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 02/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IntegerObject.h"

void captureValueBlock()
{
    NSInteger number3 = 10;
    NSInteger(^tenPlus)(NSInteger number1, NSInteger number2) = ^(NSInteger number1, NSInteger number2)
    {
        return number1 + number2 + number3;
    };
    
    number3 = 5;
    
    NSInteger result = tenPlus(5, 3);
    NSLog(@"Block captured variable by value.\nNumber1 = 5, Number2 = 3, Number3 = 5. Sum = %ld", result);
}

void capturePrimitivesReferenceBlock()
{
    __block NSInteger number3 = 10;
    NSInteger(^tenPlus)(NSInteger number1, NSInteger number2) = ^(NSInteger number1, NSInteger number2)
    {
        return number1 + number2 + number3;
    };
    
    number3 = 5;
    
    NSInteger result = tenPlus(5, 3);
    NSLog(@"Block captured variable by value.\nNumber1 = 5, Number2 = 3, Number3 = 5. Sum = %ld", result);
}

void captureReferenceBlock()
{
    IntegerObject *number3 = [IntegerObject new];
    number3.value = 10;
    NSInteger(^tenPlus)(NSInteger number1, NSInteger number2) = ^(NSInteger number1, NSInteger number2)
    {
        return number1 + number2 + number3.value;
    };
    
    number3.value = 5;
    
    NSInteger result = tenPlus(5, 3);
    NSLog(@"Block captured variable by reference.\nNumber1 = 5, Number2 = 3, Number3 = 5. Sum = %ld", result);
}

void createSeveralBlocks()
{
    IntegerObject *blocksBuilder = [IntegerObject new];
    [blocksBuilder createNonRetainCycleBlock];
    [blocksBuilder createBlockAsObject];
}
