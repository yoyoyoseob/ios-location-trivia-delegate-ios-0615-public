//
//  FISLocation.h
//  ios-location-trivia-delegate
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISLocation : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *trivia;

-(instancetype)initWithName:(NSString *)name trivia:(NSArray *)trivia;

@end
