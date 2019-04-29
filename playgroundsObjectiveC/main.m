//
//  main.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 25/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Properties.h"

// MARK: - Methods declarations

// variables.m
void declareVariables(void);
void declareConst(void);
void castFloatToInt(void);

// conditionalOperators.m
enum Operator {
  Plus,
  Minus,
  Multiply,
  Divide,
  Mod
};
typedef enum Operator Operator;

float calculate(NSInteger number1, Operator operator, NSInteger number2);
void compareTwoStrings(NSString *firstString, NSString *secondString);

// loopsAndStructures.m
void createArrays(void);
void createDictionaries(void);
void createSets(void);
void pointersAndValues(void);
void forLoops(void);

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
    //createSets();
    //pointersAndValues();
    //forLoops();
    Properties *testingProperties = [Properties new];
    testingProperties.name = @"Igor";
    NSLog(@"%@", testingProperties.name);
  }
  return 0;
}
