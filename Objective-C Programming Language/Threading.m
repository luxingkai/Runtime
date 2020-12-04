//
//  Threading.m
//  Runtime
//
//  Created by tigerfly on 2020/12/3.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Threading.h"

@interface Threading ()

@end

@implementation Threading

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Objective-C provides support for thread synchronization and
     exception handling, which are explained in this chapter and
     in Exception Handling. To turn on support for these features,
     use the -fobjc-exceptions switch of the GUN Compiler Collection
     (GCC) version 3.3 and later.
     
     ⚠️ Using either of these features in a program renders the
     application runnable only in OS X v10.3 and later because
     runtime support for exception handling and synchronization is
     not present in earlier versions of the software.
     
     Objective-C supports multithreading in applications. Therefore,
     two thread can try to modify the same object at the same time,
     a situation that can cause serious problems in a program.To
     protect sections of code from being executed by more than
     one thread at a time, Objective-C provides the @synchronized
     directive.
     
     The @synchronized() directive locks a section of code for
     use by a single thread. Other threads are blocked until the
     thread exits the protected code -- that is, when execution
     continues past the last statement in the @synchronized() lock.
     
     The @synchronized() directive take as its only argument any
     Objective-C object, including self. This Object is known as
     a mutual exclusion semaphore or mutex. It allows a thread
     to lock a section of code to provent its use by other threads.
     You should use separate semaphores to protect different cirtical
     sections of a program. It's safest to create all the mutual
     exclusion objects before the application becomes multithreaded,
     to avoid race conditions.
     
     Listing 11-1 shows code that uses self as the mutex to
     synchronize access to the instance methods of the current
     object. You can take a similar approach to synchronize the
     class methods of the associated class, using the class object
     instead of self. In the latter case, of course, only one
     thread at a time is allowed to execute a class method because
     there is only one class object that is shared by all callers.
     ==========================================================
     Listing 11-1  Locking a method using self
     - (void)criticalMethod
     {
         @synchronized(self) {
             // Critical code.
             ...
         }
     }
     ==========================================================

     Listing 11-2 shows a general approach. Before executing a
     critical process, the code obtains a semaphore from the
     Account class and uses it to lock the critical section.
     The Account class could create the semaphore in its
     initialize method.

     
     Listing 11-2  Locking a method using a custom semaphore
     ==========================================================
     Account *account = [Account accountFromString:[accountField stringValue]];
      
     // Get the semaphore.
     id accountSemaphore = [Account semaphore];
      
     @synchronized(accountSemaphore) {
         // Critical code.
         ...
     }
     ==========================================================
     
     The Objective-C synchronization feature supports recursive
     and reentrant code. A thread can use a single semaphore
     several times in a recursive manner; other threads are
     blocked from using it until the thread releases all the
     locks obtained with it; that is, every @synchronized()
     block is exited normally or through an exception.

     When code in an @synchronized() block throws an exception,
     the Objective-C runtime catches the exception, releases
     the semaphore (so that the protected code can be executed
     by other threads), and rethrows the exception to the next
     exception handler.
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
