//
//  SubscriptionViewController.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "SubscriptionViewController.h"
#import "User.h"
#import "EngieWebservicesManager+Users.h"
#import "ProfileViewController.h"
#import "NSString+EmailValidation.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"

NSString * const kerrorSubscription = @"errorMsgSubscription";
NSString * const kerror = @"error";
NSString * const kuserInfoDescription = @"NSLocalizedDescription";

@implementation SubscriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma Action User
- (IBAction)createAccount:(id)sender {
    // Check users input
    if (self.nameTextField.text.length && self.emailTextField.text.length > 0 && [self.emailTextField.text isValidEmail]) {
        [self subscribeActionWithEmail:self.emailTextField.text andName:self.nameTextField.text];
    } else {
        [self showAlertError:NSLocalizedString(kerror, nil) andDescription:NSLocalizedString(kerrorSubscription, nil)];
    }
}

- (void) subscribeActionWithEmail:(NSString *)email andName:(NSString *)name {
    [[EngieWebservicesManager sharedInstance] subscribeWithEmail:email andName:name WithSuccess:^(Account * _Nonnull account) {
        if (account) {
            [self saveAccount:account];
            [self goToProfilePage];
        }
    } andFailure:^(NSError * _Nonnull error) {
        if (error.userInfo[kuserInfoDescription] != nil) {
            [self showAlertError:NSLocalizedString(kerror, nil) andDescription:error.userInfo[kuserInfoDescription]];
        }
        
    }];
}

- (void)showAlertError:(NSString *)title andDescription:(NSString *)description {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:description delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)saveAccount:(Account *)account {
    AppDelegate * app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app saveAccount:account];
}

- (void)goToProfilePage {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SWRevealViewController *revealViewController = [storyboard instantiateViewControllerWithIdentifier:@"RevealVCIdentifier"];
    [self presentViewController:revealViewController animated:YES completion:nil];
}
@end
