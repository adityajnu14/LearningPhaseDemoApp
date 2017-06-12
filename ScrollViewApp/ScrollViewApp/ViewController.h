//
//  ViewController.h
//  ScrollViewApp
//
//  Created by Aditya Kumar on 23/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    IBOutlet UIScrollView* _scrollView;
}
@property (strong, retain)IBOutlet UIImageView* imgView;

@end

