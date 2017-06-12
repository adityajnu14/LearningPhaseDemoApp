//
//  ViewController.m
//  JSONApp
//
//  Created by Aditya Kumar on 20/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"
#import "UserDetail.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.reqres.in/api/users/2"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for(NSDictionary *fetchedData in json)
        {
            UserDetail* obj= [[UserDetail alloc]initWithFirstName:[fetchedData objectForKey:@"first_name"] lastName:[fetchedData objectForKey:@"last_name"] andimage:[fetchedData objectForKey:@"avatar"]];
            NSLog(@"%@\n%@\n%@",obj._firstName,obj._LastName,obj._imageName);
        }
        
    }];
    
    [dataTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
