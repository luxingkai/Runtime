//
//  ProtocolsViewController.m
//  Runtime
//
//  Created by tigerfly on 2020/6/22.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "ProtocolsViewController.h"

@interface ProtocolsViewController ()

@end

@implementation ProtocolsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Identifying Classes */
    NSLog(@"class %@",NSStringFromClass(self.class));
    NSLog(@"superclass %@",NSStringFromClass(self.superclass));

    /* Identifying and Comparing Objects */
    [self isEqual:self];
    NSLog(@"hash %lu",(unsigned long)[self hash]);
    
    /* Testing Object Inheritance, Behavior and Conformance */
    [self isKindOfClass:[self class]];
    [self isMemberOfClass:[self class]];
    [self respondsToSelector:@selector(react)];
    [self conformsToProtocol:@protocol(NSObject)];
    
    /* Describing Objects */
    NSLog(@"description %@",self.description);
    NSLog(@"debugDescription %@",self.debugDescription);

    /* Sending Messages */
//    [self performSelector:@selector(react)];
//    self performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#>
//    self performSelector:<#(SEL)#> withObject:<#(id)#>
    
    
    /* Identifying Proxies*/
    [self isProxy];
    
    /* obsolete Methods */
//    [self retain];
//    [self release];
    
    
    // Do any additional setup after loading the view.
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
