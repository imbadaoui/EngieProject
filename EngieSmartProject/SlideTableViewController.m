//
//  SlideTableViewController.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "SlideTableViewController.h"
#import "HomePageViewController.h"
#import "AppDelegate.h"

@interface SlideTableViewController() <UIAlertViewDelegate>

@end

NSString * const kprofile = @"profile";
NSString * const khistory = @"historique";
NSString * const klogout = @"logout";
NSString * const kcellId = @"CellId";
NSString * const kmsgconfirmationKey = @"backhomemsg";
NSString * const kcancel = @"cancel";
NSString * const kconfirmation = @"Confirmation";

@implementation SlideTableViewController  {
    NSArray *menuItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:38.0/255.0 green:39.0/255.0 blue:45.0/255.0 alpha:1];
    menuItems = @[kprofile, khistory, klogout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return menuItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Menu";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = kcellId;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:38.0/255.0 green:39.0/255.0 blue:45.0/255.0 alpha:1];
    cell.textLabel.text = [menuItems objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[menuItems objectAtIndex:indexPath.row]];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        [self showAlertConfirmation:@"Confirmation" andDescription:NSLocalizedString(kmsgconfirmationKey, nil)];
    }
}

- (void)showAlertConfirmation:(NSString *)title andDescription:(NSString *)description {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:description delegate:self cancelButtonTitle:NSLocalizedString(kcancel, nil) otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self deleteUserPreferences];
        [self goToHomePage];
    }
}

- (void)goToHomePage {
    UIStoryboard *storyboard = [self storyboard];
    HomePageViewController *homevc = [storyboard instantiateViewControllerWithIdentifier:@"HomeVCIdentifier"];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:homevc];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = nv;
}

- (void)deleteUserPreferences {
    AppDelegate * app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app deleteUserPreferences];
}

@end
