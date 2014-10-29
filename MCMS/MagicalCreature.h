//
//  MagicalCreature.h
//  MCMS
//
//  Created by Andrew Liu on 10/28/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *detail;


-(instancetype)initWithName:(NSString *)name withDetail:(NSString *)detail;

@end
