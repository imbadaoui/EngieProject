//
//  User.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "User.h"

@implementation User

//- (id)initWithName:(NSString *)aName andEmail:(NSString *)anemail {
//    if (self = [super init]) {
//        _name = [aName copy];
//        _email = [anemail copy];
//    }
//    return self;
//}

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"email": @"email",
                                                                  @"name" : @"name"
                                                                  }];
}

@end
