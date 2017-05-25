//
//  EngieWebservicesManager+Users.h
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "EngieWebservicesManager.h"
#import "Account.h"
@interface EngieWebservicesManager (Users)

- (NSURLSessionDataTask * _Nullable)subscribeWithEmail:(NSString *_Nullable)email andName:(NSString *_Nullable)name WithSuccess:(void (^ _Nonnull)(Account * _Nonnull account))success
                                              andFailure:(void (^ _Nonnull)(NSError * _Nonnull error))failure;

@end
