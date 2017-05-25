//
//  EngieWebservicesManager.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "EngieWebservicesManager.h"

NSString * const kurlEndoint = @"http://jsonplaceholder.typicode.com";

@implementation EngieWebservicesManager

+ (EngieWebservicesManager * _Nonnull)sharedInstance
{
    static dispatch_once_t onceToken;
    static EngieWebservicesManager * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[EngieWebservicesManager alloc] initWithEndpoint:kurlEndoint];
    });
    return instance;
}

- (instancetype)initWithEndpoint:(NSString*)endpoint
{
    if ([endpoint hasSuffix:@"/"])
        endpoint = [endpoint substringToIndex:endpoint.length - 1];
    
    if (self = [super initWithBaseURL:[NSURL URLWithString:endpoint]])
    {
        self.baseURL = [NSURL URLWithString:endpoint];
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        [self.requestSerializer setValue:@"application/json"
                      forHTTPHeaderField:@"Accept"];
    }
    return self;
}

- (NSURLSessionDataTask * _Nullable)requestWithMethod:(NSString * _Nonnull)method
                                              andPath:(NSString * _Nonnull)path
                                        andParameters:(id _Nullable)parameters
                                              success:(void (^ _Nonnull)(NSURLSessionDataTask * _Nonnull task, id _Nullable object))success
                                              failure:(void (^ _Nonnull)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull e))failure
{
    if (![path hasPrefix:@"/"])
        path = [NSString stringWithFormat:@"/%@", path];

    NSString * completeURL = [NSString stringWithFormat:@"%@%@", self.baseURL, path];
    NSLog(@"Engie_WS : [%@] %@", method, completeURL);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    if ([method isEqualToString:@"POST"])
    {
        return [self POST:completeURL
              parameters:parameters
                progress:nil
                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                     [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                     success(task, responseObject);
                 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                     [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                     failure(task, error);
                 }];
    }
    return nil;
}


@end
