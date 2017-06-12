//
//  addContactViewController.m
//  customDelegateDemo
//
//  Created by Aditya Kumar on 09/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "addContactViewController.h"

@interface addContactViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *contactTextField;

@end

@implementation addContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.contactTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)addContactButton:(id)sender
{
    [self.delegate addContact:self.nameTextField.text number:self.contactTextField.text];
    [self doneButton:nil];
}
- (IBAction)doneButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        if ([newString rangeOfCharacterFromSet:characterSet].location != NSNotFound)
        {
            return NO;
        }
    
    return YES;
}


@end
