//
//  ObjectAllocation.m
//  Runtime
//
//  Created by tigerfly on 2020/12/6.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "ObjectAllocation.h"

@interface ObjectAllocation ()

@end

@implementation ObjectAllocation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     When you allocate an object, part of what happens is
     what you might except, given the term. Cocoa allocates
     enough memory for the object from a region of application
     virtual memory. To calculate how much memory to allocate,
     it takes the object's instance variables into account --
     including their types and order -- as specified by the
     object's class.
     
     To allocate an object, you send the message alloc or
     allocWithZone: to the object’s class. In return, you
     get a “raw” (uninitialized) instance of the class. The
     alloc variant of the method uses the application’s
     default zone. A zone is a page-aligned area of memory
     for holding related objects and data allocated by an
     application. See Advanced Memory Management Programming
     Guide for more information on zones.

     An allocation message does other important things
     besides allocating memory:
     •  It sets the object’s retain count to one.
     •  It initializes the object’s isainstance variable
        to point to the object’s class, a runtime object
        in its own right that is compiled from the class
        definition.
     •  It initializes all other instance variables to
        zero (or to the equivalent type for zero, such as
        nil, NULL, and 0.0).

     An object’s isa instance variable is inherited from
     NSObject, so it is common to all Cocoa objects. After
     allocation sets isa to the object’s class, the object
     is integrated into the runtime’s view of the inheritance
     hierarchy and the current network of objects (class
     and instance) that constitute a program. Consequently
     an object can find whatever information it needs at
     runtime, such as another object’s place in the
     inheritance hierarchy, the protocols that other objects
     conform to, and the location of the method implementations
     it can perform in response to messages.

     In summary, allocation not only allocates memory for
     an object but initializes two small but very important
     attributes of any object: its isa instance variable
     and its retain count. It also sets all remaining
     instance variables to zero. But the resulting object
     is not yet usable. Initializing methods such as init
     must yet initialize objects with their particular
     characteristics and return a functional object.
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
