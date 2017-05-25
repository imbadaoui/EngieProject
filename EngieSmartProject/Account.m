//
//  Account.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "Account.h"

@implementation Account

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
                _name = dictionary[@"user[name]"];
                _email = dictionary[@"user[email]"];
                _identifier = (int)dictionary[@"id"];
            }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.email forKey:@"email"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        _name = [decoder decodeObjectForKey:@"name"];
        _email = [decoder decodeObjectForKey:@"email"];
    }
    return self;
}
@end
