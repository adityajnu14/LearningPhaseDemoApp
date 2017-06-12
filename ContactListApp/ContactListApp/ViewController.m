//
//  ViewController.m
//  ContactListApp
//
//  Created by Aditya Kumar on 09/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"
#import "KTSContactsManager.h"

@interface ViewController ()
{
    KTSContactsManager* contactsManager;
}
@end

@implementation ViewController

#pragma mark - life cycle method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchContactData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method

- (void) fetchContactData
{
    contactsManager = [KTSContactsManager sharedManager];
    [contactsManager importContacts:^(NSArray *contacts)
    {
        NSLog(@"contacts: %@",contacts);
    }];
}


@end
