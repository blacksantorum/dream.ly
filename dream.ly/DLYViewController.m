//
//  DLYViewController.m
//  dream.ly
//
//  Created by Chris Tibbs on 4/22/14.
//
//

#import "DLYViewController.h"
#import <Parse/Parse.h>

@interface DLYViewController ()

@end

@implementation DLYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set if you want to save more information
    user[@"phone"] = @"650-555-0000";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
