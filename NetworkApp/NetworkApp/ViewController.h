//
//  ViewController.h
//  NetworkApp
//
//  Created by Aditya Kumar on 19/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate>
{
    NSMutableData* _responseData;
}
@property NSMutableData* _responseData;
@property (weak, nonatomic) IBOutlet UIImageView* _imageData;
- (IBAction)downloadImage:(id)sender;


@end

