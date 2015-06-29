//
//  FISLocationsViewController.m
//  ios-location-trivia-delegate
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISLocationsViewController.h"
#import "FISLocation.h"
#import "FISAddLocationViewControllerDelegate.h"
#import "FISAddLocationViewController.h"

@interface FISLocationsViewController () <FISAddLocationViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *triviaLocations;
@property (nonatomic, strong) NSMutableSet *locationSet;

@end

@implementation FISLocationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FISLocation *empireStateBuilding = [[FISLocation alloc] initWithName:@"Empire State Building" trivia:@[ @"1,454 Feet Tall", @"Cost $24,718,000 to build" ]];

    FISLocation *bowlingGreen = [[FISLocation alloc] initWithName:@"Bowling Green" trivia:@[ @"NYC's oldest park", @"Made a park in 1733", @"Charging Bull was created in 1989" ]];

    self.triviaLocations = [@[ empireStateBuilding, bowlingGreen ] mutableCopy];
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.f, 10.0f)];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.triviaLocations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationCell" forIndexPath:indexPath];

    FISLocation *location = self.triviaLocations[indexPath.row];
    cell.textLabel.text = location.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu facts", location.trivia.count];
    
    return cell;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FISAddLocationViewController *destinationVC = segue.destinationViewController;
    destinationVC.delegate = self;
}

-(void)addLocationViewControllerDidCancel:(FISAddLocationViewController *)viewController
{
    // Dismiss FISAddLocationViewController
    [self dismissViewControllerAnimated:YES completion:nil];
}

//-(BOOL)addLocationViewController:(FISAddLocationViewController *)viewController shouldAllowLocationNamed:(NSString *)locationName
//{
//    
//    for (FISLocation *location in self.triviaLocations)
//    {
//        if ([[location.name lowercaseString] isEqualToString:[locationName lowercaseString]])
//        {
//            return NO;
//        }
//    }
//    return YES;
//}

-(void)addLocationViewController:(FISAddLocationViewController *)viewController didAddLocationNamed:(NSString *)locationName
{
    // Should create new FISLocation object and add it to the array of locatoins
    // Dismiss FISAddLocationViewController
    FISLocation *newLocation = [[FISLocation alloc]initWithName:[locationName capitalizedString] trivia:@[]];
    [self.triviaLocations addObject:newLocation];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
