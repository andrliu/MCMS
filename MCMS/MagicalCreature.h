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
@property NSMutableArray *accessoryArray;
@property NSMutableArray *imageArray;

//-(instancetype)initWithName:(NSString *)name withDetail:(NSString *)detail withAccessory:(NSMutableArray *)accessoryArray;
-(instancetype)initWithName:(NSString *)name withDetail:(NSString *)detail withAccessory:(NSMutableArray *)accessoryArray withImage:(NSMutableArray *)imageArray;
@end
