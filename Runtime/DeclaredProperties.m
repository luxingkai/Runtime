//
//  DeclaredProperties.m
//  Runtime
//
//  Created by tigerfly on 2020/11/16.
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
     When the compiler encounters property declarations (see
     Declared Properties in The Objective-C Programming Language)
     , it generates descriptive metadata that is associated with
     the enclosing class, category or protocol. You can access
     this metadata using functions that support looking up a property
     by name on a class or protocol, obtaining the type of a
     property as an @encode string, and copying a list of a
     property's attributes as an array of C strings. A list of
     declared properties is available for each class and protocol.
     */
    
    
    /**
     Property Type and Functions
     
     The Property structure defines an opaque handle to a property descriptor.
     ----------------------------------------------------
     typedef struct objc_property *Property;
     ----------------------------------------------------

     You can use the functions class_copyPropertyList and
     protocol_copyPropertyList to retrieve an array of the
     properties associated with a class (including loaded
     categories) and a protocol respectively:
     ----------------------------------------------------
     objc_property_t *class_copyPropertyList(Class cls, unsigned int *outCount)
     objc_property_t *protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
     ----------------------------------------------------

     For example, given the following class declaration:

     @interface Lender : NSObject {
         float alone;
     }
     @property float alone;
     @end
     
     you can get the list of properties using:
     ----------------------------------------------------
     id LenderClass = objc_getClass("Lender");
     unsigned int outCount;
     objc_property_t *properties = class_copyPropertyList(LenderClass, &outCount);
     ----------------------------------------------------
     
     You can use the property_getName function to discover the name of a property:
     ----------------------------------------------------
     const char *property_getName(objc_property_t property)
     ----------------------------------------------------
     
     You can use the functions class_getProperty and protocol_getProperty
     to get a reference to a property with a given name in a class and
     protocol respectively:
     ----------------------------------------------------
     objc_property_t class_getProperty(Class cls, const char *name)
     objc_property_t protocol_getProperty(Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty)
     ----------------------------------------------------

     You can use the property_getAttributes function to discover
     the name and the @encode type string of a property. For
     details of the encoding type strings, see Type Encodings;
     for details of this string, see Property Type String and
     Property Attribute Description Examples.
     ----------------------------------------------------
     const char *property_getAttributes(objc_property_t property)
     ----------------------------------------------------
     Putting these together, you can print a list of all the
     properties associated with a class using the following code:
     ----------------------------------------------------
     id LenderClass = objc_getClass("Lender");
     unsigned int outCount, i;
     objc_property_t *properties = class_copyPropertyList(LenderClass, &outCount);
     for (i = 0; i < outCount; i++) {
         objc_property_t property = properties[i];
         fprintf(stdout, "%s %s\n", property_getName(property),
     property_getAttributes(property));
     }
     ----------------------------------------------------
     
     */
    
    /**
     Property Type String
     
     You can use the property_getAttributes function to discover
     the name, the @encode type string of a property, and other
     attributes of the property.

     The string starts with a T followed by the @encode type
     and a comma, and finishes with a V followed by the name
     of the backing instance variable. Between these, the
     attributes are specified by the following descriptors,
     separated by commas:

     file:///Users/tigerfly/Desktop/Runtime/Runtime/propertyTypeEncoding.png
     
     */
    
    /**
     Property Attribute Description Examples
     
     Given these definitions:

     enum FooManChu { FOO, MAN, CHU };
     struct YorkshireTeaStruct { int pot; char lady; };
     typedef struct YorkshireTeaStruct YorkshireTeaStructType;
     union MoneyUnion { float alone; double down; };
     
     the following table shows sample property declarations and
     the corresponding string returned by property_getAttributes:

     file:///Users/tigerfly/Desktop/Runtime/Runtime/PropertyAttributeDescriptionExamples.png

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
