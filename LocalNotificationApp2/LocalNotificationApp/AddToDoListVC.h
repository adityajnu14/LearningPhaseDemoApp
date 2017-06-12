//
//  AddToDoListVC.h
//  LocalNotificationApp
//
//  Created by Aditya Kumar on 01/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddToDoListVC : UIViewController<UITableViewDelegate, UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField* itemText;
@property (weak, nonatomic) IBOutlet UIDatePicker* datePicker;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@end
