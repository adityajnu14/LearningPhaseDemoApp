//
//  ViewController.m
//  NSNotificationApp
//
//  Created by Aditya Kumar on 01/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)postNotificationWithString:(NSString *)orientation;
- (void)useNotificationWithString:(NSNotification*)notification;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *notificationName = @"MTPostNotificationTut";
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(useNotificationWithString:) // here useNotificationWithString method is finally called when noticiation happend
     
     name:notificationName
     object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)postNotificationWithString:(NSString *)orientation //post notification method and logic
{
    NSString *notificationName = @"MTPostNotificationTut";
    NSString *key = @"OrientationStringValue";
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:orientation forKey:key];
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil userInfo:dictionary];
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        [self postNotificationWithString:@"Portrait"];
    }
    else {
        [self postNotificationWithString:@"Landscape"];
    }
}


- (void)useNotificationWithString:(NSNotification *)notification //use notification method and logic
{
  
    NSString *key = @"OrientationStringValue";
    NSDictionary *dictionary = [notification userInfo];
    NSString *stringValueToUse = [dictionary valueForKey:key];
    NSLog(@"Device orientation --> %@",stringValueToUse);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Rotated" message:[NSString stringWithFormat:@"%@",stringValueToUse] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
