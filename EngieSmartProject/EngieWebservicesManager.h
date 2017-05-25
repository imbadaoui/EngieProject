//
//  EngieWebservicesManager.h
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface EngieWebservicesManager : AFHTTPSessionManager
@property (nonatomic, strong) NSURL *baseURL;

+ (EngieWebservicesManager * _Nonnull)sharedInstance;

- (NSURLSessionDataTask * _Nullable)requestWithMethod:(NSString * _Nonnull)method
                                              andPath:(NSString * _Nonnull)path
                                        andParameters:(id _Nullable)parameters
                                              success:(void (^ _Nonnull)(NSURLSessionDataTask * _Nonnull task, id _Nullable object))success
                                              failure:(void (^ _Nonnull)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull e))failure;

@end
