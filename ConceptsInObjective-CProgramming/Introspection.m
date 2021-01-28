//
//  Introspection.m
//  Runtime
//
//  Created by tigerfly on 2020/12/6.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Introspection.h"

@interface Introspection ()

@end

@implementation Introspection

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Introspection is a powerful feature of object-oriented
     languages and environments, and introspection in
     Objective-C and Cocoa is no exception. Introspection
     refers to the capability of objects to divulge details
     about themselves as objects at runtime. Such details
     include an object’s place in the inheritance tree,
     whether it conforms to a specific protocol, and whether
     it responds to a certain message. The NSObject protocol
     and class define many introspection methods that you
     can use to query the runtime in order to characterize
     objects.

     Used judiciously, introspection makes an object-oriented
     program more efficient and robust. It can help you avoid
     message-dispatch errors, erroneous assumptions of object
     equality, and similar problems. The following sections
     show how you might effectively use the NSObject
     introspection methods in your code.
     */
    
    
#pragma mark --  Evaluating Inheritance Relationships

    /**
     Once you know the class an object belongs to,
     you probably know quite a bit about the object.
     You might know what its capabilities are, what
     attributes it represents, and what kinds of messages
     it can respond to. Even if after introspection you
     are unfamiliar with the class to which an object
     belongs, you now know enough to not send it certain
     messages.

     The NSObject protocol declares several methods for
     determining an object’s position in the class hierarchy.
     These methods operate at different granularities.
     The class and superclass instance methods, for example,
     return the Class objects representing the class and
     superclass, respectively, of the receiver. These
     methods require you to compare one Class object with
     another. Listing 4-1 gives a simple (one might say
     trivial) example of their use.

     Listing 4-1  Using the class and superclass methods
     // ...
     while ( id anObject = [objectEnumerator nextObject] ) {
         if ( [self class] == [anObject superclass] ) {
             // do something appropriate...
         }
     }

     ⚠️ Sometimes you use the class or superclass methods
     to obtain an appropriate receiver for a class message.
     
     More commonly, to check an object’s class affiliation,
     you would send it a isKindOfClass: or isMemberOfClass:
     message. The former method returns whether the receiver
     is an instance of a given class or an instance of any
     class that inherits from that class. A isMemberOfClass:
     message, on the other hand, tells you if the receiver
     is an instance of the specified class. The isKindOfClass:
     method is generally more useful because from it you can
     know at once the complete range of messages you can send
     to an object. Consider the code snippet in Listing 4-2.
     ================================================
     Listing 4-2  Using isKindOfClass:

     if ([item isKindOfClass:[NSData class]]) {
         const unsigned char *bytes = [item bytes];
         unsigned int length = [item length];
         // ...
     }
     ================================================

     By learning that the object item inherits from
     the NSData class, this code knows it can send it
     the NSDatabytes and length messages. The difference
     between isKindOfClass: and isMemberOfClass: becomes
     apparent if you assume that item is an instance of
     NSMutableData. If you use isMemberOfClass: instead
     of isKindOfClass:, the code in the conditionalized
     block is never executed because item is not an
     instance of NSData but rather of NSMutableData,
     a subclass of NSData.
     */
    

#pragma mark -- Method Implementation and Protocol Conformance

    /*
     Two of the more powerful introspection methods of
     NSObject are respondsToSelector: and conformsToProtocol:.
     These methods tell you, respectively, whether an object
     implements a certain method and whether an object conforms
     to a specified formal protocol (that is, adopts the
     protocol, if necessary, and implements all the methods
     of the protocol).

     You use these methods in a similar situation in your code.
     They enable you to discover whether some potentially
     anonymous object can respond appropriately to a particular
     message or set of messages before you send it any of
     those messages. By making this check before sending a
     message, you can avoid the risk of runtime exceptions
     resulting from unrecognized selectors. The AppKit
     framework implements informal protocols—the basis
     of delegation—by checking whether delegates implement
     a delegation method (using respondsToSelector:) prior
     to invoking that method.
     
     Listing 4-3 illustrates how you might use the
     respondsToSelector: method in your code.
     ================================================
     Listing 4-3  Using respondsToSelector:

     - (void)doCommandBySelector:(SEL)aSelector {
         if ([self respondsToSelector:aSelector]) {
             [self performSelector:aSelector withObject:nil];
         } else {
             [_client doCommandBySelector:aSelector];
         }
     }
     ================================================

     Listing 4-4 illustrates how you might use the
     conformsToProtocol: method in your code.
     ================================================
     Listing 4-4  Using conformsToProtocol:

     // ...
     if (!([((id)testObject) conformsToProtocol:@protocol(NSMenuItem)])) {
         NSLog(@"Custom MenuItem, '%@', not loaded; it must conform to the
             'NSMenuItem' protocol.\n", [testObject class]);
         [testObject release];
         testObject = nil;
     }
     ================================================
     */
    

#pragma mark -- Object Comparison

    /**
     Although they are not strictly introspection methods,
     the hash and isEqual: methods fulfill a similar role.
     They are indispensable runtime tools for identifying
     and comparing objects. But instead of querying the
     runtime for information about an object, they rely on
     class-specific comparison logic.

     The hash and isEqual: methods, both declared by the
     NSObject protocol, are closely related. The hash
     method must be implemented to return an integer that
     can be used as a table address in a hash table
     structure. If two objects are equal (as determined
     by the isEqual: method), they must have the same hash
     value. If your object could be included in collections
     such as NSSet objects, you need to define hash and
     verify the invariant that if two objects are equal,
     they return the same hash value. The default NSObject
     implementation of isEqual: simply checks for pointer
     equality.

     Using the isEqual: method is straightforward; it
     compares the receiver against the object supplied as
     a parameter. Object comparison frequently informs
     runtime decisions about what should be done with an
     object. As Listing 4-5 illustrates, you can use
     isEqual: to decide whether to perform an action, in
     this case to save user preferences that have been modified.
     ================================================
     Listing 4-5  Using isEqual:

     - (void)saveDefaults {
         NSDictionary *prefs = [self preferences];
         if (![origValues isEqual:prefs])
             [Preferences savePreferencesToDefaults:prefs];
     }
     ================================================
     
     If you are creating a subclass, you might need to
     override isEqual: to add further checks for points
     of equality. The subclass might define an extra
     attribute that has to be the same value in two instances
     for them to be considered equal. For example, say you
     create a subclass of NSObject called MyWidget that contains
     two instance variables, name and data. Both of these must
     be the same value for two instances of MyWidget to be
     considered equal. Listing 4-6 illustrates how you might
     implement isEqual: for the MyWidget class.
     ================================================
     Listing 4-6  Overriding isEqual:

     - (BOOL)isEqual:(id)other {
         if (other == self)
             return YES;
         if (!other || ![other isKindOfClass:[self class]])
             return NO;
         return [self isEqualToWidget:other];
     }
      
     - (BOOL)isEqualToWidget:(MyWidget *)aWidget {
         if (self == aWidget)
             return YES;
         if (![(id)[self name] isEqual:[aWidget name]])
             return NO;
         if (![[self data] isEqualToData:[aWidget data]])
             return NO;
         return YES;
     }
     ================================================
     
     This isEqual: method first checks for pointer
     equality, then class equality, and finally invokes
     an object comparator whose name indicates the class
     of object involved in the comparison. This type of
     comparator, which forces type checking of the object
     passed in, is a common convention in Cocoa; the
     isEqualToString: method of the NSString class and
     the isEqualToTimeZone: method of the NSTimeZone class
     are but two examples. The class-specific
     comparator—isEqualToWidget: in this case—performs
     the checks for name and data equality.

     In all isEqualToType: methods of the Cocoa frameworks,
     nil is not a valid parameter and implementations of
     these methods may raise an exception upon receiving
     a nil. However, for backward compatibility, isEqual:
     methods of the Cocoa frameworks do accept nil,
     returning NO.
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
