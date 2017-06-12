//
//  ViewController.m
//  colorfic
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

-(IBAction)changeColor:(id)sender{
    int r=arc4random()%255;
    int g=arc4random()%255;
    int b=arc4random()%255;
    UIColor *color=[UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0];
    [self.view setBackgroundColor:color];
}

@end
