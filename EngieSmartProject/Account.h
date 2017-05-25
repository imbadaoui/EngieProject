//
//  Account.h
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Account : NSObject

@property (readonly) NSInteger identifier;
@property (readonly) NSString *email;
@property (readonly) NSString *name;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
