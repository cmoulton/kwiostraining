//
//  AppDelegate.m
//  RestTweet
//
//  Created by Christina Moulton on 11/1/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import "AppDelegate.h"
#import <RestKit/RestKit.h>
#import "RKConferenceSession.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  
  
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[RKConferenceSession class]];
  [mapping addAttributeMappingsFromDictionary:@{@"name": @"name",
                                                @"description":@"description",
                                                @"start_time":@"start_time",
                                                @"end_time":@"end_time",
                                                @"type":@"type",}];
  
  RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping method:RKRequestMethodAny pathPattern:nil keyPath:@"objects" statusCodes:nil];
  
  NSURL *url = [NSURL URLWithString:@"http://api.go-opendata.ca/schedule/?format=json"];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
  [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result)
   {
     NSLog(@"The sessions are: %@", [result array]);
   } failure:^(RKObjectRequestOperation *operation, NSError *error)
   {
     NSLog(@"error: %@", error);
   }];
  [operation start];
  
  return YES;
}


@end
