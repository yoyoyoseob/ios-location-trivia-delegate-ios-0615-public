//
//  FISAddLocationViewControllerDelegate.h
//  ios-location-trivia-delegate
//
//  Created by Yoseob Lee on 6/29/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FISAddLocationViewControllerDelegate <NSObject>

// Need to create custom protocol for the delegate of FISAddLocationViewController
    // (FISAddLocationViewControllerDelegate) <-- NSObject
        // 1. method that alerts delegate that user hca cancelled "Add Location VC"
        // 2. method that asks delegate if given name is valid (no duplicates)
        // 3. method that alerts delegate that the user has confirmed new location mame
        // 4.

-(void)addLocationViewControllerDidCancel:(UIViewController *)viewController;
-(void)addLocationViewController:(UIViewController *)viewController didAddLocationNamed:(NSString *)locationName;

@optional

-(BOOL)addLocationViewController:(UIViewController *)viewController shouldAllowLocationNamed:(NSString *)locationName;
-(void)alertView;

@end
