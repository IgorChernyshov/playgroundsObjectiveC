//
//  Properties.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 29/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "Properties.h"

@implementation Properties

@synthesize name = firstName;

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.employees = [NSMutableArray new];
    // firstName = @"Some name"; - assign a value to properties variable
    // self.name = @"Some name"; - assign a value to property
    // [self setName:@"Some name"]; - another way to assign a value to property
    
    // getter/setter/ivar
    // self.name - returns a value via getter
    // firstName - returns a value stored in an ivar ignoring getter
    // self.name = @"Igor"; - sets a value via setter
    // [object setName:@"Igor"]; - sets a value for object's name property via setter
  }
  return self;
}

@end
