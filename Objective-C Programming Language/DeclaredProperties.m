//
//  DeclaredProperties.m
//  Runtime
//
//  Created by tigerfly on 2020/12/3.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "DeclaredProperties.h"

@interface DeclaredProperties ()

@end

@implementation DeclaredProperties

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     The Objective-C declared properties feature provides a simple
     way to declare and implement an object's accessor methods.
     
     You typically access an object's properties(in the sense
     of its attributes and relationships) through a pair of
     accessor(getter/setter) methods. By using accessor methods,
     you adhere to the principle of encapsulation (See Mechanism
     Of Abstraction in Object-Oriented Programming with Objective-C).
     You can exercise tight cotrol of the behavior of the getter/
     setter pair and the underlying state management while clients
     of the API remain insulated from the implementation changes.
     
     Although using accessor methods therefore has significant
     advantagese, writing accessor methods is a tedious process.
     Moreover, aspects of the property that may be important to
     consumers of the API are left obscured -- such as whether
     the accessor methods are thread-safe or whether new values are
     copied when set.
     
     Declared properties address these issues by providing the
     following features:
     •  The property declaration provides a clear, explicit specification
        of how the accessor methods behave.
     •  The compiler can synthesize accessor methods for you,
        according to the specification you provide in the declaration.
     •  Properties are represented syntactically as identifiers
        and are scoped, so the compiler can detect use of undeclared
        properties.
     */
    
    
#pragma mark -- Property Declaration and Implementation

    /*
     There are two parts to a declared property, its declaration
     and its implementation.
     */
    
    /**
     Property Declaration

     A property declaration begins with the keyword @property.
     @property can appear anywhere in the method declaration list
     found in the @interface block of a class. @property can also
     appear in the declaration of a protocol or category.
     =======================================================
     @property (attributes) type name;
     =======================================================
     
     The @property directive declares a property. An optional
     parenthesized set of attributes provides additional details
     about the storage semantics and other behaviors of the
     property—see Property Declaration Attributes for possible
     values. Like any other Objective-C type, each property
     has a type specification and a name.

     Listing 4-1 illustrates the declaration of a simple property.
     =======================================================
     @interface MyClass : NSObject
     @property float value;
     @end
     =======================================================
     
     You can think of a property declaration as being equivalent
     to declaring two accessor methods. Thus
     =======================================================
     @property float value;
     =======================================================
     
     is equivalent to:
     =======================================================
     - (float)value;
     - (void)setValue:(float)newValue;
     =======================================================

     A property declaration, however, provides additional
     information about how the accessor methods are implemented
     (as described in Property Declaration Attributes).

     You can also put property declarations in class extensions
     (see Extensions). For example, you could declare the value
     property shown previously as follows:
     =======================================================
     @interface MyClass : NSObject
     @end
      
     @interface MyClass ()
     @property float value;
     @end
     =======================================================
     This is useful if you want to hide the declaration of private
     properties.
     */
        
    
    /**
     Property Declaration Attributes

     You can decorate a property with attributes by using the
     form @property(attribute [, attribute2, ...]). Like methods,
     properties are scoped to their enclosing interface declaration.
     For property declarations that use a comma-delimited list of
     variable names, the property attributes apply to all of the
     named properties.

     If you use the @synthesize directive to tell the compiler to
     create the accessor methods (see Property Implementation
     Directives), the code it generates matches the specification
     given by the keywords. If you implement the accessor methods
     yourself, you should ensure that it matches the specification
     (for example, if you specify copy you must make sure that you
     do copy the input value in the setter method).
     
     === Accessor Method Names ===
     The default names for the getter and setter methods
     associated with a property are propertyName and
     setPropertyName: respectively—for example, given a
     property “foo”, the accessors would be foo and setFoo:.
     The following attributes allow you to specify custom names
     instead. They are both optional and can appear with any
     other attribute (except for readonly in the case of setter=).

     getter=getterName
     Specifies the name of the get accessor for the property.
     The getter must return a type matching the property’s type
     and take no parameters.

     setter=setterName
     Specifies the name of the set accessor for the property.
     The setter method must take a single parameter of a type
     matching the property’s type and must return void.

     If you specify that a property is readonly and also specify
     a setter with setter=, you get a compiler warning.

     Typically you should specify accessor method names that
     are key-value coding compliant (see Key-Value Coding
     Programming Guide)—a common reason for using the getter
     decorator is to adhere to the isPropertyName convention
     for Boolean values.

     
     === Writability ===
     These attributes specify whether or not a property has
     an associated set accessor. They are mutually exclusive.

     readwrite
     Indicates that the property should be treated as read/write.
     This attribute is the default.

     Both a getter and setter method are required in the
     @implementation block. If you use the @synthesize directive
     in the implementation block, the getter and setter methods
     are synthesized.

     readonly
     Indicates that the property is read-only.

     If you specify readonly, only a getter method is required in
     the @implementation block. If you use the @synthesize
     directive in the implementation block, only the getter
     method is synthesized. Moreover, if you attempt to assign
     a value using the dot syntax, you get a compiler error.

     
     === Setter Semantics ===
     These attributes specify the semantics of a set accessor.
     They are mutually exclusive.

     strong
     Specifies that there is a strong (owning) relationship
     to the destination object.

     weak
     Specifies that there is a weak (non-owning) relationship
     to the destination object.

     If the destination object is deallocated, the property
     value is automatically set to nil.

     (Weak properties are not supported on OS X v10.6 and
     iOS 4; use assign instead.)

     copy
     Specifies that a copy of the object should be used for
     assignment.

     The previous value is sent a release message.

     The copy is made by invoking the copy method. This
     attribute is valid only for object types, which must
     implement the NSCopying  protocol.

     assign
     Specifies that the setter uses simple assignment.
     This attribute is the default.

     You use this attribute for scalar types such as
     NSInteger and CGRect.

     retain
     Specifies that retain should be invoked on the object
     upon assignment.

     The previous value is sent a release message.

     In OS X v10.6 and later, you can use the __attribute__
     keyword to specify that a Core Foundation property should
     be treated like an Objective-C object for memory management:

     @property(retain) __attribute__((NSObject)) CFDictionaryRef myDictionary;

     
     === Atomicity ===
     You can use this attribute to specify that accessor methods
     are not atomic.

     nonatomic
     Specifies that accessors are nonatomic. By default, accessors
     are atomic.

     Properties are atomic by default so that synthesized accessors
     provide robust access to properties in a multithreaded
     environment—that is, the value returned from the getter or
     set via the setter is always fully retrieved or set regardless
     of what other threads are executing concurrently.

     If you specify strong, copy, or retain and do not specify
     nonatomic, then in a reference-counted environment, a
     synthesized get accessor for an object property uses a lock
     and retains and autoreleases the returned value—the implementation
     will be similar to the following:
     ======================================================
     [_internal lock]; // lock using an object-level lock
     id result = [[value retain] autorelease];
     [_internal unlock];
     return result;
     ======================================================
     
     If you specify nonatomic, a synthesized accessor for an
     object property simply returns the value directly.
     
     
     === Markup and Deprecation ===
     Properties support the full range of C-style decorators.
     Properties can be deprecated and support __attribute__
     style markup:
     
     ======================================================
     @property CGFloat x
     AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_4;
     @property CGFloat y __attribute__((...));
     ======================================================
     
     If you want to specify that a property is an outlet (see
     outlet in iOS, and outlet in OS X), you use the IBOutlet
     identifier:
     ======================================================
     @property (nonatomic, weak) IBOutlet NSButton *myButton;
     ======================================================

     IBOutlet is not, though, a formal part of the list of
     attributes. For more about declaring outlet properties,
     see Nib Files.
     */
    
    
    /**
     Property Implementation Directives

     You can use the @synthesize and @dynamic directives
     in @implementation blocks to trigger specific compiler
     actions. Note that neither is required for any given
     @property declaration.
     
     ⚠️ If you do not specify either @synthesize or @dynamic
     for a particular property, you must provide a getter and
     setter (or just a getter in the case of a readonly property)
     method implementation for that property. If you do not,
     the compiler generates a warning.

     ====== @synthesize ========
     You use the @synthesize directive to tell the compiler that
     it should synthesize the setter and/or getter methods for
     a property if you do not supply them within the
     @implementation block. The @synthesize directive also
     synthesizes an appropriate instance variable if it is not
     otherwise declared.
     
     Listing 4-2  Using @synthesize
     ======================================================
     @interface MyClass : NSObject
     @property(copy, readwrite) NSString *value;
     @end
      
     @implementation MyClass
     @synthesize value;
     @end
     ======================================================

     You can use the form property=ivar to indicate that a
     particular instance variable should be used for the
     property, for example:
     ======================================================
     @synthesize firstName, lastName, age=yearsOld;
     ======================================================
     
     This specifies that the accessor methods for firstName,
     lastName, and age should be synthesized and that the
     property age is represented by the instance variable
     yearsOld. Other aspects of the synthesized methods are
     determined by the optional attributes (see Property
     Declaration Attributes).

     Whether or not you specify the name of the instance
     variable, the @synthesize directive can use an instance
     variable only from the current class, not a superclass.
     
     There are differences in the behavior of accessor synthesis
     that depend on the runtime (see also Runtime Difference):
     
     •  For the legacy runtime, instance variables must already
        be declared in the @interface block of the current class.
        If an instance variable of the same name as the property
        exists, and if its type is compatible with the property's
        type, it is used -- otherwise, you get a compiler error.
     •  For the modern runtime, instance variables are synthesized
        as needed. If an instance variable of the same name already
        exists, it is used.
     
     ====== @dynamic ======
     You use the @dynamic keyword to tell the compiler that
     you will fulfill the API contract implied by a property
     either by providing method implementations directly or
     at runtime using other mechanisms such as dynamic loading
     of code or dynamic method resolution. It suppresses the
     warnings that the compiler would otherwise generate if
     it can’t find suitable implementations. You should use
     it only if you know that the methods will be available
     at runtime.

     The example shown in Listing 4-3 illustrates using
     @dynamic with a subclass of NSManagedObject.
     ======================================================
     Listing 4-3  Using @dynamic with NSManagedObject

     @interface MyClass : NSManagedObject
     @property(nonatomic, retain) NSString *value;
     @end
      
     @implementation MyClass
     @dynamic value;
     @end
     ======================================================
     
     NSManagedObject is provided by the Core Data framework.
     A managed object class has a corresponding schema that
     defines attributes and relationships for the class; at
     runtime, the Core Data framework generates accessor methods
     for these as necessary. You therefore typically declare
     properties for the attributes and relationships, but you
     don’t have to implement the accessor methods yourself and
     shouldn’t ask the compiler to do so. If you just declared
     the property without providing any implementation, however,
     the compiler would generate a warning. Using @dynamic
     suppresses the warning.
     */
    
    
#pragma mark -- Using Properties
    
    /**
     Supported Types
     
     You can declare a property for any Objective-C class,
     Core Foundation data type, or “plain old data” (POD)
     type (see C++ Language Note: POD Types). For constraints
     on using Core Foundation types, however, see Core Foundation.
     */
    
    /**
     Property Redeclaration
     
     You can redeclare a property in a subclass, but
     (with the exception of readonly versus readwrite)
     you must repeat its attributes in whole in the
     subclasses. The same holds true for a property
     declared in a category or protocol—while the property
     may be redeclared in a category or protocol, the
     property’s attributes must be repeated in whole.

     If you declare a property in one class as readonly,
     you can redeclare it as readwrite in a class
     extension (see Extensions), in a protocol, or in
     a subclass (see Subclassing with Properties). In
     the case of a class extension redeclaration, the
     fact that the property was redeclared prior to any
     @synthesize statement causes the setter to be
     synthesized. The ability to redeclare a read-only
     property as read/write enables two common implementation
     patterns: a mutable subclass of an immutable class
     (NSString, NSArray, and NSDictionary are all examples)
     and a property that has a public API that is readonly
     but a private readwrite implementation internal to the
     class. The following example shows using a class
     extension to provide a property that is declared as
     read-only in the public header but is redeclared
     privately as read/write.
     ======================================================
     // public header file
     @interface MyObject : NSObject
     @property (readonly, copy) NSString *language;
     @end
      
     // private implementation file
     @interface MyObject ()
     @property (readwrite, copy) NSString *language;
     @end
      
     @implementation MyObject
     @synthesize language;
     @end
     ======================================================
     */
    
    /**
     Core Foundation

     As noted in Property Declaration Attributes,
     prior to OS X v10.6 you cannot specify the retain
     attribute for non-object types. If, therefore, you
     declare a property whose type is a CFType and synthesize
     the accessors as illustrated in the following example:
     ======================================================
     @interface MyClass : NSObject
     @property(readwrite) CGImageRef myImage;
     @end
      
     @implementation MyClass
     @synthesize myImage;
     @end
     ======================================================
     
     then in a reference-counted environment, the synthesized
     set accessor simply assigns the new value to the instance
     variable (the new value is not retained and the old value
     is not released). Simple assignment is typically incorrect
     for Core Foundation objects; you should not synthesize
     the methods but rather implement them yourself.
     */
    
    
#pragma mark -- Subclassing with Properties

    /**
     You can override a readonly property to make it writable.
     For example, you could define a class MyInteger with a
     readonly property, value:
     ======================================================
     @interface MyInteger : NSObject
     @property(readonly) NSInteger value;
     @end
      
     @implementation MyInteger
     @synthesize value;
     @end
     ======================================================
     
     You could then implement a subclass, MyMutableInteger,
     which redefines the property to make it writable:
     ======================================================
     @interface MyMutableInteger : MyInteger
     @property(readwrite) NSInteger value;
     @end
      
     @implementation MyMutableInteger
     @dynamic value;
      
     - (void)setValue:(NSInteger)newX {
         value = newX;
     }
     @end
     ======================================================
     */
    
    
#pragma mark -- Runtime Difference

    /**
     In general the behavior of properties is identical
     on both modern and legacy runtimes (see Runtime
     Versions and Platforms in Objective-C Runtime
     Programming Guide). There is one key difference:
     the modern runtime supports instance variable synthesis
     whereas the legacy runtime does not.

     For @synthesize to work in the legacy runtime, you
     must either provide an instance variable with the
     same name and compatible type of the property or
     specify another existing instance variable in the
     @synthesize statement. With the modern runtime, if
     you do not provide an instance variable, the compiler
     adds one for you. For example, given the following
     class declaration and implementation:
     ======================================================
     @interface MyClass : NSObject
     @property float noDeclaredIvar;
     @end
      
     @implementation MyClass
     @synthesize noDeclaredIvar;
     @end
     ======================================================

     the compiler for the legacy runtime would generate an
     error at @synthesize noDeclaredIvar; whereas the
     compiler for the modern runtime would add an instance
     variable to represent noDeclaredIvar.
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
