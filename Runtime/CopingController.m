//
//  CopingController.m
//  Runtime
//
//  Created by tigerfly on 2020/11/17.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "CopingController.h"

@interface Orange : NSObject<NSCopying,NSMutableCopying>

@end

@implementation Orange

- (id)copyWithZone:(NSZone *)zone {
    Orange *orange = [[self class] allocWithZone:zone];
    return orange;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    Orange *orange = [[self class] allocWithZone:zone];
    return orange;
}

@end


@interface CopingController ()

@end

@implementation CopingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /**
     NSCopying
     
     A protocol that objects adopt to provide functional copies of themselves.
     
     The exact meaning of “copy” can vary from class to class, but a copy must
     be a functionally independent object with values identical to the original
     at the time the copy was made. A copy produced with NSCopying is implicitly
     retained by the sender, who is responsible for releasing it.
     
     NSCopying declares one method, copyWithZone:, but copying is commonly
     invoked with the convenience method copy. The copy method is defined
     for all objects inheriting from NSObject and simply invokes copyWithZone:
     with the default zone.
     
     Your options for implementing this protocol are as follows:
     
     • Implement NSCopying using alloc and init... in classes that don’t
     inherit copyWithZone:.
     • Implement NSCopying by invoking the superclass’s copyWithZone: when
     NSCopying behavior is inherited. If the superclass
     • implementation might use the NSCopyObject function, make explicit
     assignments to pointer instance variables for retained objects.
     • Implement NSCopying by retaining the original instead of creating a
     new copy when the class and its contents are immutable.
     
     If a subclass inherits NSCopying from its superclass and declares
     additional instance variables, the subclass has to override copyWithZone:
     to properly handle its own instance variables, invoking the superclass’s
     implementation first.
     */
    
    /**
     Copying
     
     - copyWithZone:
     */
    
    /**
     NSMutableCopying
     
     A protocol that mutable objects adopt to provide functional copies
     of themselves.
     
     The NSMutableCopying protocol declares a method for providing mutable
     copies of an object. Only classes that define an "immutable vs. mutable"
     distinction should adopt this protocol.Classes that don't define such a
     distinction should adopt NSCoping instead.
     
     NSMutableCopying declares one method, mutableCopyWithZone:, but mutable
     copying is commonly invoked with the convenience method mutableCopy.
     The mutableCopy method is defined for all NSObjects and simply invokes
     mutableCopyWithZone: with the default zone.
     
     If a subclass inherits NSMutableCopying from its superclass and declares
     additional instance variables, the subclass has to override
     mutableCopyWithZone: to properly handle its own instance variables,
     invoking the superclass's implementation first.
     */
    
    /**
     Copying
     
     - mutableCopyWithZone:
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
