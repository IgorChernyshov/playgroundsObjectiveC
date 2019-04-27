//
//  variables.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 27/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAGICALNUMBER 10

void declareVariables()
{
  int intValue = 1;
  char *charValue = "kindaChar";
  bool boolValue = true;
  float floatValue = 6.5;
  double doubleValue = 10.8;
  
  BOOL boolObjectiveC = YES;
  NSInteger integer = 1;
  CGFloat cgFloat = 14.2;
  NSNumber *number = @128;
  NSString *string = @"NSString here";
  
  NSLog(@"%d", intValue);
  NSLog(@"%s", charValue);
  NSLog(@"%d", boolValue);
  NSLog(@"%f", floatValue);
  NSLog(@"%f", doubleValue);
  NSLog(@"%d", boolObjectiveC);
  NSLog(@"%ld", (long)integer);
  NSLog(@"%f", cgFloat);
  NSLog(@"%@", number);
  NSLog(@"%@", string);
}

void declareConst()
{
  NSString * const immutableString = @"This is an immutable string";
  // Can't do: immutableString = @"Changed string";
  NSLog(@"%@", immutableString);
  
  NSInteger integer = MAGICALNUMBER;
  NSLog(@"%ld", (long)integer);
}

void castFloatToInt()
{
  float someFloat = 20.999;
  int intFromFloat = (int)someFloat;
  
  NSLog(@"Int from %f is %d", someFloat, intFromFloat);
}
