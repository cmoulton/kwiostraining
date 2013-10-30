//
//  ViewController.m
//  TapCounter
//
//  Created by Christina Moulton on 10/30/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)incrementAndUpdateCount:(id)sender
{
  self.tapCount++;
  self.counterLabel.text = [NSString stringWithFormat:@"Taps: %d", self.tapCount];
}

@end
