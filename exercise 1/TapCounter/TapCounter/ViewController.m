//
//  ViewController.m
//  TapCounter
//
//  Created by Christina Moulton on 10/30/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import "ViewController.h"
#import "Flurry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
  [self becomeFirstResponder];
}

- (IBAction)incrementAndUpdateCount:(id)sender
{
  self.tapCount++;
  self.counterLabel.text = [NSString stringWithFormat:@"Taps: %d", self.tapCount];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
  if (motion == UIEventSubtypeMotionShake)
  {
    [self incrementAndUpdateCount:nil];
    [Flurry logEvent:@"shaken"];
  }
}

@end
