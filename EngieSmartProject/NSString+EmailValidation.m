//
//  NSString+EmailValidation.m
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import "NSString+EmailValidation.h"

NSString * const kfilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
NSString * const klaxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";

@implementation NSString (EmailValidation)

-(BOOL)isValidEmail
{
    BOOL stricterFilter = NO; 
    NSString *stricterFilterString = kfilterString;
    NSString *laxString = klaxString;
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
