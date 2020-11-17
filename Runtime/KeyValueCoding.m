//
//  KeyValueCoding.m
//  Runtime
//
//  Created by tigerfly on 2020/11/17.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "KeyValueCoding.h"

@implementation Snower

- (instancetype)init {
    self = [super init];
    if (self == nil) {return nil;}
    _name = @"mean";
    return self;
}
@end

@interface KeyValueCoding ()

@end

@implementation KeyValueCoding

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     A mechanism by which you can access the properties of an
     object indirectly by name or key.
     
     The basic methods for accessing an object's values are
     setValue:forkey:, which sets the value for the property
     identified by the specified key, and valueForKey:, which
     returns the value for the property identified by the
     specified key. Thus, all of an object's properties can be
     accessed in a consistent manner.
     
     The default implementation relies on the accessor methods
     normally implemented by objects (or to access instance
     variables directly if need be).
     */
    Snower *snower = [Snower new];
    
    /**
     Getting Values
     */
//    [snower valueForKey:@""];
//    [snower valueForKeyPath:@""];
//    [snower dictionaryWithValuesForKeys:@[]];
//    [snower valueForUndefinedKey:@""];
//    [snower mutableArrayValueForKey:@""];
//    [snower mutableArrayValueForKeyPath:@""];
//    [snower mutableSetValueForKey:@""];
//    [snower mutableSetValueForKeyPath:@""];
//    [snower mutableOrderedSetValueForKey:@""];
//    [snower mutableOrderedSetValueForKeyPath:@""];
    
    /**
     Setting Values
     */
//    [snower setValue:@"" forKey:@""];
//    [snower setValuesForKeysWithDictionary:@{}];
//    [snower setNilValueForKey:@""];
//    [snower setValue:@"" forKeyPath:@""];
//    [snower setValue:@"" forUndefinedKey:@""];
    
    /**
     Changing Default Behavior
     */
//    snower.accessInstanceVariablesDirectly
    
    /**
     Validation
     */
//    [snower validateValue:@"" forKey:@"" error:nil];
//    [snower validateValue:@"" forKeyPath:@"" error:nil];
    
    
    
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
