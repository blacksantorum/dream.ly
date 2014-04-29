//
//  DLYViewController.m
//  dream.ly
//
//  Created by Chris Tibbs on 4/22/14.
//
//

#import "DLYViewController.h"
#import "DLYAppDelegate.h"
#import <Parse/Parse.h>

@interface DLYViewController ()

@property (weak, nonatomic) IBOutlet UIView *centerBlock;
@property (weak, nonatomic) IBOutlet UIButton *connectWithFacebookButton;

@end

@implementation DLYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.centerBlock.layer.cornerRadius = 107;
    self.connectWithFacebookButton.layer.cornerRadius = 4;
    [self addShineToButton];
}

- (void)addShineToButton
{
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = self.connectWithFacebookButton.layer.bounds;
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [self.connectWithFacebookButton.layer addSublayer:shineLayer];
}

- (IBAction)connectWithFacebookButtonPressed:(id)sender {
    DLYAppDelegate *appDelegate = (DLYAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate openFBSession];
}


@end
