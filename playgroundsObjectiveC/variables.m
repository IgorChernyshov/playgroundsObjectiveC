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

void advancedVariables()
{
    BOOL isBool = YES;
    NSLog(@"%d", isBool);
    NSLog(@"%@", isBool ? @"YES" : @"NO");
    
    char aChar = 'c';
    unsigned char anUnsignedChar = 255;
    NSLog(@"The letter is %c. ASCII code is %hhd", aChar, aChar);
    NSLog(@"An unsigned char %hhu", anUnsignedChar);
    
    short aShort = -32768;
    unsigned short anUnsignedShort = 65535;
    NSLog(@"%hd", aShort);
    NSLog(@"%hu", anUnsignedShort);
    
    int anInt = -2147483648;
    unsigned int anUnsignedInt = 4294967295;
    NSLog(@"%d", anInt);
    NSLog(@"%u", anUnsignedInt);
    
    /*
    long aLong = -9223372036854775808;
    unsigned long anUnsignedLong = 18446744073709551615;
    NSLog(@"%ld", aLong);
    NSLog(@"%lu", anUnsignedLong);
    */
    
    /*
    long long aLong = -9223372036854775808;
    unsigned long long anUnsignedLong = 18446744073709551615;
    NSLog(@"%lld", aLong);
    NSLog(@"%llu", anUnsignedLong);
    */
    
    float aFloat = -17.62;
    NSLog(@"%f", aFloat);
    NSLog(@"%8.2f", aFloat);
    
    double aDouble = -123.456;
    NSLog(@"%e", aDouble);
    NSLog(@"%8.2f", aDouble);
    
    long double aLongDouble = -21.09e8L;
    NSLog(@"%Lf", aLongDouble);
    NSLog(@"%Le", aLongDouble);
}

void checkSizeOfTypes()
{
    NSLog(@"Size of char: %zu", sizeof(char));// This will always be 1
    NSLog(@"Size of short: %zu", sizeof(short));
    NSLog(@"Size of int: %zu", sizeof(int));
    NSLog(@"Size of long: %zu", sizeof(long));
    NSLog(@"Size of long long: %zu", sizeof(long long));
    NSLog(@"Size of float: %zu", sizeof(float));
    NSLog(@"Size of double: %zu", sizeof(double));
    NSLog(@"Size of size_t: %zu", sizeof(size_t));
    
    // check size of an array
    // size_t numberOfElements = sizeof(anArray)/sizeof(anArray[0]);
}

/*
 Tips:
 - It's better to always go for int when possible. For array's indexes use unsigned int.
 - In case of division the result will be:
    * integer if both numbers are integer;
    * fractured if at least one of the numbers is fractured.
 - Do not compare two fractured numbers (float-like). Use NSDecimalNumber instead.
*/

void idClassAndSel()
{
    id mysteryObject = @"An NSString object";
    NSLog(@"%@", [mysteryObject description]);
    mysteryObject = @{@"model": @"Ford", @"year": @1967};
    NSLog(@"%@", [mysteryObject description]);
    
    Class targetClass = [NSString class];
    id mysteryObject2 = @"An NSString object";
    if ([mysteryObject2 isKindOfClass:targetClass]) {
        NSLog(@"Yup! That's an instance of the target class");
    }
    
    /* SEL is used for internal method name representation. Used for runtime method swizzling
    SEL someMethod = @selector(sayHello);
    */
}
