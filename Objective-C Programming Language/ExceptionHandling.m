//
//  ExceptionHandling.m
//  Runtime
//
//  Created by tigerfly on 2020/12/3.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "ExceptionHandling.h"

@interface ExceptionHandling ()

@end

@implementation ExceptionHandling

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     The Objective-C language has an exception-handling syntax
     similar to that of Java and C++. By using this syntax with
     the NSException, NSError, or custom classes, you can add
     robust error-handling to your programs. This chapter
     provides a summary of exception syntax and handling;
     for more details, see Exception Programming Topics.
     */
    
    
#pragma mark -- Enabling Exception-Handling

    /*
     Using GNU Compiler Collection (GCC) version 3.3 and
     later, Objective-C provides language-level support
     for exception handling. To turn on support for these
     features, use the -fobjc-exceptions switch of the GNU
     Compiler Collection (GCC) version 3.3 and later. (Note
     that this switch renders the application runnable only
     in OS X v10.3 and later because runtime support for
     exception handling and synchronization is not present
     in earlier versions of the software.)
     */
    
    
#pragma mark -- Exception Handling

    /*
     An exception is a special condition that interrupts the
     normal flow of program execution. There are a variety
     of reasons why an exception may be generated (exceptions
     are typically said to be raised or thrown), by hardware
     as well as software. Examples include arithmetical
     errors such as division by zero, underflow or overflow,
     calling undefined instructions (such as attempting to
     invoke an unimplemented method), and attempting to access
     a collection element out of bounds.

     Objective-C exception support involves four compiler
     directives: @try, @catch, @throw, and @finally:

     •  Code that can potentially throw an exception is enclosed
        in a @try{} block.
     •  A @catch{} block contains exception-handling logic for
        exceptions thrown in a @try{} block. You can have
        multiple @catch{} blocks to catch different types of
        exception. (For a code example, see Catching Different
        Types of Exception.)
     •  You use the @throw directive to throw an exception,
        which is essentially an Objective-C object. You typically
        use an NSException object, but you are not required to.
     •  A @finally{} block contains code that must be executed
        whether an exception is thrown or not.

     This example depicts a simple exception-handling algorithm:
     ==========================================================
     Cup *cup = [[Cup alloc] init];
      
     @try {
         [cup fill];
     }
     @catch (NSException *exception) {
         NSLog(@"main: Caught %@: %@", [exception name], [exception reason]);
     }
     @finally {
         [cup release];
     }
     ==========================================================
     */
    
   
    
    
#pragma mark -- Catching Different Types of Exception

    /**
     To catch an exception thrown in a @try{} block, use
     one or more @catch{}blocks following the @try{} block.
     The @catch{} blocks should be ordered from most-specific
     to least-specific. That way you can tailor the processing
     of exceptions as groups, as shown in Listing 10-1.

     Listing 10-1  An exception handler
     ==========================================================
     @try {
         ...
     }
     @catch (CustomException *ce) {   // 1
         ...
     }
     @catch (NSException *ne) {       // 2
         // Perform processing necessary at this level.
         ...
      
     }
     @catch (id ue) {
         ...
     }
     @finally {                       // 3
         // Perform processing necessary whether an exception occurred or not.
         ...
     }
     ==========================================================
     
     The following list describes the numbered code lines:
     1. Catches the most specific exception type.
     2. Catches a more general exception type.
     3. Performs any clean-up processing that must always be
        performed, whether exceptions were thrown or not.
     */
    
    
    
#pragma mark -- Throwing Exceptions

    /**
     To throw an exception, you must instantiate an object
     with the appropriate information, such as the exception
     name and the reason it was thrown.
     ==========================================================
     NSException *exception = [NSException exceptionWithName: @"HotTeaException"
                                                      reason: @"The tea is too hot"
                                                    userInfo: nil];
     @throw exception;
     ==========================================================

     ⚠️ In many environments, use of exceptions is fairly
     commonplace. For example, you might throw an exception
     to signal that a routine could not execute normally—such
     as when a file is missing or data could not be parsed
     correctly. Exceptions are resource-intensive in Objective-C.
     You should not use exceptions for general flow-control, or
     simply to signify errors. Instead you should use the return
     value of a method or function to indicate that an error
     has occurred, and provide information about the problem in
     an error object.
     For more information, see Error Handling Programming Guide.
     
     Inside a @catch{} block, you can rethrow the caught exception
     using the @throw directive without providing an argument.
     Leaving out the argument in this case help make your code
     more readable.
     
     You are not limited to throwing NSException objects. You
     can throw any Objective-C object as an exception object.
     The NSException class provides methods that help in exception
     processing, but you can implement your own if you so desire.
     You can also subclass NSException to implement specialized
     types of exceptions, such as file-system exceptions or
     communications exceptions.
     */
    
    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    
    @try {
       NSString *result = array[5];
    } @catch (NSException *exception) {
        NSLog(@"exception %@",exception);
    } @finally {
        NSLog(@"%@",array);
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
