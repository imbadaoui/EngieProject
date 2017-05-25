//
//  User.h
//  EngieSmartProject
//
//  Created by Imad BADAOUI on 24/05/2017.
//  Copyright © 2017 Imad BADAOUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface User : JSONModel

@property (nonatomic) NSString *email;
@property (nonatomic) NSString *name;


@end
