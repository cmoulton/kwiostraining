//
//  RKTweet.h
//  RestTweet
//
//  Created by Christina Moulton on 11/1/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// http://go-opendata.ca/documentation/api/

@interface RKConferenceSession : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sessionDescription;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, copy) NSString *end_time;
@property (nonatomic, copy) NSString *type;

@end