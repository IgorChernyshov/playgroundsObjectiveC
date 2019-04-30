//
//  SampleProtocol.h
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 29/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SampleProtocol

@property (nonatomic, strong) NSString *name;

- (void)printName;

@end
