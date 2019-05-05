//
//  queues.m
//  playgroundsObjectiveC
//
//  Created by Igor Chernyshov on 04/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

dispatch_queue_t createNewSerialQueue()
{
    // queue type    queue name     creates new serial queue    name           params
    dispatch_queue_t serialQueue = dispatch_queue_create("customSerialQueue", NULL);
    return serialQueue;
}

dispatch_queue_t createNewParallelQueue()
{
    // queue type    queue name      creates new parallel queue   queue priority   flags
    dispatch_queue_t parallelQueue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
    return parallelQueue;
}

dispatch_queue_t getMainQueue()
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    return mainQueue;
}

void addSyncTask()
{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    int firstNumber = 10;
    int secondNumber = 20;
    __block int thirdNumber;
    
    dispatch_sync(globalQueue, ^{
        thirdNumber = firstNumber + secondNumber;
    });
}

void addAsyncTaskToMainQueue()
{
    dispatch_queue_t mainQueue = getMainQueue();
    
    int firstNumber = 10;
    int secondNumber = 20;
    __block int thirdNumber;
    
    dispatch_async(mainQueue, ^{
        thirdNumber = firstNumber + secondNumber;
    });
}

void suspendAndResumeCustomQueue()
{
    dispatch_queue_t serialQueue = dispatch_queue_create("customSerialQueue", NULL);
    // Suspend all non-started tasks
    dispatch_suspend(serialQueue);
    // Resume tasks processing
    dispatch_resume(serialQueue);
}

/*
void createQueuesWithDifferentQOS()
{
    dispatch_queue_t userInteractive = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t userInitiated = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t utility = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    dispatch_queue_t background = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t defaultQueue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0); // will return first or second queue
}

void createCustomQueueOnGlobalQueue()
{
    dispatch_queue_t userInitiatedQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t customQueue = dispatch_queue_create_with_target("customQueue", NULL, userInitiatedQueue);
}

void completeTaskAndReturnToMainQueue()
{
    dispatch_queue_t utilityQueue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    dispatch_async(utilityQueue, ^{
        [api loadImageWithCompletion: ^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                imageView.image = image
            });
        }];
    });
}
*/

void dispatchGroups()
{
    __block NSInteger firstNumber = 2;
    __block NSInteger secondNumber = 4;
    
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    
    // Add tasks to queue like this:
    dispatch_group_enter(dispatchGroup);
    dispatch_async(dispatchQueue, ^{
        firstNumber += 3;
        dispatch_group_leave(dispatchGroup);
    });
    
    dispatch_async(dispatchQueue, ^{
        secondNumber += 4;
        dispatch_group_leave(dispatchGroup);
    });
    
    // Or like this:
    dispatch_group_async(dispatchGroup, dispatchQueue, ^{
        firstNumber += 3;
    });
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^{
        secondNumber += 4;
    });
    
    // Run this when all tasks finished:
    dispatch_group_notify(dispatchGroup, dispatchQueue, ^{
        NSLog(@"First number = %ld, second number = %ld", firstNumber, secondNumber);
    });
}

void barrier()
{
    dispatch_queue_t userInteractiveQueue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_barrier_async(userInteractiveQueue, ^{
        NSLog(@"A barrier has been placed");
    });
    dispatch_async(userInteractiveQueue, ^{
        NSLog(@"Another task");
    });
}

void semaphore()
{
    // Semaphore with value >= 0 allows execution.
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    // Wait command will decrease semaphore's value and not allow to continue execution.
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    // As soon as semaphore's value is >= 0 program will continue execution.
    dispatch_async(createNewParallelQueue(), ^{
        NSLog(@"Waiting for semaphore to allow execution");
    });
    // Increase semaphore counter.
    dispatch_semaphore_signal(semaphore);
}
