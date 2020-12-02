//
//  KVC.m
//  Runtime
//
//  Created by tigerfly on 2020/11/20.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "KVC.h"
#import <objc/runtime.h>

@interface Transaction : NSObject<NSSecureCoding>

@property (nonatomic) NSString *payee;
@property (nonatomic) NSNumber *amount;
@property (nonatomic) NSDate *date;

@end

@implementation Transaction
@synthesize payee = _payee;
@dynamic date;

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.payee = [coder decodeObjectForKey:@"payee"];
        self.amount = [coder decodeObjectForKey:@"amount"];
        self.date = [coder decodeObjectForKey:@"date"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeObject:self.amount forKey:@"payee"];
    [coder encodeObject:self.amount forKey:@"amount"];
    [coder encodeObject:self.date forKey:@"date"];
}


@end

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
     Accessing Collection Properties
     
     Key-value coding coompliant objects expose their to-many properties
     in the same way that they expose other properties. You can get or
     set a collection object just as you would any other object using
     valueForKey:and setValue:forKey: (or their key path equivalents).
     However, when you want to manipulate the content of these collections,
     it's usually most efficient to use the mutable proxy methods defined
     by the protocol.
     
     The protocol defines three different proxy methods for collection
     object access, each with a key and a key path variant:
     •  mutableArrayValueForKey: and mutableArrayValueForKeyPath:
     These return a proxy object that behaves like an NSMutableArray
     object.
     •  mutableSetValueForKey: and mutableSetValueForKeyPath:
     These return a proxy object that behaves like an NSMutableSet
     object.
     •  mutableOrderedSetValueForKey: and mutableOrderedSetValueForKeyPath:
     These return proxy object that behaves like an NSMutableOrderedSet
     object.
     
     When you operate on the proxy object, adding objects to, removing
     objects from, or replacing objects in it, the default implementation
     of the protocol modifies the underlying property accordingly. This
     is more efficent than obtaining a non-mutable collection object with
     valueForKey:, creating a modified one with altered content, and then
     storing it back to the object with a setValue:ForKey: messaeg. In
     many cases, it is also more efficient than working directly with a
     mutable property. These methods provide the additional benefit of
     maintaining key-value observing compliance for the objects held in
     the collection object.
     */
    
    
    /*
     Using Collection Operators
     
     When you send a key-value coding compliant object the valueForKeyPath:
     message, you can embed a collection operator in the key path. A
     collection operator is one of a small list of keywords preceded by
     an at sign (@) that specifies an operation that the getter should
     perform to manipulate the data in some way before returning it.
     The default implementation of valueForKeyPath: provided by NSObject
     implements this behavior.
     
     When a key path contains a collection operator, any portion of the
     key path preceding the operator, known as the left key path, indicates
     the collection on which to operate relative to the receiver of the
     message. If you send the message directly to a collection object,
     such as an NSArray instance, the left key path may be omitted.
     
     The portion of the key path after the operator, known as the right
     key path, specifies the property within the collection that the
     operator should work on. All the collection operators except @count
     require a right key path.
     
     Operator key path format
     KeypathToCollection.@collectionOperatr.keypathToProperty
     -------------------- ----------------- -----------------
     left key path       collectionOperator  Right key path
     
     Collection operators exhibit three basic types of behavior:
     •  Aggregation Operators coalesce a collection's objects in some
     way, and return a single object that generally matches the
     data type of the property named in the right key path.
     The @count operator is an exception -- it takes no right
     key path and always returns an NSNumber instance.
     •  Array Operators return an NSArray instance containing some
     subset of the objects held in the named collection.
     •  Nesting Operators work on collections that contain other
     collections, and return an NSArray or NSSet instance,
     depending on the operator, that combines the objects of
     the nested collections in some way.
     
     */
    
    Transaction *transaction = [Transaction new];
    
    //    NSNumber *transactionAverage = [transaction valueForKeyPath:@"@avg.amount"];
    //    NSNumber *numberOfTransactions = [transaction valueForKeyPath:@"@count"];
    
    
    /**
     Aggregation Operators
     
     Aggregation operators work on either an array or set of
     properties, producing a single value that reflects some aspect
     of the collection.
     
     @avg
     When you specify the @avg operator, valueForKeyPath: reads the
     property specified by the right key path for each element of
     the collection, converts it to a double (subtituting 0 for nil
     values), and computes the arithmetic average of these. It then
     returns the result stored in an NSNumber instance.
     
     To obtain the average transaction amount among the sample data:
     ================================================================
     NSNumber *transactionAverage = [self.transactions valueForKeyPath:
     @"@avg.amount"];
     ================================================================
     
     @count
     When you specify the @count operator, valueForKeyPath: returns
     the number of objects in the collection in an NSNumber instance.
     The right key path, if present, is ignored.
     
     To obtain the number of Transaction objects in transactions:
     ================================================================
     NSNumber *numberOfTransactions = [self.transactions valueForKeyPath:
     @"@count"];
     ================================================================
     
     The value of numberOfTransactions is 13.
     
     @max
     When you specify the @max operator, valueForKeyPath: searches
     among the collection entries named by the right key path and
     returns the largest one. The search conducts comparisons using
     the compare: method, as defined by many Foundation classes, such
     as the NSNumber class. Therefore, the property indicated by the
     right key path must hold an object that responds meaningfully
     to this message. The search ignores nil valued collection
     entries.
     
     To obtain the maximum of the date values, which is the date
     of the latest transaction, among the transactions listed in
     Table 4-1:
     ================================================================
     NSDate *latestDate = [self.transactions valueForKeyPath:
     @"@max.date"];
     ================================================================

     The formatted latestDate value is Jul 15, 2016.
     
     
     @min
     When you specify the @min operator, valueForKeyPath: searches
     among the collection entries named by the right key path and
     returns the smallest one. The search conducts comparisons using
     the compare: method, as defined by many Foundation classes,
     such as the NSNumber class. Therefore, the property indicated
     by the right key path must hold an object that responds
     meaningfully to this message. The search ignores nil valued
     collection entries.

     To obtain the minimum of the date values, which is the date
     of the earliest transaction, among the transactions listed
     in Table 4-1:
     ================================================================
     NSDate *earliestDate = [self.transactions valueForKeyPath:
     @"@min.date"];
     ================================================================

     The formatted earliestDate value is Dec 1, 2015.

     @sum
     When you specify the @sum operator, valueForKeyPath: reads
     the property specified by the right key path for each element
     of the collection, converts it to a double (substituting 0
     for nil values), and computes the sum of these. It then returns
     the result stored in an NSNumber instance.

     To obtain the sum of the transactions amount among the sample
     data in Table 4-1:
     ================================================================
     NSNumber *amountSum = [self.transactions valueForKeyPath:
     @"@sum.amount"];
     ================================================================

     The formatted result of amountSum is $5,935.00.

     */
    
    
    /**
     Array Operators
     
     The array operators cause valueForKeyPath: to return an array
     of objects corresponding to a particular set of the objects
     indicated by the right key path.

     ⚠️ The valueForKeyPath: method raises an exception if any
     of the leaf objects is nil when using array operators.

     @distinctUnionOfObjects
     When you specify the @distinctUnionOfObjects operator,
     valueForKeyPath: creates and returns an array containing
     the distinct objects of the collection corresponding to
     the property specified by the right key path.

     To obtain a collection of payee property values for the
     transactions in transactions with duplicate values omitted:
     ================================================================
     NSArray *distinctPayees = [self.transactions valueForKeyPath:
     @"@distinctUnionOfObjects.payee"];
     ================================================================

     The resulting distinctPayees array contains one instance each
     of the following strings: Car Loan, General Cable,
     Animal Hospital,Green Power, Mortgage.
     
     ⚠️ The @unionOfObjects operator provides similar behavior, but
     without removing duplicate objects.
     
     
     @unionOfObjects
     When you specify the @unionOfObjects operator, valueForKeyPath:
     creates and returns an array containing all the objects of the
     collection corresponding to property specified by the right key
     path. Unlike @distinctUnionOfObjects, duplicate objects are not
     removed.

     To obtain a collection of payee property values for the
     transactions in transactions:
     ================================================================
     NSArray *payees = [self.transactions valueForKeyPath:
     @"@unionOfObjects.payee"];
     ================================================================

     The resulting payees array contains the following strings:
     Green Power, Green Power, Green Power, Car Loan, Car Loan,
     Car Loan, General Cable, General Cable, General Cable,
     Mortgage, Mortgage, Mortgage, Animal Hospital. Note the
     duplicates.
     ⚠️ The @distinctUnionOfArrays operator is similar, but
     removes duplicate objects.

     
     Nesting Operators
     The nesting operators operate on nested collections, where
     each entry of the collection itself contains a collection.
     
     ⚠️ The valueForKeyPath: method raises an exception if
     any of the leaf objects is nil when using nesting operators.
     
     For the descriptions that follow, consider a second array
     of data called moreTransactions, populated with the data
     in Table 4-2, and collected together with the original
     transactions array (from the Sample Data section) into
     a nested array:
     ================================================================
     NSArray* moreTransactions = @[<# transaction data #>];
     NSArray* arrayOfArrays = @[self.transactions, moreTransactions];
     ================================================================
     
     
     @distinctUnionOfArrays
     When you specify the @distinctUnionOfArrays operator,
     valueForKeyPath: creates and returns an array containing
     the distinct objects of the combination of all the collections
     corresponding to the property specified by the right key path.

     To obtain the distinct values of the payee property among all
     the arrays in arrayOfArrays:
     ================================================================
     NSArray *collectedDistinctPayees = [arrayOfArrays
     valueForKeyPath:@"@distinctUnionOfArrays.payee"];
     ================================================================

     The resulting collectedDistinctPayees array contains the
     following values: Hobby Shop, Mortgage, Animal Hospital,
     Second Mortgage, Car Loan, General Cable - Cottage, General
     Cable, Green Power.
     
     ⚠️ The @unionOfArrays operator is similar, but does not remove
     duplicate objects.

     
     @unionOfArrays
     When you specify the @unionOfArrays operator, valueForKeyPath:
     creates and returns an array containing the all the objects of
     the combination of all the collections corresponding to the
     property specified by the right key path, without removing
     duplicates.

     To obtain the values of the payee property in all the arrays
     within arrayOfArrays:
     ================================================================
     NSArray *collectedPayees = [arrayOfArrays valueForKeyPath:
     @"@unionOfArrays.payee"];
     ================================================================

     ⚠️ The @distinctUnionOfArrays operator is similar, but removes
     duplicate objects.


     @distinctUnionOfSets
     When you specify the @distinctUnionOfSets operator, valueForKeyPath:
     creates and returns an NSSet object containing the distinct
     objects of the combination of all the collections corresponding
     to the property specified by the right key path.

     This operator behaves just like @distinctUnionOfArrays, except
     that it expects an NSSet instance containing NSSet instances
     of objects rather than an NSArray instance of NSArray instances.
     Also, it returns an NSSet instance. Assuming the example data
     had been stored in sets instead of arrays, the example call
     and results are the same as those shown for @distinctUnionOfArrays.

     */
    
    
    
    /*
     Represneting Non-Object Values
     
     The default implementation of the key-value coding protocol
     method provided by NSObject work with both object and non-object
     properties. The default implementation automatically translates
     between object parameters or returns values, and non-object
     properties. This allows the signatures of the key-based getters
     and setters to remain consistent even when the stored property
     is a scalar or a structure.
     
     ⚠️ Because all properties in Swift are objects, this section
     only apples to Objective-C properties.

     When you invoke one of the protocol's getters, such as
     valueForKey:, the default implementation determines the
     particular accessor method or instance variable that supplies
     the value for the specified key according to the rules
     describled in Accessor Search Patterns. If the returns value
     is not an object, the getter uses this value to initialize
     an NSNumber object (for scalars) or NSValue object ( for
     structures) and returns that instead.
     
     Similary, by default, setters like setValue:forKey: determine
     the data type required by a property's accessor or instance
     variable, given a particular key. If the data type is not an
     object, the setter first sends an appropriate <type>Value
     message to the incoming value object to extract the underlying
     data, and stores that instead.
     
     ⚠️ When you invoke one of the key-value coding protocol
     setters with a nil value for a non-object property, the
     setter has no obvious, general course of action to take.
     Therefore, it sends a setNilValueForKey: message to the
     object receiving the setter call. The default implementation
     of this method raises an NSInvalidArgumentException exception,
     but subclasses may override this behavior, as described in
     Handling Non-Object Values, for example to set a marker value,
     or provide a meaningful default.
     */
    
    /**
     Wrapping and Unwrapping Scalar Types
     
     Table 5-1 lists the scalar types that the default key-value
     coding implementation wraps using an NSNumber instance.
     For each data type, the table shows the creation method
     used to initialize an NSNumber from the underlying property
     value to supply a getter return value. It then shows the
     accessor method used to extract the value from the setter
     input parameter during a set operation.

     ⚠️ *In macOS, for historical reasons, BOOL is type defined
     as signed char, and KVC does not distinguish between these.
     As a result, you should not pass a string value such as
     @“true” or @“YES” to setValue:forKey: when the key is a
     BOOL. KVC will attempt to invoke charValue (because the
     BOOL is inherently a char), but NSString does not implement
     this method, which results in a runtime error. Instead,
     pass only an NSNumber object, such as @(1) or @(YES), as
     the value argument to setValue:forKey: when the key is a
     BOOL. This restriction does not apply in iOS, where BOOL
     is type defined as the native Boolean type bool and KVC
     invokes boolValue, which works for either an NSNumber
     object or a properly formatted NSString object.
     */
    
    /**
     Wrapping and Unwrapping Structures
     
     Table 5-2 shows the creation and accessor methods that
     the default accessors use for wrapping and unwrapping
     the common NSPoint, NSRange, NSRect, and NSSize structures.

     Automatic wrapping and unwrapping is not confined to NSPoint,
     NSRange, NSRect, and NSSize. Structure types (that is,
     types whose Objective-C type encoding strings start with
     {) can be wrapped in an NSValue object. For example,
     consider the structure and class interface declared in Listing 5-1.
     ==============================================================
     typedef struct {
         float x, y, z;
     } ThreeFloats;
      
     @interface MyClass
     @property (nonatomic) ThreeFloats threeFloats;
     @end
     ==============================================================
     
     Using an instance of this class called myClass, you obtain
     the threeFloats value with key-value coding:
     ==============================================================
     NSValue* result = [myClass valueForKey:@"threeFloats"];
     ==============================================================

     The default implementation of valueForKey: invokes the threeFloats
     getter, and then returns the result wrapped in an NSValue object.

     Similarly, you can set the threeFloats value using key-value coding:
     ==============================================================
     ThreeFloats floats = {1., 2., 3.};
     NSValue* value = [NSValue valueWithBytes:&floats objCType:@encode(ThreeFloats)];
     [myClass setValue:value forKey:@"threeFloats"];
     ==============================================================

     The default implementation unwraps the value with a getValue:
     message, and then invokes setThreeFloats: with the resulting
     structure.
     */
    
    
    /*
     Validating Properties
     
     The key-value coding protocol defines methods to support
     property validation. Just as you use key-based accessors
     to read and write properties of a key-value coding compliant
     object, you can also validate properties by key (or key path).
     When you call the validateValue:forKey:error: (or the
     validateValue:forKeyPath:error:) method, the default
     implementation of the protocol searches the object receiving
     the validation message (or the one at the end of the key
     path) for a method whose name matches the pattern
     validate<Key>:error:. If the object has no such method,
     the validation succeeds by default, and the default
     implementation returns YES. When a property-specific
     validation method exists, the default implementation
     returns the result of calling that method instead.
     
     ⚠️ You typically use the validation described here only
     in Objective-C. In Swift, property validation is more
     idiomatically handled by relying on compiler support for
     optionals and strong type checking, while using the
     built-in willSet and didSet property observers to test
     any run-time API contracts, as described in the Property
     Observers section of The Swift Programming Language (Swift 3).
     
     Because property-specific validation methods receive the value
     and error parameters by reference, validation has three possible outcomes:

     1. The validation method deems the value object valid and
     returns YES without altering the value or the error.

     2. The validation method deems the value object invalid,
     but chooses not to alter it. In this case, the method
     returns NO and sets the error reference (if provided by
     the caller) to an NSError object that indicates the reason
     for failure.

     3. The validation method deems the value object invalid,
     but creates a new, valid one as a replacement. In this
     case, the method returns YES while leaving the error object
     untouched. Before returning, the method modifies the value
     reference to point at the new value object. When it makes
     a modification, the method always creates a new object,
     rather than modifying the old one, even if the value
     object is mutable.
     ==============================================================
     Person* person = [[Person alloc] init];
     NSError* error;
     NSString* name = @"John";
     if (![person validateValue:&name forKey:@"name" error:&error]) {
         NSLog(@"%@",error);
     }
     ==============================================================

     */
    
    /**
     Automatic Validation
     
     In general, neither the key-value coding protocol nor its
     default implementation define any mechanism to perform
     validation automatically. Instead, you make use of the
     validation methods when appropriate for your app.

     Certain other Cocoa technologies do perform validation
     automatically in some circumstances. For example, Core
     Data automatically performs validation when the managed
     object context is saved (see Core Data Programming Guide).
     Also, in macOS, Cocoa bindings allow you to specify that
     validation should occur automatically (see Cocoa Bindings
     Programming Topics for more information).
     */
    
    
    /*
     Accessor Search Patterns
     
     The default implementation of the NSKeyValueCoding protocol
     provided by NSObject maps key-based accessor calls to an
     object's underlying properties using a clearly defined set
     of rules. These protocol methods use a key parameter to
     search their own object instance for accessors, instance
     variables, and related methods that follow certain naming
     conventions. Although you rarely modify this default search,
     it can be helpful to understand how it works, both for tracing
     the behavior of key-value coded objects, and for making you
     own objects complaint.
     
     ⚠️ The description in this section use <key> or <key> as a
     placeholder for the key string that appears as a parameter
     in one of the key-value coding protocol methods. Which is
     then used by that method as part of a secondary method call
     or variable name lookup. The mapped property name obeys the
     placeholder's case. For example, for the getters <key> and
     is<Key>, the property named hidden maps to hidden and isHidden.
     */
    
    /**
     Search Pattern for the Basic Getter
     
     The default implementation of valueForKey:, given a key
     parameter as input, carries out the following procedure,
     operating from within the class instance receiving the
     valueForKey: call.
     
     •  Search the instance for the first accessor method found
        with a name like get<key>, <key>, is<key>, or _<key>,
        in that order. If found, invoke it and proceed to step
        5 with the result. Otherwise proceed to the next step.
     •  If no simple accessor method is found, search the instance
        for methods whose names match the patterns countOf<Key>
        and objectIn<Key>AtIndex: (corresponding to the primitive
        methods defined by the NSArray class) and <key>AtIndexes:
        (corresponding to the primitive methods defined by the
        NSArray class).
        
        If the first of these and at least one of the other two
        is found, create a collection proxy object that responds
        to all NSArray methods and return that. Otherwise, proceed
        to step 3.
        
        The proxy object subsequently converts any NSArray
        messages it receives to some combination of countOf<key>,
        objectIn<Key>, objectIn<Key>AtIndex:, and<key>AtIndexes:
        messages to the key-value coding complaint object that
        created it. If the original object also implements an
        optional method with a name like get<Key>:range:, the
        proxy object uses that as well, when appropriate. In
        effect, the proxy object working together with the key
        -value coding compliant object allows the underlying
        property to behave as if it were an NSArray, even if
        it is not.
     •  If no simple accessor method or group of array access
        methods is found, look for a triple of methods named
        countOf<Key>, enumeratorOf<Key>, and memberOf<Key>:
        (corresponding to the primitive methods defined by the
        NSSet class).

        If all three methods are found, create a collection proxy
        object that responds to all NSSet methods and return that.
        Otherwise, proceed to step 4.

        This proxy object subsequently converts any NSSet message
        it receives into some combination of countOf<Key>,
        enumeratorOf<Key>, and memberOf<Key>: messages to the
        object that created it. In effect, the proxy object
        working together with the key-value coding compliant
        object allows the underlying property to behave as if
        it were an NSSet, even if it is not.
     •  If no simple accessor method or group of collection
        access methods is found, and if the receiver's class
        method accessInstanceVariablesDirectly returns YES,
        search for an instance variable named _<key>, _is<Key>,
        <key>, or is<Key>, in that order. If found, directly
        obtain the value of the instance variable and proceed
        to step 5. Otherwise, proceed to step 6.
     •  If the retrieved property value is an object pointer,
        simply return the result.

        If the value is a scalar type supported by NSNumber,
        store it in an NSNumber instance and return that.

        If the result is a scalar type not supported by NSNumber,
        convert to an NSValue object and return that.
     •  If all else fails, invoke valueForUndefinedKey:. This
        raises an exception by default, but a subclass of NSObject
        may provide key-specific behavior.
     */
    
    
    /**
     Search Pattern for the Basic Setter
     
     The default implementation of setValue:forKey:, given key
     and value parameters as input, attempts to set a property
     named key to value (or, for non-object properties, the
     unwrapped version of value, as described in Representing
     Non-Object Values) inside the object receiving the call,
     using the following procedure:

     1.Look for the first accessor named set<Key>: or _set<Key>,
     in that order. If found, invoke it with the input value
     (or unwrapped value, as needed) and finish.

     2.If no simple accessor is found, and if the class method
     accessInstanceVariablesDirectly returns YES, look for an
     instance variable with a name like _<key>, _is<Key>, <key>,
     or is<Key>, in that order. If found, set the variable
     directly with the input value (or unwrapped value) and
     finish.

     3.Upon finding no accessor or instance variable, invoke
     setValue:forUndefinedKey:. This raises an exception by
     default, but a subclass of NSObject may provide key-specific
     behavior.

     */
    
    
    /**
     Search Pattern for Mutable Arrays
     
     The default implementation of mutableArrayValueForKey:,
     given a key parameter as input, returns a mutable proxy array
     for a property named key inside the object receiving the
     accessor call, using the following procedure:
     
     1. Look for a pair of methods with names like insertObject:
     in<Key>AtIndex: and removeObjectFrom<Key>AtIndex: (corresponding
     to the NSMutableArray primitive methods insertObject:atIndex:
     and removeObjectAtIndex: respectively), or methods with names
     like insert<Key>:atIndexes: and remove<Key>AtIndexes:
     (corresponding to the NSMutableArrayinsertObjects:atIndexes:
     and removeObjectsAtIndexes: methods).

     If the object has at least one insertion method and at least
     one removal method, return a proxy object that responds
     to NSMutableArray messages by sending some combination of
     insertObject:in<Key>AtIndex:, removeObjectFrom<Key>AtIndex:,
     insert<Key>:atIndexes:, and remove<Key>AtIndexes: messages
     to the original receiver of mutableArrayValueForKey:.

     When the object receiving a mutableArrayValueForKey: message
     also implements an optional replace object method with a
     name like replaceObjectIn<Key>AtIndex:withObject: or
     replace<Key>AtIndexes:with<Key>:, the proxy object utilizes
     those as well when appropriate for best performance.
     
     2. If the object does not have the mutable array methods,
     look instead for an accessor method whose name matches
     the pattern set<Key>:. In this case, return a proxy object
     that responds to NSMutableArray messages by issuing a
     set<Key>: message to the original receiver of
     mutableArrayValueForKey:.
     
     ⚠️ The mechanism described in this step is much less efficient
     than that of the previous step, because it may involve
     repeatedly creating new collection objects instead of
     modifying an existing one. Therefore, you should generally
     avoid it when designing your own key-value coding compliant
     objects.
     
     3. If neither the mutable array methods, nor the accessor
     are found, and if the receiver's class responds YES to
     accessInstanceVariablesDirectly, search for an instance
     variable with a name like _<key> or <key>, in that order.

     If such an instance variable is found, return a proxy
     object that forwards each NSMutableArray message it
     receives to the instance variable's value, which typically
     is an instance of NSMutableArray or one of its subclasses.
     
     4. If all else fails, return a mutable collection proxy
     object that issues a setValue:forUndefinedKey: message
     to the original receiver of the mutableArrayValueForKey:
     message whenever it receives an NSMutableArray message.

     The default implementation of setValue:forUndefinedKey:
     raises an NSUndefinedKeyException, but subclasses may
     override this behavior.
     
     */
    
    
    /**
     Search Pattern for Mutable Ordered Sets

     The default implementation of mutableOrderedSetValueForKey:
     recognizes the same simple accessor methods and ordered
     set accessor methods as valueForKey: (see Default Search
     Pattern for the Basic Getter), and follows the same direct
     instance variable access policies, but always returns a
     mutable collection proxy object instead of the immutable
     collection that valueForKey: returns. In addition, it does
     the following:
     
     1. Search for methods with names like insertObject:
     in<Key>AtIndex: and removeObjectFrom<Key>AtIndex:
     (corresponding to the two most primitive methods
     defined by the NSMutableOrderedSet class), and also
     insert<Key>:atIndexes: and remove<Key>AtIndexes:
     (corresponding to insertObjects:atIndexes: and
     removeObjectsAtIndexes:).

     If at least one insertion method and at least one
     removal method are found, the returned proxy object
     sends some combination of insertObject:in<Key>AtIndex:,
     removeObjectFrom<Key>AtIndex:, insert<Key>:atIndexes:,
     and remove<Key>AtIndexes: messages to the original
     receiver of the mutableOrderedSetValueForKey: message
     when it receives NSMutableOrderedSet messages.

     The proxy object also makes use of methods with names
     like replaceObjectIn<Key>AtIndex:withObject: or
     replace<Key>AtIndexes:with<Key>: when they exist in
     the original object.
     
     2. If the mutable set methods are not found, search
     for an accessor method with a name like set<Key>:.
     In this case, the returned proxy object sends a set<Key>:
     message to the original receiver of
     mutableOrderedSetValueForKey: every time it receives
     a NSMutableOrderedSet message.
     
     ⚠️ The mechanism described in this step is much less
     efficient than that of the previous step, because it
     may involve repeatedly creating new collection objects
     instead of modifying an existing one. Therefore, you
     should generally avoid it when designing your own key-value
     coding compliant objects.
     
     3. If neither the mutable set messages nor the accessor
     are found, and if the receiver’s accessInstanceVariablesDirectly
     class method returns YES, search for an instance variable
     with a name like _<key> or <key>, in that order. If such
     an instance variable is found, the returned proxy object
     forwards any NSMutableOrderedSet messages it receives to
     the instance variable’s value, which is typically an
     instance of NSMutableOrderedSet or one of its subclasses.
     
     4. If all else fails, the returned proxy object sends
     a setValue:forUndefinedKey: message to the original
     receiver of mutableOrderedSetValueForKey: whenever it
     receives a mutable set message.

     The default implementation of setValue:forUndefinedKey:
     raises an NSUndefinedKeyException, but objects may
     override this behavior.
     */
    
    
    /**
     Search Pattern for Mutable Sets
     
     The default implementation of mutableSetValueForKey:,
     given a key parameter as input, returns a mutable proxy
     set for an array property named key inside the object
     receiving the accessor call, using the following procedure:

     1. Search for methods with names like add<Key>Object: and
     remove<Key>Object: (corresponding to the NSMutableSet
     primitive methods addObject: and removeObject: respectively)
     and also add<Key>: and remove<Key>: (corresponding to
     NSMutableSet methods unionSet: and minusSet:). If at least
     one addition method and at least one removal method are found,
     return a proxy object that sends some combination of
     add<Key>Object:, remove<Key>Object:, add<Key>:, and remove<Key>:
     messages to the original receiver of mutableSetValueForKey:
     for each NSMutableSet message it receives.

     The proxy object also makes use of the methods with a name
     like intersect<Key>: or set<Key>: for best performance,
     if they are available.
     
     2. If the receiver of the mutableSetValueForKey: call
     is a managed object, the search pattern does not continue
     as it would for non-managed objects. See Managed Object
     Accessor Methods in Core Data Programming Guide for more
     information.
     
     3. If the mutable set methods are not found, and if
     the object is not a managed object, search for an
     accessor method with a name like set<Key>:. If such a
     method is found, the returned proxy object sends a
     set<Key>: message to the original receiver of
     mutableSetValueForKey: for each NSMutableSet message
     it receives.
     
     ⚠️ The mechanism described in this step is much less
     efficient than that of the first step, because it may
     involve repeatedly creating new collection objects
     instead of modifying an existing one. Therefore, you
     should generally avoid it when designing your own
     key-value coding compliant objects.
     
     4. If the mutable set methods and the accessor method
     are not found, and if the accessInstanceVariablesDirectly
     class method returns YES, search for an instance variable
     with a name like _<key> or <key>, in that order. If such
     an instance variable is found, the proxy object forwards
     each NSMutableSet message it receives to the instance
     variable's value, which is typically an instance of
     NSMutableSet or one of its subclasses.
     
     5. If all else fails, the returned proxy object responds
     to any NSMutableSet message it receives by sending a
     setValue:forUndefinedKey: message to the original receiver
     of mutableSetValueForKey:.
     */
    
    
#pragma mark -- Adopting Key-Value Coding
    
    /*
     Achieving Basic Key-Value Coding Compliance
     
     When adopting key-value coding for an object, you rely on the
     default implementation of the NSKeyValueCoding protocol by having
     your object inherit from NSObject or one of its many subclasses.
     The default implementation, in turn, relies on you to define your
     object's instance variables (or ivars) and accessor methods following
     certain well-defined patterns, so that it can associate key strings
     with properties when it receives key-value coded messages, such as
     valueForKey: and setValue:forKey:.
     
     You often adhere to the standard patterns in Objective-C by simply
     declaring a property using a @property statement, and allowing the
     compiler to automatically synthesize the ivar and accessors. The
     compiler follows the expected patterns by default.
     
     ⚠️ In Swift, simply declaring a property in the usual way produces
     the appropriate accessors automatically, and you never interact
     directly with ivars. For more information about properties in Swift,
     read Properties in the The Swift Programming Language.
     
     If you do need to implement accessors or ivars manually in Objective-C,
     follow the guidelines in this section to maintain basic compliance.
     To provide additional functionality that enhances interaction with
     your object's collection properties in any language, implement the
     methods describled in Defining Collection Methods. To further enhance
     your object with key-value validation, implement the methods describled
     in Adding Validation.
     
     ⚠️ The default implementation of key-value coding works with a
     broader range of ivars and accessors than are describled here.
     If you have legacy code that uses other variable or accessor
     conventions, examine the search patterns in Accessor Search Patterns
     to determine if the default implementation can locate your
     object's properties.
     */
    
    
    /**
     Basic Getters
     
     To implement a getter that returns the value of a property,
     while perhaps doing addtional custom work, use a method named
     like the property, such as for the title string property:
     ========================================================
     - (NSString*)title
     {
        // Extra getter logic…
      
        return _title;
     }
     ========================================================
     
     For a property holding a Boolean value, you can alternatively
     use a method prefixed with is, such as for the hidden Boolean
     property:
     ========================================================
     - (BOOL)isHidden
     {
        // Extra getter logic…
      
        return _hidden;
     }
     ========================================================

     When the property is a scalar or a structure, the default
     implementation of key-value coding wraps the value in an
     object for use on the protocol method’s interface, as
     described in Representing Non-Object Values. You do not
     need to do anything special to support this behavior.
     */
    
    
    /**
     Basic Setters
     
     To implement a setter that stores the value of a
     property, use a method with the capitalized name of
     the property prefixed by the word set. For the hidden
     property:
     ========================================================
     - (void)setHidden:(BOOL)hidden
     {
         // Extra setter logic…
      
        _hidden = hidden;
     }
     ========================================================
     
     ⚠️ Never call the validation methods described in Validating
     Properties from inside a set<Key>: method.
     
     When a property is a non-object type, such as the Boolean
     hidden, the protocol’s default implementation detects the
     underlying data type, and unwraps the object value (an
     NSNumber instance in this case) that comes from
     setValue:forKey: before applying it to your setter,
     as described in Representing Non-Object Values. You do
     not need to handle this in the setter itself. However,
     if there is a possibility that a nil value might be
     written to your non-object property, you override
     setNilValueForKey: to handle this situation, as
     described in Handling Non-Object Values. An appropriate
     behavior for the hidden property might simply be to
     interpret nil as NO:
     ========================================================
     - (void)setNilValueForKey:(NSString *)key
     {
         if ([key isEqualToString:@"hidden"]) {
             [self setValue:@(NO) forKey:@”hidden”];
         } else {
             [super setNilValueForKey:key];
         }
     }
     ========================================================
     
     You provide the above method override, if appropriate,
     even when you allow the compiler to synthesize the setter.
     */
    
    /**
     Instance Variables
     
     When the default implementation of one of the key-value
     coding accessor methods can’t find a property’s
     accessor, it queries its class’s accessInstanceVariablesDirectly
     method to see if the class allows direct use of instance
     variables. By default, this class method returns YES,
     although you can override this method to return NO.

     If you do allow use of ivars, ensure that they are
     named in the usual way, using the property name prefixed
     by an underscore (_). Normally, the compiler does this
     for you when automatically synthesizing properties,
     but if you use an explicit @synthesize directive,
     you can enforce this naming yourself:
     ========================================================
     @synthesize title = _title;
     ========================================================

     In some cases, instead of using a @synthesize directive
     or allowing the compiler to automatically synthesize
     a property, you use a @dynamic directive to inform the
     compiler that you will provide getters and setters at
     runtime. You might do this to avoid automatically
     synthesizing a getter, so that you can provide collection
     accessors instead, as described in Defining Collection
     Methods. In this, case you declare the ivar yourself as
     part of the interface declaration:
     ========================================================
     @interface MyObject : NSObject {
         NSString* _title;
     }
      
     @property (nonatomic) NSString* title;
      
     @end
     ========================================================

     */
    
    /**
     Defining Collection Methods
     
     When you create accessors and ivars using standard naming
     conventions, as describled in Achieving Basic Key-Value
     Coding Compliance, the key-value coding protocol's default
     implementation can locate them in response to key-value
     coded messages. This is as true for collection objects
     representing to-many relationships as it is for other
     properties. However, if you implement the collection accessor
     methods instead of, or in addtion to, the basic accessors
     for a collection property, you can:
     •  Model to-many relationships with classes other than
        NSArray or NSSet. When you implement the collection methods
        in your object, the default implementation of the key-value
        getter returns a proxy object that calls these methods
        in response to subsequent NSArray or NSSet messages that
        it receives. The underlying property object need not be
        an NSArray or NSSet itself, because the proxy object
        provides the expected behavior using your collection
        methods.
     •  Achieve increased performance when mutating the contents
        of a to-many relationship. Instead of repeatedly creating
        new collection objects with the basic setter in response
        to every change, the protocol's default implementation uses
        your collection methods to mutate the underlying property in
        place.
     •  Provide key-value observing compliant access to the contents
        of your object's collection properties.
     
     You implement one of two categories of collection accessors,
     depending on whether you want the relationship to behave like
     an indexed, ordered collection (like an NSArray object) or an
     unordered, uniqued collection (like an NSSet object). In either
     case, you implement at least one set of methods to support read
     access to the property, and then add an additional set to enable
     mutation of the collection’s contents.


     The key-value coding protocol does not declare the methods
     described in this section. Instead, the default
     implementation of the protocol provided by NSObject looks
     for these methods in your key-value coding compliant object,
     as described in Accessor Search Patterns, and uses them to
     handle key-value coded messages that are part of the protocol.
     */
    
    /**
     Accessing Indexed Collections
     

     You add indexed accessor methods to provide a mechanism
     for counting, retrieving, adding, and replacing objects
     in an ordered relationship. The underlying object is often
     an instance of NSArray or NSMutableArray, but if you
     provide the collection accessors, you enable any object
     property for which you implement these methods to be
     manipulated as if it were an array.


     Indexed Collection Getters
     
     For a collection property that has no default getter,
     if you provide the following indexed collection getter
     methods, the default implementation of the protocol, in
     response to a valueForKey: message, returns a proxy object
     that behaves like an NSArray, but calls the following
     collection methods to do its work.

     ⚠️ In modern Objective-C, the compiler synthesizes a
     getter by default for each property, so the default
     implementation does not create a read only proxy that
     uses the methods in this section (note the accessor
     search order in Search Pattern for the Basic Getter).
     You can get around this by either not declaring a
     property (relying solely on an ivar), or by declaring
     a property as @dynamic, indicating that you plan to
     supply accessor behavior at runtime. Either way, the
     compiler will not supply a default getter, and the
     default implementation uses the methods below.
     
     •  countOf<Key>
        This method returns the number of objects in the
        to-many relationship as an NSUinteger, just like
        the NSArray primitive method count. In fact, when
        the underlying property is an NSArray, you use that
        method to provide a result.
     
        For example, for a to-many relationship representing
        a list of bank transactions and backed by an NSArray
        called transactions:
        =====================================================
        - (NSUInteger)countOfTransactions {
            return [self.transactions count];
        }
        =====================================================
     
     •  objectIn<Key>AtIndex: or <key>AtIndexes:
        The first returns the object at the specified index in
        the to-many relationship, while the second returns an array
        of objects at the indexes specified by the NSIndexSet parameter.
        These correspond to the NSArray methods objectAtIndex: and
        objectsAtIndexes:, respectively. You only need to implement
        one of these. The corresponding methods for the transactions
        array are:
        =====================================================

        - (id)objectInTransactionsAtIndex:(NSUInteger)index {
            return [self.transactions objectAtIndex:index];
        }
      
        - (NSArray *)transactionsAtIndexes:(NSIndexSet *)indexes {
            return [self.transactions objectsAtIndexes:indexes];
        }
        =====================================================
     
     •  get<Key>:range:
        This method is optional, but can result in improved
        performance. It returns the objects from the collection
        that fall within the specified range, and corresponds to
        the NSArray method getObjects:range:. The implementation
        for the transactions array is:
        =====================================================
        - (void)getTransactions:(Transaction * __unsafe_unretained *)buffer
                       range:(NSRange)inRange {
            [self.transactions getObjects:buffer range:inRange];
        }
        =====================================================
     
     
     Indexed Collection Mutators
     
     Supporting a mutable to-many relationship with indexed
     accessors requires implementing a different group of methods.
     When you provide these setter methods, the default
     implementation, in response to the mutableArrayValueForKey:
     message, returns a proxy object that behaves like an
     NSMutableArray object, but uses your object’s methods to
     do its work. This is generally more efficient than returning
     an NSMutableArray object directly. It also enables the
     contents of a to-many relationship to be key-value observing
     compliant.
     
     In order to make your object key-value coding compliant
     for a mutable ordered to-many relationship, implement
     the following methods:
     •  insertObject:in<Key>AtIndex: or insert<Key>:atIndexes:

        The first receives the object to insert and an NSUInteger
        that specifies the index where it should be inserted.
        The second inserts an array of objects into the collection
        at the indices specified by the passed NSIndexSet. These
        are analogous to the NSMutableArray methods insertObject:
        atIndex: and insertObjects:atIndexes:. Only one of these
        methods is required.
        
        For a transactions object declared as an NSMutableArray:
        =====================================================
        - (void)insertObject:(Transaction *)transaction
          inTransactionsAtIndex:(NSUInteger)index {
            [self.transactions insertObject:transaction atIndex:index];
        }
         
        - (void)insertTransactions:(NSArray *)transactionArray
                      atIndexes:(NSIndexSet *)indexes {
            [self.transactions insertObjects:transactionArray atIndexes:indexes];
        }
        =====================================================
     
     •  removeObjectFrom<Key>AtIndex: or remove<Key>AtIndexes:
        The first receives an NSUInteger value specifying the index
        of the object to be removed from the relationship. The second
        receives an NSIndexSet object specifying the indexes of the
        objects to be removed from the relationship. These methods
        correspond to the NSMutableArray methods removeObjectAtIndex:
        and removeObjectsAtIndexes: respectively. Only one of these
        methods is required.
     
        For the transactions object:
        ====================================================
        - (void)removeObjectFromTransactionsAtIndex:(NSUInteger)index {
            [self.transactions removeObjectAtIndex:index];
        }
        - (void)removeTransactionsAtIndexes:(NSIndexSet *)indexes {
            [self.transactions removeObjectsAtIndexes:indexes];
        }
        ====================================================

     •  replaceObjectIn<Key>AtIndex:withObject: or replace<Key>AtIndexes:with<Key>:
        
        These replacement accessors provide the proxy object with a
        means to replace an object in the collection directly, without
        having to successively remove one object and insert another.
        They correspond to the NSMutableArray methods
        replaceObjectAtIndex:withObject: and
        replaceObjectsAtIndexes:withObjects:.
        You optionally provide these methods when profiling of your
        app reveals performance issues.
        ====================================================
        - (void)replaceObjectInTransactionsAtIndex:(NSUInteger)index
                                     withObject:(id)anObject {
            [self.transactions replaceObjectAtIndex:index
                                      withObject:anObject];
        }
         
        - (void)replaceTransactionsAtIndexes:(NSIndexSet *)indexes
                            withTransactions:(NSArray *)transactionArray {
            [self.transactions replaceObjectsAtIndexes:indexes
                                        withObjects:transactionArray];
        }
        ====================================================
    */
    
    /*
     Accessing Unordered Collections
     
     You add unordered collection accessor methods to provide
     a mechanism for accessing and mutating objects in an unordered
     relationship. Typically, this relationship is an instance of
     an NSSet or NSMutableSet object. However, when you implement
     these accessors, you enable any class to model the relationship
     and be manipulated using key-value coding just as if it were
     an instance of NSSet.
     
     Unordered Collection Getters
     
     When you provide the following collection getter methods
     to return the number of objects in the collection, iterate 
     over the collection objects, and test if an object is already
     present in the collection, the default implementation of the
     protocol, in response to a valueForKey: message, returns a
     proxy object that behaves like an NSSet, but calls the
     following collection methods to do its work.

     ⚠️ In modern Objective-C, the compiler synthesizes a getter
        by default for each property, so the default implementation
        does not create a read only proxy that uses the methods in
        this section (note the accessor search order in Search
        Pattern for the Basic Getter). You can get around this by
        either not declaring a property (relying solely on an ivar),
        or by declaring a property as @dynamic, indicating that you
        plan to supply accessor behavior at runtime. Either way, the
        compiler will not supply a default getter, and the default
        implementation uses the methods below.
     
     •  countOf<Key>
     
        This required method returns the number of items in the
        relationship, corresponding to the NSSet method count.
        When the underlying object is an NSSet, you call on this
        method directly. For example, for an NSSet object called
        employees containing Employee objects:
        ========================================================
        - (NSUInteger)countOfEmployees {
            return [self.employees count];
        }
        ========================================================
     
     •  enumeratorOf<Key>
        This required method returns an NSEnumerator instance
        that is used to iterate over the items in the relationship.
        See Enumeration: Traversing a Collection’s Elements in
        Collections Programming Topics for more information about
        enumerators. The method corresponds to the NSSet method
        objectEnumerator. For the employees set:
        ========================================================
        - (NSEnumerator *)enumeratorOfEmployees {
            return [self.employees objectEnumerator];
        }
        ========================================================
        
     •  memberOf<Key>:.
        This method compares the object passed as a parameter
        with the contents of the collection and returns the matching
        object as a result, or nil if no matching object is found.
        If you implement comparisons manually, you typically use
        isEqual: to compare the objects. When the underlying object
        is an NSSet object, you can use the equivalent member: method:
        ========================================================
        - (Employee *)memberOfEmployees:(Employee *)anObject {
            return [self.employees member:anObject];
        }
        ========================================================

     Unordered Collection Mutators
     
     Supporting a mutable to-many relationship with unordered
     accessors requires implementing additional methods. Implement
     the mutable unordered accessors to allow your object to supply
     an unordered set proxy object in response to the
     mutableSetValueForKey: method. Implementing these accessors
     is much more efficient than relying on an accessor that returns
     a mutable object directly for making changes to the data in the
     relationship. It also makes your class key-value observing
     compliant for the collected objects.
     
     In order to be key-value coding complaint for a mutable unordered
     to-many relationship implement the following methods:
     
     •  add<Key>Object: or add<Key>:
        These methods add a single item or a set of items to the
        relationship. When adding a set of items to the relationship,
        ensure that an equivalent object is not already present in the
        relationship. These are analogous to the NSMutableSet methods
        addObject: and unionSet:. Only one of these methods is required.
        For the employees set:
     ===========================================================
     - (void)addEmployeesObject:(Employee *)anObject {
         [self.employees addObject:anObject];
     }
      
     - (void)addEmployees:(NSSet *)manyObjects {
         [self.employees unionSet:manyObjects];
     }
     ===========================================================
     
     •  remove<Key>Object: or remove<Key>:
        These methods remove a single item or a set of items from
        the relationship. They are analogous to the NSMutableSet
        methods removeObject: and minusSet:. Only one of these
        methods is required. For example:
     ===========================================================
     - (void)removeEmployeesObject:(Employee *)anObject {
         [self.employees removeObject:anObject];
     }
      
     - (void)removeEmployees:(NSSet *)manyObjects {
         [self.employees minusSet:manyObjects];
     }
     ===========================================================
     
     •  intersect<Key>:
     This method, which receives an NSSet parameter, removes from
     the relationship all the objects that aren’t common to both
     the input set and the collection set. This is the equivalent
     of the NSMutableSet method intersectSet:. You optionally
     implement this method when profiling indicates performance
     issues surrounding updates to the collection content.
     For example:
     ===========================================================
     - (void)intersectEmployees:(NSSet *)otherObjects {
         return [self.employees intersectSet:otherObjects];
     }
     ===========================================================
     
     */
    
    Class class = objc_getClass("Transaction");
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList(class, &outCount);
    for (int i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        printf("%s %s\n",property_getName(property), property_getAttributes(property));
    }
    
    
    
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
