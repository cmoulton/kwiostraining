//
//  ViewController.h
//  TapCounter
//
//  Created by Christina Moulton on 10/30/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *counterButton;
@property (nonatomic, weak) IBOutlet UILabel *counterLabel;
@property (nonatomic) NSInteger tapCount;

@end
