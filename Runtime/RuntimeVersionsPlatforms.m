//
//  RuntimeVersionsPlatforms.m
//  Runtime
//
//  Created by tigerfly on 2020/11/14.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "RuntimeVersionsPlatforms.h"

@interface RuntimeVersionsPlatforms ()

@end

@implementation RuntimeVersionsPlatforms

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     There are different versions of the Objective-C runtime on
     different platforms.
     
     There are two versions of the Objective-C runtime - "modern" and
     "legacy". The modern version was introduced with Objective-C 2.0
     and includes a number of new features. The programming interface
     for the legacy version of the runtime is describled in objective-C
     runtime Reference.
     
     The most notable new feature is that instance variables in the
     modern runtime are “non-fragile”:

     •  In the legacy runtime, if you change the layout of instance variables
        in a class, you must recompile classes that inherit from it.
     •  In the modern runtime, if you change the layout of instance variables
        in a class, you do not have to recompile classes that inherit from it.
     
     In addition , the modern runtime supports instance variable synthesis for
     declared properties.
     
     
     Platforms
     iPhone applications and 64-bit programs on OS X v10.5 and later use the
     modern version of the runtime.
     
     Other programs (32-bit programs on OS X desktop) use the legacy version
     of the runtime.
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
