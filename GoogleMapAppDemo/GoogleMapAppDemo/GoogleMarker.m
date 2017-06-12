//
//  GoogleMarker.m
//  GoogleMapAppDemo
//
//  Created by Aditya Kumar on 07/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "GoogleMarker.h"

@implementation GoogleMarker

-(BOOL)isEqual:(id)object
{
    GoogleMarker* otherMarker = (GoogleMarker*)object;
    if([self.googleMarkderId isEqual:otherMarker.googleMarkderId])
        return  YES;
    else
        return  NO;
}

-(NSUInteger)hash
{
   return [self.googleMarkderId hash];
}
@end
