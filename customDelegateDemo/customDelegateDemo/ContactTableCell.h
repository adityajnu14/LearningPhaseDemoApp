//
//  ContactTableCell.h
//  customDelegateDemo
//
//  Created by Aditya Kumar on 10/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel* nameLabelField;
@property (weak, nonatomic) IBOutlet UILabel* contactLabelField;

- (void)setDataToTableCellWithName:(NSString*)contactName contact:(NSString*)contactNumber;
@end
