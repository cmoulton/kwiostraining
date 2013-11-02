//
//  ViewController.m
//  ProgrammaticTapCounter
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
  
  // Create label
  self.counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 320, 100)];
  // set text
  self.counterLabel.text = @"Taps: 0";
  self.counterLabel.textAlignment = NSTextAlignmentCenter;
  // add label to view
  [self.view addSubview:self.counterLabel];
  
  // create button
  self.counterButton = [UIButton buttonWithType:UIButtonTypeSystem];
  self.counterButton.frame = CGRectMake(0, 100, 320, 100);
  // set text
  [self.counterButton setTitle:@"Tap to count" forState:UIControlStateNormal];
  // add action to button
  [self.counterButton addTarget:self
                         action:@selector(incrementAndUpdateCount:)
               forControlEvents:UIControlEventTouchUpInside];

  // add button to view
  [self.view addSubview:self.counterButton];
}

- (void)incrementAndUpdateCount:(id)sender
{
  self.tapCount++;
  self.counterLabel.text = [NSString stringWithFormat:@"Taps: %d", self.tapCount];
}


@end
