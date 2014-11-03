//
//  BattleViewController.m
//  MCMS
//
//  Created by Andrew Liu on 11/2/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "BattleViewController.h"
#import "MagicalCreature.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *creatureBattleImage;
@property (weak, nonatomic) IBOutlet UILabel *hpLabel;
@property (weak, nonatomic) IBOutlet UILabel *atkLabel;

@end

@implementation BattleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.creatureBattleImage.image = self.creatureImage;
    int randomHP = arc4random_uniform(100) +1;
    self.hpLabel.text = [NSString stringWithFormat:@"%d", randomHP];
}

- (IBAction)fightButton:(UIButton *)sender
{
    int randomATK = arc4random_uniform(100) +1;
    self.atkLabel.text = [NSString stringWithFormat:@"%d", randomATK];
    [self winner];
}

- (void)winner
{
    int hp = [self.hpLabel.text intValue];
    int atk = [self.atkLabel.text intValue];

    if (atk > hp)
    {
        UIAlertController *win = [UIAlertController alertControllerWithTitle:@"Congratulation"
                                                                     message: @"You have defeated the monster"
                                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *restart = [UIAlertAction actionWithTitle:@"Restart"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            [self dismissViewControllerAnimated:YES completion:nil];
                                                        }];
        [win addAction:restart];
        [self presentViewController: win animated:YES completion:nil];
    }
    else
    {
        UIAlertController *lose = [UIAlertController alertControllerWithTitle:@"Loser"
                                                                      message: @"You have failed this city"
                                                               preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *restart = [UIAlertAction actionWithTitle:@"Restart"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            [self dismissViewControllerAnimated:YES completion:nil];
                                                        }];
        [lose addAction:restart];
        [self presentViewController: lose animated:YES completion:nil];
    }
}

@end
