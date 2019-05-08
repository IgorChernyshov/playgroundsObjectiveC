//
//  loopsAndStructures.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 27/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

// MARK: - Loops

void forLoops()
{
    NSArray *array = @[@1, @2, @3];
    // preferable
    for (NSNumber *number in array) {
        NSLog(@"%@", number);
    }
    // unsafe
    for (int i = 0; i < 4; i++) {
        NSLog(@"%d", i);
    }
}

// MARK: - Collections

void createArrays()
{
    // Immutable Arrays:
    
    NSArray *immutableArray = [[NSArray alloc] initWithObjects: @"First", @"Second", @"Third", nil, @"Not added", nil];
    NSLog(@"Immutable array initiated via initWithObjects: %@", immutableArray);
    // <NSString *> will generate warnings but will not stop the project from compiling
    NSArray<NSString *> *immutableArray2 = @[@"2", @"1", @"3"];
    NSLog(@"Immutable array initiated via @[...]: %@", immutableArray2);
    
    // Mutable Arrays:
    
    // Tip: Do not try to write to mutable objects (even from other threads) while reading it.
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithObjects: @"First", @"Second", @"Third", nil];
    [mutableArray addObject: @"Fourth"];
    NSLog(@"Mutable array initiated via initWithObjects: %@", mutableArray);
    
    NSMutableArray *mutableArrayFromImmutable = [immutableArray2 mutableCopy];
    [mutableArrayFromImmutable sortUsingSelector: @selector(compare:)];
    NSLog(@"Sorted mutable array from immutableArray2: %@", mutableArrayFromImmutable);
    
    /*
     Performance tips:
     - Append - O(1)
     - Insert at - O(N)
     - Remove at O(N)
     - Access by index - O(1)
     - Binary search (in sorted array) - O(logN)
     - Sort - O(n*logN)
     NSSet is much better than NSArray for operations like checking if object is a part of set.
    */
}

void createDictionaries()
{
    NSDictionary *immutableDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"a", @"2", @"b" ,nil];
    NSLog(@"Immutable dictionary initiated via initWithObjectsAndKeys: %@", immutableDictionary);
    NSDictionary *immutableDictionary2 = @{
                                           @"key1": @"value1",
                                           @"key2": @"value2"
                                           };
    NSLog(@"Immutable dictionary initiated via @{...}: %@", immutableDictionary2);
    NSLog(@"Value for second key of immutableDictionary2: %@", immutableDictionary2[@"key2"]);
    
    /*
     Performance tips:
     - Insert - from O(1) to O(N)
     - Search by key - O(1)
     - Search by value - O(N)
     - Remove element - O(1)
    */
}

NSArray* sortedDictionaryKeys()
{
    NSDictionary *prices = @{
                             @"Mercedes-Benz SLK250" : [NSDecimalNumber decimalNumberWithString:@"42900.00"],
                             @"Mercedes-Benz E350" : [NSDecimalNumber decimalNumberWithString:@"51000.00"],
                             @"BMW M3 Coupe" : [NSDecimalNumber decimalNumberWithString:@"62000.00"],
                             @"BMW X6" : [NSDecimalNumber decimalNumberWithString:@"55015.00"]
                             };
    NSArray *sortedKeys = [prices keysSortedByValueUsingComparator:
                           ^NSComparisonResult(id obj1, id obj2) {
                               return [obj2 compare:obj1];
                           }];
    return sortedKeys;
}

NSSet* filteredDictionaryKeys()
{
    NSDictionary *prices = @{
                             @"Mercedes-Benz SLK250" : [NSDecimalNumber decimalNumberWithString:@"42900.00"],
                             @"Mercedes-Benz E350" : [NSDecimalNumber decimalNumberWithString:@"51000.00"],
                             @"BMW M3 Coupe" : [NSDecimalNumber decimalNumberWithString:@"62000.00"],
                             @"BMW X6" : [NSDecimalNumber decimalNumberWithString:@"55015.00"]
                             };
    NSDecimalNumber *maximumPrice = [NSDecimalNumber decimalNumberWithString:@"50000.00"];
    NSSet *under50k = [prices keysOfEntriesPassingTest:
                       ^BOOL(id key, id obj, BOOL *stop) {
                           if ([obj compare:maximumPrice] == NSOrderedAscending) {
                               return YES;
                           } else {
                               return NO;
                           }
                       }];
    return under50k;
}

void createSets()
{
    NSSet *set1 = [NSSet setWithObjects:@1, @2, @3, nil];
    NSSet *set2 = [NSSet setWithObjects:@3, @1, nil];
    BOOL isSubset = [set2 isSubsetOfSet:set1];
    if (isSubset) {
        NSLog(@"set2 is a subset of set1");
    } else {
        NSLog(@"set2 is not a subset of set1");
    }
    
    /*
     Performance tips:
     - Insert - from O(1) to O(N)
     - Search - O(1)
     - Remove - O(1)
    */
}

void searchInSet()
{
    NSSet *models = [NSSet setWithObjects:@"Civic", @"Accord",
                    @"Odyssey", @"Pilot", @"Fit", nil];
    NSLog(@"The set has %li elements", [models count]);
    // Fast enumeration (prefered)
    for (id item in models) {
        NSLog(@"%@", item);
    }
    // Via block
    [models enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        NSLog(@"Current item: %@", obj);
        if ([obj isEqualToString:@"Fit"]) {
            NSLog(@"I was looking for a Honda Fit, and I found it!");
            *stop = YES;    // Stop enumerating items
        }
    }];
}

void pointersAndValues()
{
    // create a primitive in memory
    int magicalNumber = 20;
    // create a pointer of type int
    int *pointer;
    NSLog(@"Uninitialized pointer %d", *pointer);
    // pointer = 20; - this won't work because pointer must point to an object in memory
    // this will work because we assign a value in memory to a pointer
    pointer = &magicalNumber;
    NSLog(@"Pointer points to value of magicalNumber %d", *pointer);
}

// MARK: - Structures

// Structs
typedef struct {
    float x;
    float y;
    float z;
} Coordinate;

/*
 Coordinate coordinate;
 coordinate.x = 10.0;
 coordinate.y = 5.0;
 coordinate.z = -1.0;
 -- OR --
 Coordinate coordinate = { 10.0, 5.0, -1.0 };
 */

// Enums
typedef enum {
    Red,
    Green,
    Blue
} Color;

/*
 Color color = Blue;
 if (color == Blue) {
 return [UIColor blueColor];
 }
 */

typedef enum : NSInteger {
    LowSpeed = 1,
    NormalSpeed = 2,
    HighSpeed = 3
} Speed;

/*
 Speed speedLevel = LowSpeed;
 NSLog(@"Speed - %li", (long)speedLevel);
 */
