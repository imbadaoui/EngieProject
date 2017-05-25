//
//  AppDelegate.h
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (Account *)loadAccount;
- (void)saveAccount:(Account *)account;
- (void)deleteUserPreferences;
@end

