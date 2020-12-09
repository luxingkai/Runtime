//
//  Toll-Free Bridging.m
//  Runtime
//
//  Created by tigerfly on 2020/12/6.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Toll-Free Bridging.h"

@interface Toll_Free_Bridging ()

@end

@implementation Toll_Free_Bridging

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     There are a number of data types in the Core Foundation
     framework and the Foundation framework that can be used
     interchangeably. This capability, called toll-free
     bridging, means that you can use the same data type as
     the parameter to a Core Foundation function call or
     as the receiver of an Objective-C message. For example,
     NSLocale is interchangeable with its Core Foundation
     counterpart, CFLocale. Therefore, in a method where you
     see an NSLocale * parameter, you can pass a CFLocaleRef,
     and in a function where you see a CFLocaleRef parameter,
     you can pass an NSLocale instance. You cast one type
     to the other to suppress compiler warnings, as illustrated
     in the following example.
     ================================================
     NSLocale *gbNSLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
     CFLocaleRef gbCFLocale = (CFLocaleRef) gbNSLocale;
     CFStringRef cfIdentifier = CFLocaleGetIdentifier (gbCFLocale);
     NSLog(@"cfIdentifier: %@", (NSString *)cfIdentifier);
     // logs: "cfIdentifier: en_GB"
     CFRelease((CFLocaleRef) gbNSLocale);
      
     CFLocaleRef myCFLocale = CFLocaleCopyCurrent();
     NSLocale * myNSLocale = (NSLocale *) myCFLocale;
     [myNSLocale autorelease];
     NSString *nsIdentifier = [myNSLocale localeIdentifier];
     CFShow((CFStringRef) [@"nsIdentifier: " stringByAppendingString:nsIdentifier]);
     // logs identifier for current locale
     ================================================
     
     Note from the example that the memory management functions
     and methods are also interchangeable—you can use CFRelease
     with a Cocoa object and release and autorelease with a Core
     Foundation object.

     ⚠️ When using garbage collection, there are important
     differences to how memory management works for Cocoa
     objects and Core Foundation objects. See Using Core
     Foundation with Garbage Collection for details.
     
     Toll-free bridging has been available since OS X v10.0.
     Table 13-1 provides a list of the data types that are
     interchangeable between Core Foundation and Foundation.
     For each pair, the table also lists the version of OS X
     in which toll-free bridging between them became available.

     Table 13-1  Data types that can be used interchangeably
     between Core Foundation and Foundation
     file:///Users/tigerfly/Desktop/Runtime/ConceptsInObjective-CProgramming/toll-free.png
     
     ⚠️ Not all data types are toll-free bridged, even though
     their names might suggest that they are. For example,
     NSRunLoop is not toll-free bridged to CFRunLoopRef,
     NSBundle is not toll-free bridged to CFBundleRef, and
     NSDateFormatter is not toll-free bridged to CFDateFormatterRef.
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
