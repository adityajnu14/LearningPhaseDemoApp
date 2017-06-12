//
//  ContactCell.h
//  TableView
//
//  Created by Aditya Kumar on 16/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactCell : UITableViewCell
{
    IBOutlet UILabel* _nameLbl;
    IBOutlet UILabel* _pnoneLbl;
    IBOutlet UILabel* _emailLbl;
    
    IBOutlet UIImage* _image;
    
}

@end
