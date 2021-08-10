//
//  ClassFactoryMethods.m
//  Runtime
//
//  Created by tigerfly on 2020/12/6.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "ClassFactoryMethods.h"

@interface ClassFactoryMethods ()

@end

@implementation ClassFactoryMethods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Class factory methods are implemented by a class as a
     convenience for clients. They combine allocation and
     initialization in one step and return the created object.
     However, the client receiving this object does not own
     the object and thus (per the object-ownership policy) is
     not responsible for releasing it. These methods are of
     the form + (type)className... (where className excludes
     any prefix).
     
     Cocoa provides plenty of examples, especially among the
     "value" classes. NSData includes the following class
     factory methods.
     ================================================
     + (id)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs;
     + (id)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)secs;
     + (id)dateWithTimeIntervalSince1970:(NSTimeInterval)secs;
     ================================================

     And NSData offers the following factory methods:
     ================================================
     + (id)dataWithBytes:(const void *)bytes length:(unsigned)length;
     + (id)dataWithBytesNoCopy:(void *)bytes length:(unsigned)length;
     + (id)dataWithBytesNoCopy:(void *)bytes length:(unsigned)length
             freeWhenDone:(BOOL)b;
     + (id)dataWithContentsOfFile:(NSString *)path;
     + (id)dataWithContentsOfURL:(NSURL *)url;
     + (id)dataWithContentsOfMappedFile:(NSString *)path;
     ================================================

     Factory methods can be more than a simple convenience.
     They can not only combine allocation and initialization,
     but the allocation can inform the initialization. As an
     example, let's say you must initialize a collection object
     from a property-list file that encodes any number of
     elements for the collection (NSString objects, NSData objects,
     NSNumber objects, and so on). Before the factory methods can
     known how much memory to allocate for the collection, it must
     read the file and parse the property list to determine how
     many elements there are and what object type these elements
     are.
     
     Another purpose for a class factory method is to ensure that
     a certain class(NSWorkspace, for example) vends a singleton
     instance. Although an init... method could verify the only
     one instance exists at any one time in a program, it would
     require the prior allocation of a "raw" instance and then,
     in memory-managed code, would have to release that instance.
     A factory method, on the other hand, gives you a way to
     avoid blindly allocating memory for an object that you
     might not use, as in the following example:
     ================================================
     static AccountManager *DefaultManager = nil;
      
     + (AccountManager *)defaultManager {
         if (!DefaultManager) DefaultManager = [[self allocWithZone:NULL] init];
         return DefaultManager;
     }
     ================================================
     
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
