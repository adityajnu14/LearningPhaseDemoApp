//
//  ViewController.m
//  TableView
//
//  Created by Aditya Kumar on 16/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray* tableCellName;
    NSArray* tableCellPhone;
    NSArray* tableCellEmail;
    NSArray* tableCellImage;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tableCellName = [NSArray arrayWithObjects:@"Aditya",@"Mohini",@"Shivangi",@"Naheed",@"Chandan",@"Ajay",@"Shamshad",nil];
    tableCellPhone = [NSArray       arrayWithObjects:@"123456789",@"789456123",@"524789654",@"254789635",@"547896547",@"123647896",@"125478993",nil];
    tableCellEmail = [NSArray arrayWithObjects:@"Aditya@gamil.com",@"Mohini@gamil.com",@"Shivangi@gamil.com",@"Naheed@gamil.com",@"Chandan@gamil.com",@"Ajay@gamil.com",@"Shamshad@gamil.com",nil];
    tableCellImage = [NSArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",nil];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    tableCellName = [dict objectForKey:@"RecipeName"];
    tableCellPhone = [dict objectForKey:@"Thumbnail"];
    tableCellEmail = [dict objectForKey:@"PrepTime"];
    tableCellImage = [dict objectForKey:@"tableCellImage"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableCellName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [tableCellName objectAtIndex:indexPath.row];
    return cell;
}

@end
