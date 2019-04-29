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
  
  NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithObjects: @"First", @"Second", @"Third", nil];
  [mutableArray addObject: @"Fourth"];
  NSLog(@"Mutable array initiated via initWithObjects: %@", mutableArray);
  
  NSMutableArray *mutableArrayFromImmutable = [immutableArray2 mutableCopy];
  [mutableArrayFromImmutable sortUsingSelector: @selector(compare:)];
  NSLog(@"Sorted mutable array from immutableArray2: %@", mutableArrayFromImmutable);
}

void createDictionaries()
{
  NSDictionary *immutableDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"a", @"2", @"b", nil];
  NSLog(@"Immutable dictionary initiated via initWithObjectsAndKeys: %@", immutableDictionary);
  
  NSDictionary *immutableDictionary2 = @{
                                         @"key1": @"value1",
                                         @"key2": @"value2"
                                         };
  NSLog(@"Immutable dictionary initiated via @{...}: %@", immutableDictionary2);
  NSLog(@"Value for second key of immutableDictionary2: %@", immutableDictionary2[@"key2"]);
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
struct Coordinate {
  float x;
  float y;
  float z;
};
typedef struct Coordinate Coordinate;

/*
 Coordinate coordinate;
 coordinate.x = 10.0;
 coordinate.y = 5.0;
 coordinate.z = -1.0;
-- OR --
 Coordinate coordinate = { 10.0, 5.0, -1.0 };
*/

// Enums
enum Color {
  Red,
  Green,
  Blue
};
typedef enum Color Color;

/*
 Color color = Blue;
 if (color == Blue) {
   return [UIColor blueColor];
 }
 */

enum Speed {
  LowSpeed = 1,
  NormalSpeed = 2,
  HighSpeed = 3
};
typedef NSInteger Speed;

 /*
 Speed speedLevel = LowSpeed;
 NSLog(@"Speed - %li", (long)speedLevel);
 */
