//
//  Invocations.m
//  Runtime
//
//  Created by tigerfly on 2020/11/17.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Invocations.h"

@interface Invocations ()

@end

@implementation Invocations

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSInvocation *invcation = [NSInvocation invocationWithMethodSignature:<#(nonnull NSMethodSignature *)#>];
    
    
    /*
     NSInvocation
     An Objective-C message rendered as an object.

     NSInvocation objects are used to store and forward messages
     between objects and between applications, primarily by NSTimer
     objects and the distributed objects system. An NSInvocation
     object contains all the elements of an Objective-C message:
     a target, a selector, arguments, and the return value. Each
     of these elements can be set directly, and the return value
     is set automatically when the NSInvocation object is dispatched.
     
     An NSInvocation object can be repeatedly dispatched to different
     targets; its arguments can be modified between dispatch for
     varying results; even its selector can be changed to another
     with the same method signature (argument and return types).
     This flexibility makes NSInvocation useful for repeating
     messages with many arguments and variations; rather than
     retyping a slightly different expression for each message,
     you modify the NSInvocation object as needed each time
     before dispatching it to a new target.
     
     NSInvocation does not support invocations of methods with
     either variable numbers of arguments or union arguments.
     You should use the invocationWithMethodSignature: class
     method to create NSInvocation objects; you should not
     create these objects using alloc and init.
     
     This class does not retain the arguments for the contained
     invocation by default. If those objects might disappear
     between the time you create your instance of NSInvocation
     and the time you use it, you should explicitly retain the
     objects yourself or invoke the retainArguments method to
     have the invocation object retain them itself.
     
     ⚠️ NSInvocation conforms to the NSCoding protocol,
     but only supports coding by an NSPortCoder. NSInvocation
     does not support archiving.
     */
    
    /**
     Creating NSInvocation Objects
     */
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:[@"sfd" cStringUsingEncoding:NSUTF8StringEncoding]]];
    
    /**
     Configuring an Invocation Object
     */
//    invocation.selector
//    invocation.target
//    invocation setArgument:<#(nonnull void *)#> atIndex:<#(NSInteger)#>
//    invocation getArgument:<#(nonnull void *)#> atIndex:<#(NSInteger)#>
//    invocation.argumentsRetained
//    invocation.retainArguments
//    invocation setReturnValue:<#(nonnull void *)#>
//    invocation getReturnValue:<#(nonnull void *)#>
    
    /**
     Dispatching an Invocation
     */
//    [invocation invoke];
//    invocation invokeWithTarget:<#(nonnull id)#>
    
    
    /**
     Getting the Method Signature
     */
//    invocation.methodSignature
    
    
    
    /*
     NSMethodSignature
     
     A record of the type information for the return value and
     parameters of a method.

     Use an NSMethodSignature object to forward messages that
     the receiving object does not respond to—most notably
     in the case of distributed objects. You typically create
     an NSMethodSignature object using the NSObject
     methodSignatureForSelector: instance method (in macOS
     10.5 and later you can also use signatureWithObjCTypes:).
     It is then used to create an NSInvocation object, which is
     passed as the argument to a forwardInvocation: message
     to send the invocation on to whatever other object can
     handle the message. In the default case, NSObject invokes
     doesNotRecognizeSelector:, which raises an exception.
     For distributed objects, the NSInvocation object is
     encoded using the information in the NSMethodSignature
     object and sent to the real object represented by the
     receiver of the message.
    
     */
    
    /**
     Type Encodings
     
     An NSMethodSignature object is initialized with an array
     of characters representing the string encoding of return
     and argument types for a method. You can get the string
     encoding of a particular type using the @encode() compiler
     directive. Because string encodings are implemenation-specific,
     you should not hard-code these values.
     
     A method signature consists of one or more characters for
     the method return type, followed by the string encodings
     of the implicit arguments self and _cmd, followed by
     zero or more explicit arguments. You can determine the
     string encoding and the length of a return type using
     methodReturnType and methodReturnLength properties.
     You can access arguments individually using the
     getArgumentTypeAtIndex:method and numberOfArguments property.
     
     For example, the NSString instance method containsString:
     has a method signature with the following arguments:
     1. @encode(BOOL) (c) for the return type
     2. @encode(id) (@) for the receiver (self)
     3. @encode(SEL) (:) for the selector (_cmd)
     4. @encode(NSString *) (@) for the first explicit argument
    
     */
    
    /**
     Creating a method Signature Object
     */
    NSMethodSignature *methodSignature = [NSMethodSignature signatureWithObjCTypes:[@"doSomething" cStringUsingEncoding:NSUTF8StringEncoding]];
    
    /**
     Getting Information on Argument Types
     */
//    methodSignature getArgumentTypeAtIndex:<#(NSUInteger)#>
//    methodSignature.numberOfArguments
//    methodSignature.frameLength
    
    /**
     Getting Information on Return Types
     */
//    methodSignature.methodReturnType
//    methodSignature.methodReturnLength
    
    /**
     Determining Synchronous Status
     */
//    methodSignature.isOneway
    
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
