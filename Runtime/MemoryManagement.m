//
//  MemoryManagement.m
//  Runtime
//
//  Created by tigerfly on 2020/11/17.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "MemoryManagement.h"

@interface MemoryManagement ()

@end

@implementation MemoryManagement

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    /*
     NSAutoreleasePool
     
     An object that supports Cocoa's reference-counted memory
     management system.
     
     An autorelease pool stores objects that are sent a release
     message when the pool itself is drained.
     
     ⚠️ If you use Automatic Reference Counting(ARC), you cannot
     use autorelease pools directly. Instead, you use @autoreleasepool
     blocks. For example, in place of:
     ====================================================
     NSAutoreleasePool *pool = [NSAutoreleasePool alloc] init];
     // Code benefitting from a local autorelease pool.
     [pool release];
     ====================================================

     you would write:
     ====================================================
     @autoreleasepool {
        // Code benefitting from a local autorelease pool.
     }
     ====================================================
     @autoreleasepool blocks are more efficient than using
     an instance of NSAutoreleasePool directly; you can
     also use them even if you do not use ARC.
     
     In a reference-counted environment (as opposed to one
     which uses garbage collection), an NSAutoreleasePool
     object contains objects that have received an autorelease
     message and when drained it sends a release message to
     each of those objects. Thus, sending autorelease instead
     of release to an object extends the lifetime of that
     object at least until the pool itself is drained (it
     may be longer if the object is subsequently retained).
     An object can be put into the same pool several times,
     in which case it receives a release message for each
     time it was put into the pool.
     
     In a reference counted environment, Cocoa expects there
     to be an autorelease pool always available. If a pool
     is not available, autoreleased objects do not get
     released and you leak memory. In this situation, you
     program will typically log suitable warning messages.
     
     The Application Kit creates an autorelease pool on the
     main thread at the beginning of every cycle of the
     event loop, and darins it at the end, thereby releasing
     any autoreleased objects have to create your own pools.
     If your application creates a lot of temporary autoreleased
     objects within the event loop, however, it may be beneficial
     to create "local" autorelease pools to help to minimize
     the peak memory footprint.
     
     You create an NSAutoreleasePool object with the usual
     alloc and init messages and dispose of it with drain
     (or release -- to understand the difference, see garbage
     collection). Since you cannot retain an autorelease pool
     (or autorelease it -- see retain and autorelease), draining
     a pool ultimately has the effect of deallocating it. You
     should always drain an autorelease pool in the same context
     (invocation of a method or function, or body of a loop)
     that it was created.
     
     Each thread (including the main thread) maintains its own
     stack of NSAutoreleasePool objects (see Threads). As new
     pools are created, they get added to the top of the stack.
     When pools are deallocated, they are removed from the stack.
     Autoreleased objects are placed into the top autorelease pool
     for the current thread, When a thread terminates, it
     automatically drains all of the autorelease pools associated
     with itself.
     */
    
    @autoreleasepool {
        for (int i = 0; i < 1000; i ++) {
            NSObject *obejct = [NSObject new];
        }
    }
    
    
    /*
     Threads
     
     If you are making Cocoa calls outside of the Application Kit's
     main thread -- for example if you create a Foundation - only
     application or if you detach a thread -- you need to create your
     own autorelease pool.
     
     If you application or thread is long-lived and potentially
     generates a lot of autoreleaesd objects, you should periodically
     drain and create autorelease pools(like the Application Kit does
     on the main thread); otherwise, autoreleased objects accumulate
     and your memory footprint grows. If, however, your detached thread
     does not make Cocoa calls, you do not need to create an autorelease
     pool.
     
     ⚠️ If you are creating secondray threads using the POSIX thread
     APIs instead of NSThread objects, you cannot use Cocoa, including
     NSAutoreleasePool, unless Cocoa is in multithreading mode. Cocoa
     enters multithreading mode only after detaching its first NSThread
     object. To use Cocoa on secondary POSIX threads, your application
     must first detach at least one NSThread object, which can immediately
     exit. You can test whether Cocoa is in multithreading mode with
     the NSThread class method isMultiThreaded.
     */

    
    
    /*
     Garbage Collection
     
     In a garbege-collected environment, there is no need for autorelease
     pool. You may, however, write a framework that is designed to work
     in both a gargabe-collected and reference-counted environment.
     In this case, you can use autorelease pools to hint to the collector
     that collection may be appropriate. In a gargabe-collected environment,
     sending a drain message to a pool triggers garbage collection if
     necessary; release, however, is a no-op. In a reference-counted
     environment, drain has the same effect as release. Typically,
     therefore, you should use drain instead of release.
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
