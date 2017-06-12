//
//  HomePageViewController.m
//  Virtual Mall
//
//  Created by Aditya Kumar on 10/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self addLogoutButton];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) addLogoutButton
{
    UIBarButtonItem* logoutButton = [[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logoutUser)];
    self.navigationItem.leftBarButtonItem = logoutButton;
}

- (void) logoutUser
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
