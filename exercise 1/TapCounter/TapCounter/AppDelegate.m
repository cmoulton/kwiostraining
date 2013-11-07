//
//  AppDelegate.m
//  TapCounter
//
//  Created by Christina Moulton on 10/30/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "Flurry.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [Flurry setCrashReportingEnabled:YES];
  //note: iOS only allows one crash reporting tool per app; if using another, set to: NO
  [Flurry startSession:@"2PY9KT4CVH4JC5SF23HC"];
  return YES;
}

@end
