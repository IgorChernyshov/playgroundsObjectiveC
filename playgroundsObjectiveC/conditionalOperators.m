//
//  conditionalOperators.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 27/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

float calculate(NSInteger number1, char operator, NSInteger number2)
{
  switch (operator) {
    case '+':
      return number1 + number2;
      break;
    case '-':
      return number1 - number2;
      break;
    case '*':
      return number1 * number2;
      break;
    case '/':
      if (number2 == 0) {
        NSLog(@"You cannot divide by zero");
        return 0.0;
      }
      return (float)number1 / number2;
      break;
    case '%':
      return number1 % number2;
      break;
    default:
      NSLog(@"Unknown / unsupported operator");
      return 0.0;
      break;
  }
}

BOOL areStringsEqual(NSString *firstString, NSString *secondString)
{
  return [firstString isEqualToString:secondString];
}

void compareTwoStrings(NSString *firstString, NSString *secondString)
{
  if (areStringsEqual(firstString, secondString)) {
    NSLog(@"Strings are equal");
  } else {
    NSLog(@"Strings are not equal");
  }
}
