//
//  ContactViewController.m
//  customDelegateDemo
//
//  Created by Aditya Kumar on 09/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "addContactViewController.h"
#import "DataManager.h"
#import "ContactTableCell.h"
#import "ContactViewController.h"

@interface ContactViewController () <UITableViewDelegate, UITableViewDataSource, addContactdelegate>
{
    NSMutableArray* _contactData;
}
@property (weak, nonatomic) IBOutlet UITableView *contactTableView;
@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchContactDataFromPlist];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonAction:(id)sender
{
     [self performSegueWithIdentifier:@"addContact" sender:nil];
}

#pragma mark - UITableViewDataSource delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _contactData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* sIdentifiers = @"Cell";
    ContactTableCell* cell = [tableView dequeueReusableCellWithIdentifier:sIdentifiers];
    if(cell == nil)
    {
        NSArray* tableCell = [[NSBundle mainBundle]loadNibNamed:@"ContactCell" owner:nil options:nil];
        cell = [tableCell objectAtIndex:0];
    }
    NSString* contactName = [[_contactData objectAtIndex:indexPath.row] objectForKey:@"name"];
    NSString* contactNumber = [[_contactData objectAtIndex:indexPath.row] objectForKey:@"number"];
    [tableView setRowHeight:cell.frame.size.height];
    [cell setDataToTableCellWithName:contactName contact:contactNumber];
    return cell;
}

- (void)fetchContactDataFromPlist
{
    _contactData = [DataManager getContactDataFromPlist];
}

#pragma mark - addContact delegate

- (void)addContact:(NSString*)contactName number:(NSString*)contactNumber
{
    BOOL isSaved = [DataManager saveContactDataToPlistWithName:contactName contact:contactNumber];
    if(isSaved)
    {
        NSLog(@"Contact saved Successfully");
    }
    else
    {
        NSLog(@"Contact not saved");
    }
    [self fetchContactDataFromPlist];
    [self.contactTableView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"addContact"])
    {
        [(id)segue.destinationViewController setDelegate:self];
    }
}
@end
