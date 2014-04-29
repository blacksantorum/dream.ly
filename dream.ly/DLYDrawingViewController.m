//
//  DLYDrawingViewController.m
//  dream.ly
//
//  Created by Chris Tibbs on 4/28/14.
//
//

#import "DLYDrawingViewController.h"
#import "DLYCanvas.h"

@interface DLYDrawingViewController ()

- (IBAction)startOverButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet DLYCanvas *canvas;

@end

@implementation DLYDrawingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.canvas.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startOverButtonPressed:(id)sender {
    self.canvas = [[DLYCanvas alloc] initWithFrame:CGRectMake(0, 80, 320, 410)];
}
@end
