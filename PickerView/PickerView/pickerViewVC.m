//
//  pickerViewVC.m
//  PickerView
//
//  Created by Aditya Kumar on 09/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "pickerViewVC.h"

@interface pickerViewVC ()

@end

@implementation pickerViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _countryNames = @[@"Australia (AUD)", @"China (CNY)",
                      @"France (EUR)", @"Great Britain (GBP)", @"Japan (JPY)"];
    
    _rate = @[ @0.9922f, @6.5938f, @0.7270f,
                        @0.6206f, @81.57f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return _countryNames.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return _countryNames[row];
} 


#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    float rate = [_rate[row] floatValue];
    float dollars = [_inputTextField.text floatValue];
    float result = dollars * rate;
    
    NSString *resultString = [[NSString alloc] initWithFormat:
                              @"%.2f USD = %.2f %@", dollars, result,
                              _countryNames[row]];
    _currencyUILabel.text = resultString;
}


@end
