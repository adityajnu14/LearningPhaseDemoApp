//
//  addContactViewController.h
//  customDelegateDemo
//
//  Created by Aditya Kumar on 09/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class addContactViewController;
@protocol addContactdelegate
- (void)addContact:(NSString*)contactName number:(NSString*)contactNumber;
@end

@interface addContactViewController : UIViewController

@property (weak, nonatomic)id <addContactdelegate> delegate;
@end
