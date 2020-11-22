//
//  KVC.m
//  Runtime
//
//  Created by tigerfly on 2020/11/20.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "KVC.h"

@interface KVC ()

@end

@implementation KVC

//https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueCoding/index.html#//apple_ref/doc/uid/10000107-SW1


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Key-value coding is a mechanism enabled by the NSKeyValueCoding
     informal protocol that objects adopt to provide indirect
     access to their properties. When an object is key-value coding
     complaint, its properties are addressable via string parameters
     through a concise, uniform messaging interface. This indirect
     access mechanism supplements the direct access afforded by
     instance variables and their associated accessor methods.
     
     You typically use accessor methods to gain access to an object's
     properties. A get accessor(or getter) returns the value of
     a property. A set accessor(or setter) sets the value of a property.
     In Objective-C, you can also directly access a property's
     underlying instance variable. Accessing an object property in
     any of these ways is straightforward, but requires calling on
     a property-specific method or variable name. As the list of
     properties grows or changes, so also must the code which accesses
     these properties. In contrast, a key-value coding compliant
     object provides a simple messaging interface that is consistent
     across all of its properties.
     
     Key value coding is a fundamental concept that underlies many
     other Cocoa technologies, such as key-value observing,
     Cocoa bindings, Core Data, and AppleScript-ability. Key-value
     coding can also help to simplify your code in some cases.
     */
    
    /**
     Using Key-value Coding Compliant Objects
     
     Objects typically adopt key-value coding when they inherint from
     NSObject (directly or indirectly), which both adopts the
     NSKeyValueCoding protocol and provides a default implementation
     for the essential methods. Such an object enables other objects,
     through a compact messaging interface, to do the following:
     
     •  Access object properties. The protocol specifies methods,
        such as the generic getter valueForKey: and the generic
        setter setValue:forKey:, for accessing object properties
        by their name, or key, parameterized as a string. The default
        implementation of these and related methods use the key to
        locate and interact with the underlying data.
     •  Manipulate collection properties. The default implementations
        of the access methods work with an object's collection
        properties (such as NSArray objects) just like any other
        property. In addition, if an object defines collection
        accessor methods for a property, it enables key-value access
        to the contents of the collection. The is often more efficient
        than direct access and allows you to work with custom collection
        objects through a standardized interface.
     •  Invoke collection operators on collection objects. When
        accessing a collection property in a key-value coding compliant
        object, you can insert a collection operator into the key string.
        Collection operators instruct the default NSKeyValueCoding getter
        implementation to take an action on the collection,and then return
        either a new, filtered version of the collection, or a single value
        representing some characteristic of the collection.
     •  Access non-object properties. The default implementation of the
        protocol detects non-object properties, including both scalars
        and structures, and automatically wraps and unwraps them as
        objects for use on the protocol interface. In addition, the
        protocol declares a method allowing a complaint object to
        provide a suitable action for the case when a nil value is set
        on a non-object property through the key-value coding interface.
     •  Access properties by key path. When you have a hierarchy of
        key-value coding compliant objects, you can use key path based
        method calls to drill down, getting or setting a value deep within
        the hierarchy using a single call.
     */
    
    /**
     Adopting Key-Value Coding for an Object
     
     In order to make your own objects key-value coding complaint,
     you ensure that they adopt the NSKeyValueCoding informal protocol
     and implement the corresponding methods, such as valueForKey:
     as a generic getter and setValue:forKey: as a generic setter.
     Fortunately, as describled above, NSObject adopts this protocol
     and provides default implementations for these and other essential
     methods. Therefore, if you derive your object from NSObject ( or
     any of its many subclasses), much of the work is already done
     for you.
     
     In order for the default methods to do their work, you ensure your
     object's accessor methods and instance variables adhere to certain
     well-defined patterns. This allows the default implementation to
     find your object's properties in response to key-value coded messages.
     You then optionally extend and customize key-value coding by
     providing methods for validation and for handling certain special
     cases.
     */
    
    /**
     Key-Value Coding with Swift
     
     Swift objects that inherit from NSObject or one of its subclasses
     are key-value coding complaint for their properties by default.
     Whereas in Objective-C, a property's accesors and instance variables
     must follow certain patterns, a standard property declaration in
     swift automatically guarantees this. On the other hand, many of the
     protocol's features are either not relevant or are better handled
     using native Swift constructs or techniques that do not exist in
     Objective-C. For example, because all Swift properties are objects,
     you never exercise the default implementation's special handing of
     non-object properties.
     
     Therefore, While the key-Value coding protocol methods translate
     straightforwardly to swift, this guide focues primarily on Objective-C,
     where you need to do more to ensure compliance, and where key-value
     coding is often most useful. Situations that call for a significantly
     different approach in Swift are noted throughout the guide.
     */
    
    /**
     Other Cocoa Technologies Rely on Key-Value Coding
     
     An object that is key-value coding complaint can participate in a
     wide range of Cocoa technologies that depend upon this kind of
     access, including:
     •  Key-Value observing. This mechanism enables objects to register
        for asynchronous notifications driven by changes in another
        object's properties.
     •  Cocoa bindings. This collection of technologies fully implement
        a Model-View-Controller paradigm, where models encapsulate
        application data, views display and edit that data, and
        controllers mediate between the two.
     •  Core Data. This framework provides generalized and automated
        solutions to common tasks associated with object life cycle
        and object graph management, including persistence.
     •  AppleScript. This scripting language enables direct control
        of scriptable apps and of many parts of MacOS. Cocoa's
        scripting support takes advantage of key-value coding to
        get and set information in scriptable objects.
    */
    
    
#pragma mark -- Key-Value Coding Fundamentals
    
    /*
     Accessing Object Properties
     
     An object typically specifies properties in its interface
     declaration, and these properties belong to one of
     several categories:
     
     •  Attributes. These are simple values, such as a scalars,
        strings, or Boolean values. Value objects such as
        NSNumber and other immutable types such as as NSColor
        are also considered attributes.
     •  To-one relationships. These are mutable objects with
        properties of their own. An object's properties can
        change without the object itself changing. For example,
        a bank account object might have an owner property
        that is an instance of a Person object, which itself
        has an address property. The owner's address may change
        without changing the owner reference held by the bank
        account. The bank account's owner did not change.
        Only their address did.
     •  To-many relationships. These are collection objects.
        You commonly use an instance of NSArray or NSSet
        to hold such a collection, although custom collection
        classes are also possible.
     */
    
    /**
     Identifying an Object's Properties with Keys and Key Paths
            
     A key is a string that identifies a specific property. Typically,
     by convention, the key representing a property is the name
     of the property itself as it appears in code. Keys must use
     ASCII encoding, may not contain whitespace, and usually begin
     with a lowercase letter (though there are exceptions, such as
     the URL property found in many classes).
     
     Because the BankAccount class in Listing 2-1 is key-value
     coding compliant, it recognizes the keys owner, currentBalance,
     and transactions, which are the names of its properties.
     Instead of calling the setCurrentBalance: method, you can
     set the value by its key:
     =====================================================
     [myAccount setValue:@(100.0) forKey:@"currentBalance"];
     =====================================================
     In fact, you can set all the properties of the myAccount
     object with the same method, using different key parameters.
     Because the parameter is a string, it can be a variable
     that is manipulated at run-time.

     A key path is a string of dot-separated keys used to specify
     a sequence of object properties to traverse. The property
     of the first key in the sequence is relative to the receiver,
     and each subsequent key is evaluated relative to the value
     of the previous property. Key paths are useful for drilling
     down into a hierarchy of objects with a single method call.

     For example, the key path owner.address.street applied to
     a bank account instance refers to the value of the street
     string that is stored in the address of the bank account’s
     owner, assuming the Person and Address classes are also
     key-value coding compliant.
     */
    
    
    /**
     Getting Attribute Values Using Keys

     An object is key-value coding compliant when it adopts the
     NSKeyValueCoding protocol. An object that inherits from
     NSObject, which provides a default implementation of the
     protocol’s essential methods, automatically adopts this
     protocol with certain default behaviors. Such an object
     implements at least the following basic key-based getters:

     •  valueForKey: - Returns the value of a property named by
        the key parameter. If the property named by the key cannot
        be found according to the rules described in Accessor Search
        Patterns, then the object sends itself a valueForUndefinedKey:
        message. The default implementation of valueForUndefinedKey:
        raises an NSUndefinedKeyException, but subclasses may override
        this behavior and handle the situation more gracefully.
     •  valueForKeyPath: - Returns the value for the specified key
        path relative to the receiver. Any object in the key path
        sequence that is not key-value coding compliant for a particular
        key—that is, for which the default implementation of
        valueForKey: cannot find an accessor method—receives a
        valueForUndefinedKey: message.
     •  dictionaryWithValuesForKeys: - Returns the values for
        an array of keys relative to the receiver. The method
        calls valueForKey: for each key in the array. The returned
        NSDictionary contains values for all the keys in the array.
     
     ⚠️ Collection objects, such as NSArray, NSSet, and NSDictionary,
     can’t contain nil as a value. Instead, you represent nil values
     using the NSNull object. NSNull provides a single instance
     that represents the nil value for object properties. The default
     implementations of dictionaryWithValuesForKeys: and the related
     setValuesForKeysWithDictionary: translate between NSNull (in
     the dictionary parameter) and nil (in the stored property)
     automatically.

     When you use a key path to address a property, if any but the
     final key in the key path is a to-many relationship (that is,
     it references a collection), the returned value is a collection
     containing all the values for the keys to the right of the
     to-many key. For example, requesting the value of the key path
     transactions.payee returns an array containing all the payee
     objects for all the transactions. This also works for multiple
     arrays in the key path. The key path accounts.transactions.payee
     returns an array with all the payee objects for all the
     transactions in all the accounts.
     */

    
    /**
     Setting Attribute Values Using Keys
     
     As with getters, key-value coding compliant objects also
     provide a small group of generalized setters with default
     behavior based upon the implementation of the NSKeyValueCoding
     protocol found in NSObject:
     •  setValue: forKey: - Sets the value of the specified key
        relative to the object receiving the message to the given
        value. The default implementation of setValue:forKey:
        automatically unwraps NSNumber and NSValue objects that
        represent scalars and structs and assigns them to the property.
        See Representing Non-Object Values for details on the wrapping
        and unwrapping semantics.
     
        If the specified key corresponds to a property that the object
        receiving the setter call does not have, the object sends itself
        a setValue:forUndefinedKey: message. The default implementation
        of setValue:forUndefinedKey: raises an NSUndefinedKeyException.
        However, subclasses may override this method to handle the
        request in a custom manner.
     •  setValue:forKeyPath: - Sets the given value at the specified
        key path relative to the receiver. Any object in the key path
        sequence that is not key-value coding compliant for a particular
        key receives a setValue:forUndefinedKey: message.
     •  setValuesForKeysWithDictionary: - Sets the properties of
        the receiver with the values in the specified dictionary,
        using the dictionary keys to identify the properties. The
        default implementation invokes setValue:forKey: for each
        key-value pair, substituting nil for NSNull objects as required.
     
     In the default implementation, when you attempt to set a non-object
     property to a nil value, the key-value coding compliant object
     sends itself a setNilValueForKey: message. The default implementation
     of setNilValueForKey: raises an NSInvalidArgumentException, but an
     object may override this behavior to substitute a default value or
     a marker value instead, as described in Handling Non-Object Values.
     */
    
    
    /**
     Using Keys to Simplify Object Access
     
     To see how key-based getters and setters can simplify your code,
     consider the following example. In macOS, NSTableView and
     NSOutlineView objects associate an identifier string with
     each of their columns. If the model object backing the table
     is not key-value coding compliant, the table’s data source
     method is forced to examine each column identifier in turn
     to find the correct property to return, as shown in Listing 2-2.
     Further, in the future, when you add another property to
     your model, in this case the Person object, you must also
     revisit the data source method, adding another condition to
     test for the new property and return the relevant value.
     =====================================================
     Listing 2-2Implementation of data source method without key-value coding
     - (id)tableView:(NSTableView *)tableview objectValueForTableColumn:(id)column row:(NSInteger)row
     {
         id result = nil;
         Person *person = [self.people objectAtIndex:row];
      
         if ([[column identifier] isEqualToString:@"name"]) {
             result = [person name];
         } else if ([[column identifier] isEqualToString:@"age"]) {
             result = @([person age]);  // Wrap age, a scalar, as an NSNumber
         } else if ([[column identifier] isEqualToString:@"favoriteColor"]) {
             result = [person favoriteColor];
         } // And so on...
      
         return result;
     }
     =====================================================

     On the other hand, Listing 2-3 shows a much more compact
     implementation of the same data source method that takes
     advantage of a key-value coding compliant Person object.
     Using only the valueForKey: getter, the data source method
     returns the appropriate value using the column identifier
     as a key. In addition to being shorter, it is also more
     general, because it continues to work unchanged when new
     columns are added later, as long as the column identifiers
     always match the model object’s property names.
     =====================================================
     Listing 2-3Implementation of data source method with key-value coding
     - (id)tableView:(NSTableView *)tableview objectValueForTableColumn:(id)column row:(NSInteger)row
     {
         return [[self.people objectAtIndex:row] valueForKey:[column identifier]];
     }
     =====================================================
     */
    
    
    /*
     
     
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
