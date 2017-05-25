//
//  ProfileViewController.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "ProfileViewController.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"

NSString * const kwelcomeMsg = @"welcomeMsg";

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if ( revealViewController )
    {
        [self.sideBarButton setTarget: self.revealViewController];
        [self.sideBarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    [self updateView];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)updateView {
    self.userAccount = [self loadAccount];
    if (self.userAccount != nil) {
        self.welcomeLabel.text = [NSString stringWithFormat:NSLocalizedString(kwelcomeMsg, nil), self.userAccount.name, self.userAccount.email];
    }
}

- (Account *)loadAccount {
    AppDelegate * app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    Account *accountloaded = [app loadAccount];
    
    if (accountloaded) {
        return accountloaded;
    }
    return nil;
}


@end
