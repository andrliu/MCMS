//
//  CreatureViewController.m
//  MCMS
//
//  Created by Supreme Overlord on 10/28/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.magicalCreature.name;

    if ([self.magicalCreature.detail isEqualToString:@"Elf"])
    {
        self.creatureImageView.image = [UIImage imageNamed:@"elf"];
    }

    else if ([self.magicalCreature.detail isEqualToString:@"Magician"])
    {
        self.creatureImageView.image = [UIImage imageNamed:@"magician"];
    }

    else if ([self.magicalCreature.detail isEqualToString:@"Grinch"])
    {
        self.creatureImageView.image = [UIImage imageNamed:@"grinch"];
    }

    else if ([self.magicalCreature.detail isEqualToString:@"Demon"])
    {
            self.creatureImageView.image = [UIImage imageNamed:@"demon"];
    }

    else if ([self.magicalCreature.detail isEqualToString:@"Wizard"])
    {
            self.creatureImageView.image = [UIImage imageNamed:@"wizard"];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accessoryCell" forIndexPath:indexPath];

    float i = arc4random_uniform(100)/100.0;

    if (i < 0.2)
    {
        cell.textLabel. text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[0]];
    }
    else if ( 0.21 <= i && i <0.42)
    {
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[1]];
    }
    else if ( 0.42 <= i && i <0.63)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[2]];
    }

    else if ( 0.63 <= i && i <0.84)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[3]];
    }
    else
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[4]];
        UIAlertController *startSign = [UIAlertController alertControllerWithTitle:@"" message: @"you got the CROWN!!!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *challengeButton = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault handler:nil];
        [startSign addAction:challengeButton];
        [self presentViewController: startSign animated:YES completion:nil];
    }

    return cell;
}



@end
