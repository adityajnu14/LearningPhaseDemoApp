//
//  main.m
//  firstProgram
//
//  Created by Aditya Kumar on 11/01/17.
//  Copyright © 2017 Mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Rate:NSObject
-(double) calculateIntrest:(double)P intrests:(int)r andtime:(int)t;
@end
@implementation Rate
-(double) calculateIntrest:(double)p intrests:(int)r andtime:(int)t
{
    return p*r*t/100;
}
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int time,rate;
        double principle,amount;
        NSLog(@"\nEnter  P R T");
        scanf("%lf %d %d",&principle,&rate,&time);
        Rate *obj=[[Rate alloc]init];
        amount=[obj calculateIntrest:principle intrests:rate andtime:time];
        NSLog(@"calculated principle is %f",amount);
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
