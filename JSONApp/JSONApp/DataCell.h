//
//  DataCell.h
//  JSONApp
//
//  Created by Aditya Kumar on 20/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCell : UITableViewCell

@property (weak, nonatomic)IBOutlet UILabel* _firstNameLabeltext;
@property (weak, nonatomic)IBOutlet UILabel* _lastNameLabeltext;

@property (weak, nonatomic)IBOutlet UIImageView* _imageData;

@end
