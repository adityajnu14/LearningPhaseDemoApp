//
//  UserDetail.m
//  JSONApp
//
//  Created by Aditya Kumar on 20/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "UserDetail.h"

@implementation UserDetail

-(instancetype)initWithFirstName:(NSString *)fname lastName:(NSString *)lname andimage:(NSString *)iName
{
    self = [super init];
    if(self)
    {
        self._firstName = fname;
        self._LastName = lname;
        self._imageName = iName;
    }
    return self;
}

@end
