//
//  AppDelegate.m
//  Runtime
//
//  Created by tiger fly on 2020/4/13.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "AppDelegate.h"
#import "RuntimeVersionsPlatforms.h"
#import "InteractWithRuntime.h"
#import "Messaging.h"
#import "DynamicMethodResolution.h"
#import "MessageForwarding.h"
#import "TypeEncodings.h"
#import "DeclaredProperties.h"
#import "KeyValueCoding.h"
#import "CopingController.h"
#import "KVO.h"
#import "KVC.h"
#import "Objective-CRuntime.h"

//Runtime 官方文档
//https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008048-CH1-SW1

//iOS开发文档
//https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjectiveC/Chapters/ocProperties.html

//Advanced Memory Management
//https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/mmPractical.html#//apple_ref/doc/uid/TP40004447-SW1

//Instruments Help
//https://help.apple.com/instruments/mac/current/#/dev7b09c84f5

//Concepts in Objective-C Programming
//https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010810-CH1-SW1

//Digital Image Processing
//https://www.tutorialspoint.com/dip/image_processing_introduction.htm

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    Objective_CRuntime *vc = [Objective_CRuntime new];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}





@end
