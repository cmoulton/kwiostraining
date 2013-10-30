//
//  ViewController.h
//  ProgrammaticTapCounter
//
//  Created by Christina Moulton on 10/30/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UIButton *counterButton;
@property (nonatomic, strong) UILabel *counterLabel;
@property (nonatomic) NSInteger tapCount;


@end
