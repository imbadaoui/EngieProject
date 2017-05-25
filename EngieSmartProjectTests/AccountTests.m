//
//  AccountTests.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 25/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Account.h"
@interface AccountTests : XCTestCase

@property Account *account;
@end

@implementation AccountTests

- (void)setUp {
    [super setUp];
    self.account = [[Account alloc] initWithDictionary:@{@"user[name]":@"username", @"user[email]":@"username@engie.com", @"id":@11}];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatAccountHasTheRightName {
    XCTAssertEqualObjects(self.account.name, @"username", @"expecting an account to provide its name");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
- (void)testThatAccountHasTheRightEmail {
    XCTAssertEqualObjects(self.account.email, @"username@engie.com", @"expecting an account to provide its email");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
