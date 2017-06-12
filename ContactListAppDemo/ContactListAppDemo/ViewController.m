//
//  ViewController.m
//  ContactListAppDemo
//
//  Created by Aditya Kumar on 09/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"
#import "ContactList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[ContactList sharedContacts] fetchAllContacts]; //fetch all contacts
    if ([[ContactList sharedContacts]totalPhoneNumberArray].count !=0) {
        NSLog(@"Fetched Contact Details : %ld",[[ContactList sharedContacts] totalPhoneNumberArray].count);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
