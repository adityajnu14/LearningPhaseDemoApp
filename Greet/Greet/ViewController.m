//
//  ViewController.m
//  Greet
//
//  Created by Aditya Kumar on 11/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)greetMassage:(id)sender{
    UIAlertView *alertMessage=[[UIAlertView alloc] initWithTitle:@"   Hello " message:@"Good Morning" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertMessage show];
    
}
@end
