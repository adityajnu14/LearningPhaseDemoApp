//
//  UserDetail.h
//  JSONApp
//
//  Created by Aditya Kumar on 20/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDetail : NSObject

@property (nonatomic, strong)NSString* _firstName;
@property (nonatomic, strong)NSString* _LastName;
@property (nonatomic, strong)NSString* _imageName;


-(instancetype)initWithFirstName:(NSString *)fname lastName:(NSString *)lname andimage:(NSString *)iName;

@end
