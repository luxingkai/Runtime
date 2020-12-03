//
//  AssociativeReferences.m
//  Runtime
//
//  Created by tigerfly on 2020/12/3.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "AssociativeReferences.h"

@interface AssociativeReferences ()

@end

@implementation AssociativeReferences

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Associative references, available starting in OS X v10.6,
     simulate the addition of object instance variables to an
     existing class. Using associative references, you can add
     storage to an object without modifying the class declaration.
     This may be useful if you do not have access to the source
     code for the class, or if for binary-compatibility reasons
     you cannot alter the layout of the object.

     Associations are based on a key. For any object you can
     add as many associations as you want, each using a different
     key. An association can also ensure that the associated
     object remains valid for at least the lifetime of the
     source object.
     */
    

#pragma mark -- Creating Associations

    /**
     You use the Objective-C runtime function
     objc_setAssociatedObject to make an association
     between one object and another. The function takes
     four parameters: the source object, a key, the value,
     and an association policy constant. Of these, the key
     and the association policy merit further discussion.
     
     •  The key is a void pointer. The key for each association
        must be unique. A typical pattern is to use a static variable.
     •  The policy specifies whether the associated object is assigned,
        retained, or copied, and whether the association is be made
        atomically or non-atomically. This pattern is similar to that
        of the attributes of a declared property (see Property
        Declaration Attributes). You specify the policy for the
        relationship using a constant (see objc_AssociationPolicy
        and Associative Object Behaviors).
     
     Listing 6-1 shows how you can establish an association between
     an array and a string.
     ==============================================
     static char overviewKey;
      
     NSArray *array =
         [[NSArray alloc] initWithObjects:@"One", @"Two", @"Three", nil];
     // For the purposes of illustration, use initWithFormat: to ensure
     // the string can be deallocated
     NSString *overview =
         [[NSString alloc] initWithFormat:@"%@", @"First three numbers"];
      
     objc_setAssociatedObject (
         array,
         &overviewKey,
         overview,
         OBJC_ASSOCIATION_RETAIN
     );
      
     [overview release];
     // (1) overview valid
     [array release];
     // (2) overview invalid
     ==============================================
     
     At point 1, the string overview is still valid because
     the OBJC_ASSOCIATION_RETAIN policy specifies that the
     array retains the associated object. When the array is
     deallocated, however (at point 2), overview is released
     and so in this case also deallocated. If you try to,
     for example, log the value of overview, you generate
     a runtime exception.
     */
    
    
#pragma mark -- Retrieving Associated Objects

    /**
     You retrieve an associated object using the Objective-C
     runtime function objc_getAssociatedObject. Continuing
     the example shown in Listing 6-1, you could retrieve
     the overview from the array using the following line of
     code:
     ==============================================
     NSString *associatedObject =
     (NSString *)objc_getAssociatedObject(array, &overviewKey);
     ==============================================
     
     */
    
#pragma mark -- Breaking Associations

    /**
     
     To break an association, you typically call
     objc_setAssociatedObject, passing nil as the value.

     Continuing the example shown in Listing 6-1,
     you could break the association between the array
     and the string overview using the following line of code:
     ==============================================
     objc_setAssociatedObject(array, &overviewKey, nil, OBJC_ASSOCIATION_ASSIGN);
     ==============================================
     
     Given that the associated object is being set to nil,
     the policy isn’t actually important.

     To break all associations for an object, you can call
     objc_removeAssociatedObjects. In general, however, you
     are discouraged from using this function because it breaks
     all associations for all clients. Use this function only if
     you need to restore an object to “pristine condition.”
     */
    

#pragma mark -- Complete Example

    /**
     The following program combines code from the preceding sections.
     ==============================================
     #import <Foundation/Foundation.h>
     #import <objc/runtime.h>
      
     int main (int argc, const char * argv[]) {
      
         @autoreleasepool {
             static char overviewKey;
      
             NSArray *array = [[NSArray alloc]
                 initWithObjects:@ "One", @"Two", @"Three", nil];
             // For the purposes of illustration, use initWithFormat: to ensure
             // we get a deallocatable string
             NSString *overview = [[NSString alloc]
                 initWithFormat:@"%@", @"First three numbers"];
      
             objc_setAssociatedObject (
                 array,
                 &overviewKey,
                 overview,
                 OBJC_ASSOCIATION_RETAIN
             );
             [overview release];
      
             NSString *associatedObject =
                 (NSString *) objc_getAssociatedObject (array, &overviewKey);
             NSLog(@"associatedObject: %@", associatedObject);
      
             objc_setAssociatedObject (
                 array,
                 &overviewKey,
                 nil,
                 OBJC_ASSOCIATION_ASSIGN
             );
             [array release];
      
         }
         return 0;
     }
     ==============================================
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
