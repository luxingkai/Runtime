//
//  ClassesViewController.m
//  Runtime
//
//  Created by tigerfly on 2020/6/22.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "ClassesViewController.h"

@interface ClassesViewController ()

@end

@implementation ClassesViewController

#pragma mark - -Initializing a Class
+ (void)initialize {
    [super initialize];
    
}

+ (void)load {
    [super load];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark -- NSObject
    
    /* Creating, Copying and Deallocating Objects */
    NSObject *object = [[NSObject alloc] init];
    [NSObject new];
    
    //    [object copy];
    
    
    /* Identifying Classes */
    Class class = [NSObject class];
    Class superclass = [NSObject superclass];
    [NSObject isSubclassOfClass:class];
    
    /* Testing Class Functionality */
    BOOL result = [NSObject instancesRespondToSelector:@selector(react)];
    
    /* Testing Protocol Conformance */
    [NSObject conformsToProtocol:@protocol(NSObject)];
    
    /* Obtaining information about Methods */
    IMP implement = [NSObject methodForSelector:@selector(react)];
    IMP implement_1 = [NSObject instanceMethodForSelector:@selector(react)];
    NSMethodSignature *signature = [NSObject instanceMethodSignatureForSelector:@selector(react:)];
    NSLog(@"%d",signature.numberOfArguments);
    NSMethodSignature *methodSignature = [object methodSignatureForSelector:@selector(react)];
    
    /* Describing Objects */
    NSString *description = [NSObject description];
    
    /* Supporting Discardable Content */
    id discard = [NSObject autoContentAccessingProxy];
    
    /* Sending Messages */
    [object performSelector:@selector(react) withObject:nil afterDelay:0.5];
    [object performSelector:@selector(react) withObject:nil afterDelay:0.5 inModes:@[NSRunLoopCommonModes]];
//    object performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>
//    object performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#> modes:<#(nullable NSArray<NSString *> *)#>
//    object performSelector:<#(nonnull SEL)#> onThread:<#(nonnull NSThread *)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>
//    object performSelector:<#(nonnull SEL)#> onThread:<#(nonnull NSThread *)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#> modes:<#(nullable NSArray<NSString *> *)#>
//    object performSelectorInBackground:<#(nonnull SEL)#> withObject:<#(nullable id)#>
//    NSObject cancelPreviousPerformRequestsWithTarget:<#(nonnull id)#>
//    NSObject cancelPreviousPerformRequestsWithTarget:<#(nonnull id)#> selector:<#(nonnull SEL)#> object:<#(nullable id)#>
    
    /* Forwarding Messages */
//    object forwardInvocation:<#(NSInvocation *)#>
//    object forwardingTargetForSelector:<#(SEL)#>
    
    /* Dynamically Resolving Methods */
    [NSObject resolveClassMethod:@selector(react)];
    [NSObject resolveInstanceMethod:@selector(react)];
    
    /* Handling Errors */
//    [object doesNotRecognizeSelector:@selector(react)];
    
    /* Archiving */
//    object.classForKeyedArchiver
//    object.classForCoder
//    object.classForKeyedUnarchiver
//    NSObject classFallbacksForKeyedArchiver
//    NSObject classForKeyedUnarchiver
//    object replacementObjectForCoder:<#(nonnull NSCoder *)#>
//    object replacementObjectForKeyedArchiver:<#(nonnull NSKeyedArchiver *)#>
//    NSObject setVersion:<#(NSInteger)#>
    
    /* Working With Class Descriptions */
    
    /* Improving Accessibility */
    
    /* Scripting */
    
    /* Key-value Observing */
    
    /* Key-value Coding*/
    
    
}

- (void)react {
    
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
