//
//  pickerViewVC.h
//  PickerView
//
//  Created by Aditya Kumar on 09/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pickerViewVC : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerInputView;
@property (weak, nonatomic) IBOutlet UILabel *currencyUILabel;


@property  (strong, nonatomic) NSArray* countryNames;
@property (strong, nonatomic) NSArray* rate;

@end
