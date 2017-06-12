//
//  ContactTableCell.m
//  customDelegateDemo
//
//  Created by Aditya Kumar on 10/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ContactTableCell.h"

@implementation ContactTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataToTableCellWithName:(NSString*)contactName contact:(NSString*)contactNumber
{
    self.nameLabelField.text = contactName;
    self.contactLabelField.text = contactNumber;
}

@end
