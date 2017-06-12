//
//  ViewController.m
//  NetworkApp
//
//  Created by Aditya Kumar on 19/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downloadImage:(id)sender
{
//    NSURL* url = [NSURL URLWithString:urlStr];
//    NSData* imageData = [NSDat    NSString* urlStr = @" http://www.mindfiresolutions.com/_images_/a_new_logo.jpg";
//a dataWithContentsOfURL:url];
//    self._imageData.image = [UIImage imageWithData:imageData];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.mindfiresolutions.com/_images_/a_new_logo.jpg"]];
    
    // Create url connection and fire request
    NSURLConnection* conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];

}



#pragma mark NSURLConnection DElegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response
{
    self._responseData = [[NSMutableData alloc] init];

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
{
    [_responseData appendData:data];
    [self._imageData setImage:[UIImage imageWithData:data]];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse*)cachedResponse
{
    return nil;
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
   
    NSLog(@"%@",error);
  }


@end
