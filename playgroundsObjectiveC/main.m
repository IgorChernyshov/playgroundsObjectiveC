//
//  main.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 25/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Properties.h"
#import "ARCObject.h"
#import "Person.h"
#import "Man.h"

// MARK: - Methods declarations

// variables.m
void declareVariables(void);
void declareConst(void);
void castFloatToInt(void);
void advancedVariables(void);
void checkSizeOfTypes(void);
void idClassAndSel(void);

// conditionalOperators.m
typedef enum {
    Plus,
    Minus,
    Multiply,
    Divide,
    Mod
} Operator;

float calculate(NSInteger number1, Operator operator, NSInteger number2);
void compareTwoStrings(NSString *firstString, NSString *secondString);

// loopsAndStructures.m
void createArrays(void);
void createDictionaries(void);
NSArray* sortedDictionaryKeys(void);
NSSet* filteredDictionaryKeys(void);
void createSets(void);
void pointersAndValues(void);
void forLoops(void);

// blocks.m
void captureValueBlock(void);
void captureReferenceBlock(void);
void capturePrimitivesReferenceBlock(void);
void createSeveralBlocks(void);
void createAndRunGlobalBlock(void);
void createAndRunBlockInStack(void);
void createAndRunHeapBlock(void);

// queues.m
void dispatchGroups(void);
void barrier(void);

// advancedCollections.m
void createPointerArray(void);
void createHashTable(void);
void createMapTable(void);
void createOrderedSet(void);
void createCountedSet(void);
void createIndexSet(void);

// memoryManagement.m
void recursiveStackOverflowMethod(void);
void createObjectOnHeap(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //declareVariables();
        //declareConst();
        //castFloatToInt();
        
        //float sum = calculate(10, Plus, 15);
        //NSLog(@"%f", sum);
        //float divide = calculate(12345, Divide, 23);
        //NSLog(@"%f", divide);
        
        //compareTwoStrings(@"String", @"String");
        
        //createArrays();
        //createDictionaries();
        //NSArray *carsInStock = sortedDictionaryKeys();
        //NSLog(@"%@", carsInStock);
        //createSets();
        
        //pointersAndValues();
        
        //forLoops();
        
        //Properties *testingProperties = [Properties new];
        //testingProperties.name = @"Igor";
        //NSLog(@"%@", testingProperties.name);
        
        //NSLog(@"Creating propertiesHolder...");
        //Properties *propertiesHolder = [Properties new];
        //NSLog(@"Sending a message createAndSetARCObject to propertiesHolder...");
        //[propertiesHolder createAndSetARCObject];
        //NSLog(@"Destroying propertiesHolder...");
        //propertiesHolder = nil;
        
        //NSLog(@"Creating propertiesHolder...");
        //propertiesHolder = [Properties new];
        //NSLog(@"Sending a message createAndSetWeakARCObject to propertiesHolder...");
        //[propertiesHolder createAndSetWeakARCObject];
        //NSLog(@"Destroying propertiesHolder...");
        //propertiesHolder = nil;
        
        //captureValueBlock();
        //capturePrimitivesReferenceBlock();
        //captureReferenceBlock();
        //createSeveralBlocks();
        //createAndRunGlobalBlock();
        //createAndRunBlockInStack();
        //createAndRunHeapBlock();
        
        //dispatchGroups();
        //barrier();
        
        //advancedVariables();
        //checkSizeOfTypes();
        //idClassAndSel();
        
        //createPointerArray();
        //createHashTable();
        //createMapTable();
        //createOrderedSet();
        //createCountedSet();
        //createIndexSet();
        
        //recursiveStackOverflowMethod();
        //createObjectOnHeap();
        
        //NSObject *object = [NSObject new];
        //Person *person = [Person new];
        Man *man = [Man new];
        NSLog(@"%@", [man someString]);
    }
    return 0;
}
