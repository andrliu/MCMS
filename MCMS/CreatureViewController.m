//
//  CreatureViewController.m
//  MCMS
//
//  Created by Supreme Overlord on 10/28/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.magicalCreature.name;
}

@end
