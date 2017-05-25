//
//  ProfileViewController.h
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"
#import "BaseViewController.h"

@interface ProfileViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (nonatomic) Account *userAccount;
@end
