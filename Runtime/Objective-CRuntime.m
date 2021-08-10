//
//  Objective-CRuntime.m
//  Runtime
//
//  Created by tigerfly on 2020/12/19.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Objective-CRuntime.h"
#import <objc/runtime.h>
@interface Objective_CRuntime ()
@property (nonatomic, strong) NSObject *destory;
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
     •  Types such as the NSObject class and the NSObject protocol
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
     [NSObject instanceMethodForSelector:@selector(isKindOfClass:)];
    
    /**
     Testing Protocol Conformance
     
     + conformsToProtocol:
     Returns a Boolean value that indicates whether the target
     conforms to a given protocol.
     */
    BOOL resut = [NSObject conformsToProtocol:@protocol(NSObject)];
    
    
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
    
    
#pragma mark -- Protocol/NSObject
        
    /*
     The group of methods that are fundamental to all Objective-C objects.
     
     ⚠️ This protocol is imported into Swift with the name NSObjectProtocol.
     
     An object that conforms to this protocol can be considered a first-class
     object. Such an object can be asked about its:
     •  Class, and the place of its class in the inheritance hierarchy.
     •  Conformance to protocols.
     •  Ability to respond to a particular message.
     
     The Cocoa root class NSObject adopts this protocol, so all objects
     inheriting from NSObject have the features described by this protocol.
     */
    
    /**
     Identifying Classes
     
     - class
     Returns the class object for the receiver’s class.
     Required.
     
     superclass
     Returns the class object for the receiver’s superclass.
     Required.
     */
    
    /**
     Identifying and Comparing Objects
     
     - isEqual:
     Returns a Boolean value that indicates whether the receiver and a
     given object are equal.
     Required.
     
     hash
     Returns an integer that can be used as a table address in a
     hash table structure.
     Required.

     - self
     Returns the receiver.
     Required.
     */
    
    /**
     Testing Object Inheritance, Behavior, and Conformance
     
     - isKindOfClass:
     Returns a Boolean value that indicates whether the receiver is
     an instance of given class or an instance of any class that inherits
     from that class.
     Required.
     
     - isMemberOfClass:
     Returns a Boolean value that indicates whether the receiver is
     an instance of a given class.
     Required.
     
     - respondsToSelector:
     Returns a Boolean value that indicates whether the receiver
     implements or inherits a method that can respond to a specified message.
     Required.

     - conformsToProtocol:
     Returns a Boolean value that indicates whether the receiver conforms
     to a given protocol.
     Required.
     */
    
    /**
     Describing Objects
     
     description
     Returns a string that describes the contents of the receiver.
     Required.
     
     debugDescription
     Returns a string that describes the contents of the receiver for
     presentation in the debugger.
     */
    
    /**
     Sending Messages
     
     - performSelector:
     Sends a specified message to the receiver and returns the result of the message.
     Required.
     
     - performSelector:withObject:
     Sends a message to the receiver with an object as the argument.
     Required.
     
     - performSelector:withObject:withObject:
     Sends a message to the receiver with two objects as arguments.
     Required.
     */
    
    /**
     Identifying Proxies

     - isProxy
     Returns a Boolean value that indicates whether the receiver does not
     descend from NSObject.
     Required.
     */
    
    /**
     Obsolete Methods
     
     - retain
     Increments the receiver’s reference count.
     Required.
     
     - release
     Decrements the receiver’s reference count.
     Required.
     
     - autorelease
     Decrements the receiver’s retain count at the end of the current
     autorelease pool block.
     Required.
     
     - retainCount
     Do not use this method.
     Required.

     - zone
     Zones are deprecated and ignored by most classes that have it as
     a parameter.
     Required.
     */
    
    
    
#pragma mark -- Objective-C Runtime
    
    /**
     Describes the macOS Objective-C runtime library support
     functions and data structures.
     
     The Objective-C runtime is a runtime library that provides
     support for the dynamic properties of the Objective-C language,
     and as such is linked to by all Objective-C apps. Objective-C
     runtime library support functions are implemented in the shared
     library found at /usr/lib/libobjc.A.dylib.
     
     You typically don't need to use the Objective-C runtime library
     directly when programming in Objective-C. This API is useful
     primarily for developing bridge layers between Objective-C and
     other languages, or for low-level debugging.
     
     The macOS implementation of the Objective-C runtime library
     is unique to the Mac. For other platforms, the GNU Compiler
     Collection provides a different implementation with a similar
     API. This document covers only the macOS implementation.
     
     The low-level Objective-C runtime API is significantly updated
     in OS X version 10.5. Many functions and all existing data
     structures are replaced with new functions. The old functions
     and structures are deprecated in 32-bit and absent in 64-bit
     mode. The API constrains several values to 32-bit ints even in
     64-bit mode—class count, protocol count, methods per class,
     ivars per class, arguments per method, sizeof(all arguments)
     per method, and class version number. In addition, the new
     Objective-C ABI (not described here) further constrains
     sizeof(anInstance) to 32 bits, and three other values to 24
     bits—methods per class, ivars per class, and sizeof(a single
     ivar). Finally, the obsolete NXHashTable and NXMapTable are
     limited to 4 billion items.
     
     String encoding
     All char * in the runtime API should be considered to have UTF-8 encoding.
     */
    
    
    const char* name = class_getName([self class]);
    
    /**
     Working with Classes
     
     class_getName
     Returns the name of a class.
     
     class_getSuperclass
     Returns the superclass of a class.
     
     class_isMetaClass
     Returns a Boolean value that indicates whether a class object is a metaclass.
     
     class_getInstanceSize
     Returns the size of instances of a class.
     
     class_getInstanceVariable
     Returns the Ivar for a specified instance variable of a given class.
     
     class_getClassVariable
     Returns the Ivar for a specified class variable of a given class.
     
     class_addIvar
     Adds a new instance variable to a class.
     
     class_copyIvarList
     Describes the instance variables declared by a class.
     
     class_getIvarLayout
     Returns a description of the Ivar layout for a given class.
     
     class_setIvarLayout
     Sets the Ivar layout for a given class.
     
     class_getWeakIvarLayout
     Returns a description of the layout of weak Ivars for a given class.
     
     class_setWeakIvarLayout
     Sets the layout for weak Ivars for a given class.
     
     class_getProperty
     Returns a property with a given name of a given class.
     
     class_copyPropertyList
     Describes the properties declared by a class.
     
     class_addMethod
     Adds a new method to a class with a given name and implementation.
     
     class_getInstanceMethod
     Returns a specified instance method for a given class.
     
     class_getClassMethod
     Returns a pointer to the data structure describing a given class
     method for a given class.
     
     class_copyMethodList
     Describes the instance methods implemented by a class.
     
     class_replaceMethod
     Replaces the implementation of a method for a given class.
     
     class_getMethodImplementation
     Returns the function pointer that would be called if a particular
     message were sent to an instance of a class.
     
     class_getMethodImplementation_stret
     Returns the function pointer that would be called if a particular
     message were sent to an instance of a class.
     
     class_respondsToSelector
     Returns a Boolean value that indicates whether instances of a
     class respond to a particular selector.

     class_addProtocol
     Adds a protocol to a class.
     
     class_addProperty
     Adds a property to a class.

     class_replaceProperty
     Replace a property of a class.
     
     class_conformsToProtocol
     Returns a Boolean value that indicates whether a class conforms
     to a given protocol.
     
     class_copyProtocolList
     Describes the protocols adopted by a class.
          
     class_getVersion
     Returns the version number of a class definition.
     
     class_setVersion
     Sets the version number of a class definition.
     
     objc_getFutureClass
     Used by CoreFoundation's toll-free bridging.
     
     objc_setFutureClass
     Used by CoreFoundation's toll-free bridging.
     */
    
    /**
     Adding Classes
     
     objc_allocateClassPair
     create a new class and metaclass.
     
     objc_disposeClassPair
     Destroys a class and its associated metaclass.
     
     objc_registerClassPair
     Registers a class that was allocated using objc_allocateClassPair(_:_:_:).

     objc_duplicateClass
     Used by Foundation's Key-Value Observing.
     */
    
    /**
     Working with Instances
     
     object_getIndexedIvars
     Returns a pointer to any extra bytes allocated with a instance given
     object.
     
     object_getIvar
     Reads the value of an instance variable in an object.
     
     object_setIvar
     Sets the value of an instance variable in an object.
     
     object_getClassName
     Returns the class name of a given object.
     
     object_getClass
     Return the class of an object
     
     object_setClass
     Sets the class of an object.
     */

    /**
     Obtaining Class Definitions
     
     objc_getClassList
     obtains the list of registered class definitions.
     
     objc_copyClassList
     Creates and returns a list of pointers to all registered class
     definitions.
     
     objc_lookUpClass
     Returns the class definitions of a specified class.
     
     objc_getClass
     Returns the class definitions of a specified class.
     
     objc_getRequiredClass
     Returns the class definition of a specified class.
     
     objc_getMetaClass
     Returns the metaclass definition of a specified class.
     */
    
    /**
     Working with Instance Variables
     
     ivar_getName
     Returns the name of an instance variable.
     
     ivar_getTypeEncoding
     Returns the type string of an instance variable.
     
     ivar_getOffset
     Returns the offset of an instance variable.
     */
    
    /**
     Associative References
     
     objc_setAssociatedObject
     Sets an associated value for a given object using a given key
     and association policy,
     
     objc_getAssociatedObject
     Returns the value associated with a given object for a given key.
     
     objc_removeAssociatedObjects
     Removes all associations for a given object.
     */
    
    /**
     Working with Methods
     
     method_getName
     Returns the name of a method.
     
     method_getImplementation
     Returns the implementation of a method.
     
     method_getTypeEncoding
     Returns a string describing a method's parameter and return types.
     
     method_copyReturnType
     Returns a string describing a method's return type.
     
     method_copyArgumentType
     Returns a string describing a single parameter type of a method.
     
     method_getReturnType
     Returns by reference a string describing a method's return type.
     
     method_geteNumberOfArguments
     Returns the number of arguments accepted by a method.
     
     method_getDescription
     Returns a method description structure for a specified method.
     
     method_setImplementation
     Sets the implementation of a method.
     
     method_exchangeImplementations
     Exchanges the implementations of two methods.
     */
    
        
    
    
    /**
     Class-Definition Data Structures
     
     Class
     An opaque type that represents an Objective-C class.
     
     Method
     An opaque type that represents a method in a class definition.
     
     Ivar
     An opaque type that represents an instance variable.
     
     Category
     An opaque type that represents a category.
     
     objc_property_t
     An opaque type that represents an Objective-C declared property.
     
     IMP ->id (*IMP)(id, SEL, ...)
     A pointer to the start of a method implementation.
     
     SEL
     Defines an opaque type that represents a method selector.
     
     objc_method_description
     Defines an Objective-C method.
     
     objc_cache
     Performance optimization for method calls. Contains pointers
     to recently used methods.
     
     objc_property_attribute_t
     Defines a property attribute.
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
