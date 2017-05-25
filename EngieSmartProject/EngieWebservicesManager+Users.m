//
//  EngieWebservicesManager+Users.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "EngieWebservicesManager+Users.h"

NSString * const kMethodPost = @"POST";
NSString * const kpathUsers = @"/users";

NSString * const kuser = @"user";
NSString * const kemail = @"email";
NSString * const kname = @"name";


@implementation EngieWebservicesManager (Users)


- (NSURLSessionDataTask *)subscribeWithEmail:(NSString *)email andName:(NSString *)name WithSuccess:(void (^)(Account * _Nonnull))success andFailure:(void (^)(NSError * _Nonnull))failure {
    
    NSString * method = kMethodPost;
    NSString * path = kpathUsers;
    NSDictionary *user = @{kemail: email,
                                kname : name
                                   };
    NSDictionary *parameters = @{kuser: user
                                 };
    
    return [self requestWithMethod:method
                           andPath:path
                     andParameters:parameters
                           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable object)
            {
                NSError * error;
                id jsonObject = [NSJSONSerialization JSONObjectWithData:(NSData *)object options:0 error:&error];
                NSDictionary *parsedObject = (id)jsonObject;
                
                if (error == nil) {
                    Account *account = [[Account alloc] initWithDictionary:parsedObject];
                    success(account);
                } else
                {
                    failure(error);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull e)
            {
                failure(e);
            }];
}
@end
