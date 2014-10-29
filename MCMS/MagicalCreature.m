//
//  MagicalCreature.m
//  MCMS
//
//  Created by Andrew Liu on 10/28/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name withDetail:(NSString *)detail
{
    self = [super init];
    self.name = name;
    self.detail = detail;
    return self;
}
@end
