//
//  Outlets.m
//  Runtime
//
//  Created by tigerfly on 2020/12/6.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Outlets.h"

@interface Outlets ()

@end

@implementation Outlets

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     An outlet is a property of an object that references
     another object. The reference is archived through
     Interface Builder. The connections between the containing
     object and its outlets are reestablished every time the
     containing object is unarchived from its nib file. The
     containing object holds an outlet declared as a property
     with the type qualifier of IBOutlet and a weak option.
     For example:
     ================================================
     @interface AppController : NSObject
     {
     }
     @property (weak) IBOutlet NSArray *keywords;
     ================================================

     Because it is a property, an outlet becomes part of an
     object’s encapsulated data and is backed by an instance
     variable. But an outlet is more than a simple property.
     The connection between an object and its outlets is
     archived in a nib file; when the nib file is loaded,
     each connection is unarchived and reestablished, and
     is thus always available whenever it becomes necessary
     to send messages to the other object. The type qualifier
     IBOutlet is a tag applied to an property declaration so
     that the Interface Builder application can recognize
     the property as an outlet and synchronize the display
     and connection of it with Xcode.

     An outlet is declared as a weak reference (weak) to
     prevent strong reference cycles.
     
     You create and connect an outlet in the Interface
     Builder feature of Xcode.The property declaration
     for the outlet must be tagged with the IBOutlet
     qualifier.

     An application typically sets outlet connections
     between its custom controller objects and objects
     on the user interface, but they can be made between
     any objects that can be represented as instances in
     Interface Builder, even between two custom objects.
     As with any item of object state, you should be able
     to justify its inclusion in a class; the more outlets
     an object has, the more memory it takes up. If there
     are other ways to obtain a reference to an object,
     such as finding it through its index position in a
     matrix, or through its inclusion as a function parameter,
     or through use of a tag (an assigned numeric identifier),
     you should do that instead.

     Outlets are a form of object composition, which is a
     dynamic pattern that requires an object to somehow
     acquire references to its constituent objects so that
     it can send messages to them. It typically holds these
     other objects as properties backed by instance variables.
     These variables must be initialized with the appropriate
     references at some point during the execution of the
     program.
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
