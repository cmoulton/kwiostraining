//
//  SessionDetailViewController.h
//  RestTweet
//
//  Created by Christina Moulton on 11/1/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RKConferenceSession.h"

@interface SessionDetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *startTimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *endTimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *typeLabel;

@property (nonatomic, strong) RKConferenceSession *session;

@end
