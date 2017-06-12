//
//  TumblrHomeViewController.h
//  TumblrInterationDemo
//
//  Created by Aditya Kumar on 25/04/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TumblrHomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

- (IBAction)shareButtonAction:(id)sender;
@end
