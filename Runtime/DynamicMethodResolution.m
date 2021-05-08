//
//  DynamicMethodResolution.m
//  Runtime
//
//  Created by tigerfly on 2020/11/16.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "DynamicMethodResolution.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@interface SDFactory : NSObject
@end

@implementation SDFactory

void dynamicMethodIMP(id self, SEL __cmd) {
   //implementation...
    NSLog(@" 动态方法添加和实现");
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if(sel == @selector(resolveThisMethodDynamically)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end




@interface DynamicMethodResolution ()
@end

@implementation DynamicMethodResolution
@dynamic content;
//@synthesize content = _content;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SDFactory *factory = [SDFactory new];
    
    [SDFactory resolveInstanceMethod:@selector(resolveThisMethodDynamically)];
    [factory performSelector:@selector(resolveThisMethodDynamically)];
    
    
    /*
     This chapter describes how you can provide an implementation
     of a method dynamically.
     */
    
//    SEL sel = @selector(asdf);
//    IMP imp = void(*performMethod)(self,sel);
    
    
    /**
     Dynamic Method Resolution
     
     There are situations where you might want to provide an implementation
     of a method dynamically. For example, the Objective-C declared properties
     feature includes the @dynamic directive:
     =============================================================
     @dynamic propertyName;
     =============================================================
     which tells the compiler that the methods associated with the property
     will be provided dynamically.
     
     You can implement the methods resolveInstanceMethod: and resolveClassMethod:
     to dynamically provide an implementation for a given selector for an instance
     and class method respectively.
     
     An Objective-C method is simply a C function that take at least two
     arguments -- self and __cmd. You can add a function to a class as a
     method using the function class_addMethod. Therefore, given the following
     function:
     =============================================================
     void dynamicMethodIMP(id self, SEL __cmd) {
        //implementation...
     }
     =============================================================
     
     you can dynamically add it to a class as a method (called
     resolveThisMethodDynamically) using resolveInstanceMethod: like this:
     =============================================================
     @implementation MyClass
     + (BOOL)resolveInstanceMethod:(SEL)aSEL
     {
        if(aSEL == @selector(resolveThisMethodDynamically)) {
            class_addMethod([self class], aSEL, (IMP)dynamicMethodIMP, "v@:";
            return YES;
        }
        return [super resolveInstanceMethod:aSEL];
     }
     =============================================================
     
     Forwarding methods (as described in Message Forwarding) and
     dynamic method resolution are, largely, orthogonal. A class has
     the opportunity to dynamically resolve a method before the
     forwarding mechanism kicks in. If respondsToSelector: or
     instancesRespondToSelector: is invoked, the dynamic method
     resolver is given the opportunity to provide an IMP for
     the selector first. If you implement resolveInstanceMethod:
     but want particular selectors to actually be forwarded via
     the forwarding mechanism, you return No for those selctors.
     */
    
    
    
    
    /**
     Dynamic Loading
     
     An objective-C program can load and link new classes and
     categories while it's running. The new code is incorporated
     into the program and treated identically to classes and
     categories loaded at the start.
     
     Dynamic loading can be used to do a lot of different things.
     For example, the various modules in the System Preferences
     application are dynamically loaded.
     
     In the Cocoa environment, dynamic loading is commonly used
     to allow applications to be customized. Others can write
     modules that your program loads at runtime - much as interface
     Builder loads custom palettes and the OS X System Preferences
     application loads custom preference modules. The loadable
     modules extend what your application can do. They contribute
     to it in ways that you permit but could not have anticipated
     or defined yourself. You provide the framework, but others
     provide the code.
     
     Although there is a runtime function that performs dynamic
     loading of Objective-C modules in Mach-O files (
     objc_loadModules, defined in objc/objc-load.h), Cocoa's
     NSBundle class provides a significantly more convenient
     interface for dynamic loading-- one that's object-Oriented
     and integrated with related services. See the NSBundle
     class specification in the Foundation framework reference
     for information on the NSBundle class and its use.
     */
        
    
    

    
}

//void dynamicMethodIMP(id self, SEL __cmd) {
//   //implementation...
//
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)aSEL {
//    if(aSEL == @selector(viewDidLoad)) {
//       class_addMethod([self class], aSEL, (IMP)dynamicMethodIMP, "v@:");
//       return YES;
//   }
//   return [super resolveInstanceMethod:aSEL];
//}
//
//+ (BOOL)resolveClassMethod:(SEL)sel {
//
//    return YES;
//}
                       




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
