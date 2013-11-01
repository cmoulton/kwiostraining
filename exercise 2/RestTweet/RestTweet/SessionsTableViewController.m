//
//  SessionsTableViewController.m
//  RestTweet
//
//  Created by Christina Moulton on 11/1/2013.
//  Copyright (c) 2013 Teak Mobile Inc. All rights reserved.
//

#import "SessionsTableViewController.h"
#import <RestKit/RestKit.h>
#import "RKConferenceSession.h"
#import "SessionDetailViewController.h"

@implementation SessionsTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[RKConferenceSession class]];
  [mapping addAttributeMappingsFromDictionary:@{@"name": @"name",
                                                @"description":@"sessionDescription",
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
     self.sessions = [result array];
     [self.tableView reloadData];
   } failure:^(RKObjectRequestOperation *operation, NSError *error)
   {
     NSLog(@"error: %@", error);
     self.sessions = nil;
     [self.tableView reloadData];
   }];
  [operation start];
  
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if (self.sessions != nil)
  {
    return self.sessions.count;
  }
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"SessionCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  // Configure the cell...
  RKConferenceSession *session = self.sessions[indexPath.row];
  cell.textLabel.text = session.name;
  cell.detailTextLabel.text = session.start_time;
  
  return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  // Figure out which cell they tapped on
  NSInteger selectionIndex = [self.tableView indexPathForSelectedRow].row;
  RKConferenceSession *session = self.sessions[selectionIndex];
  
  // Get the new view controller using [segue destinationViewController].
  SessionDetailViewController *detailViewController = (SessionDetailViewController *)[segue destinationViewController];
  // Pass the selected object to the new view controller.
  detailViewController.session = session;
}

@end
