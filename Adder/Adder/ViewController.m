//
//  ViewController.m
//  Adder
//
//  Created by Aditya Kumar on 12/01/17.
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
//#pragma mark - Button Action

- (IBAction)getAdditonResult:(id)sender {
    
    float firstNumberByUser=[textFieldFirstNo.text floatValue];
    int secondNumberByUser=[textFieldSecondNo.text floatValue];
    textFieldResult.text=[NSString stringWithFormat:@"%.4f",firstNumberByUser+secondNumberByUser];
    
    
}

@end
