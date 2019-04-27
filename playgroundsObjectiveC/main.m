//
//  main.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 25/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

float calculate(NSInteger number1, char operator, NSInteger number2);

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    //declareVariables();
    //declareConst();
    //castFloatToInt();
    //float sum = calculate(10, '+', 15);
    //NSLog(@"%f", sum);
    float divide = calculate(12345, '/', 23);
    NSLog(@"%f", divide);
  }
  return 0;
}
