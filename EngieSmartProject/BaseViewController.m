//
//  BaseViewController.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 25/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:65.0/255.0 green:151.0/255.0 blue:246.0/255.0 alpha:0.8];
    [self setDefaultNavigationTitle];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
/**
 *  Unique navigation bar title (ENGIE image logo)
 */
- (void)setDefaultNavigationTitle
{
    [self.navigationController setNavigationBarHidden:NO];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [imgView setImage:[UIImage imageNamed:@"engie_ico"]];
    imgView.image = [imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imgView setTintColor:[UIColor whiteColor]];
    [imgView setContentMode:UIViewContentModeScaleAspectFill];
    self.navigationItem.titleView = imgView;
}

@end
