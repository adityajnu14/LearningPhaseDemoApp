//
//  ViewController.m
//  ScrollViewApp
//
//  Created by Aditya Kumar on 23/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self addScrollView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _scrollView.contentSize = CGSizeMake(_imgView.frame.size.width,
                                         _imgView.frame.size.height);
}

//-(void)addScrollView{
//    _scrollView = [[UIScrollView alloc]initWithFrame:
//                    CGRectMake(100, 100, 280, 420)];
//    _scrollView.accessibilityActivationPoint = CGPointMake(100, 100);
//    _imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"8.jpg"]];
//    [_scrollView addSubview:_imgView];
//    _scrollView.minimumZoomScale = 0.5;
//    _scrollView.maximumZoomScale = 3;
//    _scrollView.contentSize = CGSizeMake(_imgView.frame.size.width,
//                                          _imgView.frame.size.height);
//    _scrollView.delegate = self;
//    [self.view addSubview:_scrollView];
//}


//-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//    return _imgView;
//}
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"Did end decelerating");
//}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    //    NSLog(@"Did scroll");
//}
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
//                 willDecelerate:(BOOL)decelerate{
//    NSLog(@"Did end dragging");
//}
//-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"Did begin decelerating");
//}
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"Did begin dragging");
//}

@end
