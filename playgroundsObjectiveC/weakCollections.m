//
//  weakCollections.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 08/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 NSPointerArray:
 - is mutable;
 - can hold objects inside with a weak reference;
 - can hold nils;
 - x250+ times slower than an NSArray in terms of adding objects.
 */
void createPointerArray()
{
    NSString *string1 = [NSString stringWithFormat:@"This is string 1"];
    NSString *string2 = [NSString stringWithFormat:@"This is string 2"];
    NSString *string3 = [NSString stringWithFormat:@"This is string 3"];
    NSPointerArray *pointerArray = [NSPointerArray weakObjectsPointerArray];
    [pointerArray addPointer:(__bridge void * _Nullable)(string1)];
    [pointerArray addPointer:(__bridge void * _Nullable)(string2)];
    [pointerArray addPointer:nil];
    [pointerArray addPointer:(__bridge void * _Nullable)(string3)];
    
    NSLog(@"Pointer array element count (including nil) = %lu", (unsigned long)[pointerArray count]);
    
    NSArray *immutableArray = [pointerArray allObjects];
    
    NSLog(@"Immutable array element count = %lu", (unsigned long)[immutableArray count]);
}

/**
 NSHashTable:
 - is mutable;
 - can hold objects inside with a weak reference;
 - nil objects are removed;
 - x2 times slower than an NSSet in terms of adding objects.
 */
void createHashTable()
{
    NSString *string1 = [NSString stringWithFormat:@"This is string 1"];
    NSString *string2 = [NSString stringWithFormat:@"This is string 2"];
    NSHashTable *hashTable = [NSHashTable weakObjectsHashTable];
    [hashTable addObject:string1];
    [hashTable addObject:nil];
    [hashTable addObject:string2];
    
    NSLog(@"Hash table element count (including nil) = %lu", (unsigned long)[hashTable count]);
}

/**
 NSMapTable:
 - is mutable;
 - can hold keys and values inside with a weak or strong references;
 - a little bit slower than an NSDictionary.
 */
void createMapTable()
{
    NSString *string1 = [NSString stringWithFormat:@"This is string 1"];
    NSString *string2 = [NSString stringWithFormat:@"This is string 2"];
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    [mapTable setObject:string1 forKey:@"string1"];
    [mapTable setObject:string2 forKey:@"string2"];
    
    NSLog(@"%@", mapTable);
}
