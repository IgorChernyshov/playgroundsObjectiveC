//
//  Properties.h
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 29/04/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SampleProtocol.h"
#import "ARCObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface Properties : NSObject <SampleProtocol>

// Works from the box
@property(nonatomic, strong) NSString *name;
// (* - default)
// -- Memory modifiers --
// strong* - sets retain/release
// weak - do not set retain/release
// copy - assigns a copy instead of assigning a link, almost like copying structures in Swift
// assign - for primitives/value-types
// -- Thread access modifiers --
// nonatomic - non-thread safe but faster
// atomic* - thread-safe, can be accessed from different threads
// -- Access control modifiers --
// xCode will warn if you try to write into readonly but it still can be done
// readwrite*
// readonly
// -- Getter/setter modifiers --
// setter="setterName"
// getter="getterName"

// Requires initialization, for example in init
@property(nonatomic, strong) NSMutableArray<NSString *> *employees;

// ARC tests
@property(nonatomic, strong) ARCObject *object;
@property(nonatomic, weak) ARCObject *weakObject;

- (void)createAndSetARCObject;
- (void)createAndSetWeakARCObject;

@end

NS_ASSUME_NONNULL_END
