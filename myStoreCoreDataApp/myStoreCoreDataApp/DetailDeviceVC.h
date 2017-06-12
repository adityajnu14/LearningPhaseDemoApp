//
//  DetailDeviceVC.h
//  myStoreCoreDataApp
//
//  Created by Aditya Kumar on 25/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"

@interface DetailDeviceVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField* nameTextField;
@property (weak, nonatomic) IBOutlet UITextField* versionTextField;
@property (weak, nonatomic) IBOutlet UITextField* companyTextField;

@property (strong) NSManagedObject* device;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
