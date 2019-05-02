//
//  IntegerObject.h
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 02/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IntegerObject : NSObject

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) void(^exampleBlock)(void);

- (void)createNonRetainCycleBlock;
- (void)createBlockAsObject;

@end

NS_ASSUME_NONNULL_END
