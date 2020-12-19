//
//  Objective-CRuntime.m
//  Runtime
//
//  Created by tigerfly on 2020/12/19.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Objective-CRuntime.h"

@interface Objective_CRuntime ()

@end

@implementation Objective_CRuntime

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Gain low-level access to the Objective-C runtime and
     the Objective-C root types.
     
     The Objective-C Runtime module APIs define the base of
     the Objective-C language. These APIs include:
     •  Types sush as the NSObject class and the NSObject protocol
        that provide the root functionality of most Objective-C
        classes
     •  Functions and data structures that comprise the Objective-C
        runtime, which provides support for the dynamic properties
        of the Objective-C language.
     You typically don't need to use this module directly.
     */
    
    
#pragma mark -- Classes
    
    /*
     NSObject
     
     The root class of most Objective-C class hierarchies,
     from which subclasses inherit a basic interface to the
     runtime system and the ability to behave as Objective-C
     objects.
     */
    
    
    /**
     Initializing a Class
     
     + initialize
     Initializes the class before it receives its first message.
     
     + load
     Invoked whenever a class or category is added to the
     Objective-C runtime; implement this method to perform
     class-specific behavior upon loading.
     */
        
    
    /**
     Creating, Copying, and Deallocating Objects
     
     + alloc
     Returns a new instance of the receiving class.
     
     + allocWithZone:
     Returns a new instance of the receiving class.
     
     - init
     Implemented by subclasses to initialize a new object
     (the receiver) immediately after memory for it has
     been allocated.
     
     - copy
     Returns the object returned by copyWithZone:.
     
     + copyWithZone:
     Returns the receiver.
     
     - mutableCopy
     Returns the object returned by mutableCopyWithZone:
     where the zone is nil.
     
     + mutableCopyWithZone:
     Returns the receiver.
     
     - dealloc
     Deallocates the memory occupied by the receiver.
     
     + new
     Allocates a new instance of the receiving class,
     sends it an init message, and returns the initialized object.
     */
    
    
    /**
     Identifying Classes
     
     + class
     Returns the class object.
     
     + superclass
     Returns the class object for the receiver’s superclass.
     
     + isSubclassOfClass:
     Returns a Boolean value that indicates whether the
     receiving class is a subclass of, or identical to, a given class.
     */
    
    
    /**
     Testing Class Functionality
     
     + instancesRespondToSelector:
     Returns a Boolean value that indicates whether instances
     of the receiver are capable of responding to a given selector.
     */
    
    /**
     Testing Protocol Conformance
     
     + conformsToProtocol:
     Returns a Boolean value that indicates whether the target
     conforms to a given protocol.
     */
    
    /**
     Obtaining Information About Methods
     
     - methodForSelector:
     Locates and returns the address of the receiver’s implementation
     of a method so it can be called as a function.
     
     + instanceMethodForSelector:
     Locates and returns the address of the implementation of
     the instance method identified by a given selector.
     
     + instanceMethodSignatureForSelector:
     Returns an NSMethodSignature object that contains a description
     of the instance method identified by a given selector.
     
     - methodSignatureForSelector:
     Returns an NSMethodSignature object that contains a description
     of the method identified by a given selector.
     */
    
    
    /**
     Describing Objects
     
     + description
     Returns a string that represents the contents of the receiving class.
     */
    
    /**
     Supporting Discardable Content
     
     autoContentAccessingProxy
     A proxy for the receiving object
     */
    
    /**
     Sending Messages
     
     - performSelector:withObject:afterDelay:
     Invokes a method of the receiver on the current thread using
     the default mode after a delay.
     
     - performSelector:withObject:afterDelay:inModes:
     Invokes a method of the receiver on the current thread using
     the specified modes after a delay.
     
     - performSelectorOnMainThread:withObject:waitUntilDone:
     Invokes a method of the receiver on the main thread using the
     default mode.
     
     - performSelectorOnMainThread:withObject:waitUntilDone:modes:
     Invokes a method of the receiver on the main thread using the
     specified modes.
     
     - performSelector:onThread:withObject:waitUntilDone:
     Invokes a method of the receiver on the specified thread using
     the default mode.
     
     - performSelector:onThread:withObject:waitUntilDone:modes:
     Invokes a method of the receiver on the specified thread using
     the specified modes.
     
     - performSelectorInBackground:withObject:
     Invokes a method of the receiver on a new background thread.
     
     + cancelPreviousPerformRequestsWithTarget:
     Cancels perform requests previously registered with the performSelector:withObject:afterDelay: instance method.
     
     + cancelPreviousPerformRequestsWithTarget:selector:object:
     Cancels perform requests previously registered with
     performSelector:withObject:afterDelay:
     */
    
    /**
     Forwarding Messages
     
     - forwardingTargetForSelector:
     Returns the object to which unrecognized messages should
     first be directed.
     
     - forwardInvocation:
     Overridden by subclasses to forward messages to other objects.
     */
    
    /**
     Dynamically Resolving Methods
     
     + resolveClassMethod:
     Dynamically provides an implementation for a given selector
     for a class method.
     
     + resolveInstanceMethod:
     Dynamically provides an implementation for a given selector for
     an instance method.
     */
    
    /**
     Handling Errors
     
     - doesNotRecognizeSelector:
     Handles messages the receiver doesn’t recognize.
     */
    
    /**
     Archiving
     
     classForArchiver
     The class to substitute for the receiver's own class
     during archiving.
     
     classForCoder
     Overridden by subclasses to substitute a class other than
     its own during coding.
     */
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
