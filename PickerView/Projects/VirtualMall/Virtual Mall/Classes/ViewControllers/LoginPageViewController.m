//
//  LoginPageViewController.m
//  Virtual Mall
//
//  Created by Aditya Kumar on 09/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "Utility.h"
#import "LoginPageViewController.h"

@interface LoginPageViewController () <UITextFieldDelegate>

@end

@implementation LoginPageViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self setTapGestureRecognizer];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setborderColor];
}

- (void) setTapGestureRecognizer
{
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void) dismissKeyboard
{
    [self.emailInputTextField resignFirstResponder];
    [self.passwordInputTextField resignFirstResponder];
}

- (void) setborderColor
{
    self.emailInputTextField.layer.borderColor = [UIColor colorWithRed:0.667 green:0.667 blue:0.667 alpha:1.0].CGColor;
    self.passwordInputTextField.layer.borderColor = [UIColor colorWithRed:0.667 green:0.667 blue:0.667 alpha:1.0].CGColor;
}

- (IBAction) loginButtonAction:(id)sender
{
    if([self authenticateUserCredential])
        [self performSegueWithIdentifier:@"loginUser" sender:nil];
    else if(![self.emailInputTextField.text isEqualToString:@"a@g.com"] && ![self.passwordInputTextField.text isEqualToString:@"abc"])
        [Utility promptErrorMessage:@"Invalid Email and Password" sender:self];
    else if(![self.emailInputTextField.text isEqualToString:@"a@g.com"])
        [Utility promptErrorMessage:@"Invalid Email" sender:self];
    else if(![self.passwordInputTextField.text isEqualToString:@"a@g.com"])
        [Utility promptErrorMessage:@"Invalid Password" sender:self];
    self.emailInputTextField.text = @"";
    self.passwordInputTextField.text = @"";
}

- (BOOL) authenticateUserCredential
{
    if([self.emailInputTextField.text isEqualToString:@"a@g.com"] && [self.passwordInputTextField.text isEqualToString:@"abc"])
        return YES;
    else
        return NO;
}

#pragma mark - UITextFieldDelegate

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    if(textField.tag == 1)
    {
       if(![Utility validateEmail:textField.text])
           [Utility promptErrorMessage:@"Enter valid Email" sender:self];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
@end
