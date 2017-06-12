//
//  ViewController.m
//  BlockDemo
//
//  Created by Aditya Kumar on 24/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)blockTestMethod;
-(void)addTwoNumberBlockDemo:(int)number1 withNumber:(int)number2 andComplitionHandler:(void(^)(int result))completionHandler;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self blockTestMethod];
    [self addTwoNumberBlockDemo:50 withNumber:10 andComplitionHandler:^(int result){
        NSLog(@"Result from handler is %d",result);
    }];
    
    
}

- (void)addTwoNumberBlockDemo:(int)number1 withNumber:(int)number2 andComplitionHandler:(void (^)(int))completionHandler
{
    int result = number1 + number2;
    completionHandler(result);
}

- (void)blockTestMethod
{
    __block int someValue=10;
    
    int (^operation)(void) = ^(void)
    {
        someValue+=5;
        return someValue;
    };
    
    NSLog(@"%d",operation());
    NSLog(@"%d",operation());

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
