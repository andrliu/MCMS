//
//  MagicalCreature.h
//  MCMS
//
//  Created by Andrew Liu on 10/28/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *detail;
@property NSMutableArray *accessoryArray;
@property UIImage *image;

-(instancetype)initWithName:(NSString *)name withDetail:(NSString *)detail withAccessory:(NSMutableArray *)accessoryArray withImage:(UIImage *)image;

-(instancetype)initWithDetail:(NSString *)detail withAccessory:(NSMutableArray *)accessoryArray withImage:(UIImage *)image;

@end
