//
//  FISAddLocationViewController.m
//  ios-location-trivia-delegate
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISAddLocationViewController.h"

@interface FISAddLocationViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation FISAddLocationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.nameField becomeFirstResponder];
    self.nameField.delegate = self;
    self.saveButton.enabled = NO;
    
}

-(IBAction)cancelButtonTapped:(id)sender
{
    [self.delegate addLocationViewControllerDidCancel:self];
}

-(IBAction)saveButtonTapped:(id)sender
{
    [self.delegate addLocationViewController:self didAddLocationNamed:self.nameField.text];
    [self.delegate addLocationViewControllerDidCancel:self];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    if ([self.delegate addLocationViewController:self shouldAllowLocationNamed:textField.text])
//    {
        self.saveButton.enabled = YES;
//        return YES;
//    }
//    [self alertView];
//    return NO;
    [self.nameField resignFirstResponder];
    return YES;
}

-(void)alertView
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sorry!" message:@"It seems that location already exists" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        self.nameField.text = @"";
    }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
