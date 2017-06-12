//
//  Utility.m
//  Virtual Mall
//
//  Created by Aditya Kumar on 06/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "LoginPageViewController.h"
#import "Utility.h"

@implementation Utility

+ (NSString*) getDcoumentDirectoryPath
{
    //To BE DONE
    return @"";
}

+ (BOOL) validateEmail:(NSString*)emailString
{
    NSString* emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailString];
}

+ (void) promptErrorMessage:(NSString*)message sender:(UIViewController*)sender
{
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = sender.view.frame;
    [sender.view addSubview:visualEffectView];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert!"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction* action){
                                                   [visualEffectView removeFromSuperview];
                                               }];
    [alert addAction:ok];
    [sender presentViewController:alert animated:YES completion:nil];
}
@end
