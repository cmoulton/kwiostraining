//
//  SessionDetailViewController.m
//  RestTweet
//
//  Created by Christina Moulton on 11/1/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import "SessionDetailViewController.h"

@interface SessionDetailViewController ()

@end

@implementation SessionDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  if (self.session)
  {
    self.nameLabel.text = self.session.name;
    self.startTimeLabel.text = self.session.start_time;
    self.endTimeLabel.text = self.session.end_time;
    self.typeLabel.text = self.session.type;
    self.descriptionLabel.text = self.session.sessionDescription;
  }
}

@end
