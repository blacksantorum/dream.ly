//
//  DLYAppDelegate.m
//  dream.ly
//
//  Created by Chris Tibbs on 4/22/14.
//
//

#import "DLYAppDelegate.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@implementation DLYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"a9qCAMPVFWO5qRgFNOyvLyGHO2fMX1pHLEa77cvX"
                  clientKey:@"KHOuWqX0tqarWQ8v70Ai8UvC8eLIL2MtgVL0PNGU"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [PFFacebookUtils initializeFacebook];
    
    
    return YES;
}

- (void)openFBSession
{
    [FBSession openActiveSessionWithReadPermissions:@[@"basic_info", @"email"] allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        FBAccessTokenData *tokenData = session.accessTokenData;
        [PFFacebookUtils logInWithFacebookId:@"12409649" accessToken:tokenData.accessToken expirationDate:tokenData.expirationDate block:^(PFUser *user, NSError *error) {
            NSLog(@"%@",user);
        }];
        [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            NSLog(@"%@",result);
        }];
    }];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
