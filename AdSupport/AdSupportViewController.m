

//
//  AdSupportViewController.m
//  Runtime
//
//  Created by tigerfly on 2021/5/25.
//  Copyright © 2021 tiger fly. All rights reserved.
//

#import "AdSupportViewController.h"
#import <AdSupport/AdSupport.h>

@interface AdSupportViewController ()

@end

@implementation AdSupportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Provide apps with access to an advertising identifier.
     
     Use the AdSupport framework to obtain an advertising identifier.
     The advertsing identifier is an alphanumeric string that's unique
     to each device, and which you only use for advertising. On devices running
     iOS14.5 and later and iPadOS14.5 and later, your app must support App
     Tracking Transparency and define the purpose string NSUserTrackingUsageDescription
     before it can get the advertisingIdentifier property.
     */
    
    /*
     Before requesting the advertising identifier for the first time, your app
     must make a one-time call to requestTrackingAuthorizationWithCompletionHandler:.
     That method presents the app-tracking authorization request to the user.
     The user chooses whether to allow tracking, but can change your app's authorization
     at any time in Settings > Privacy > Tracking.
     You can determine the user's intent by checking your's app authorization status
     with tracking AuthorizationStatus.
     
     To get the advertising identifier, follow these steps:
     1. Use the AdSupport framework to call the sharedManager class method to
        retrieve an instance of ASIdentifierManager.
     2. Use the advertisingIdentifier property to obtain the UUID.
     The code below shows how to retrieve the advertising identifier.
     
     The advertising identifier returns either a unique UUID, or all zeros.
     For more information on the returned value, see advertisingIdentifier.
     */
    
    
    ASIdentifierManager *identifierManager = [ASIdentifierManager sharedManager];
    NSUUID *adID = [identifierManager advertisingIdentifier];
    NSLog(@"%@",adID.UUIDString);
    
    
    
    
    
    
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
