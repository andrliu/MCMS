//
//  CreatureViewController.m
//  MCMS
//
//  Created by Supreme Overlord on 10/28/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()<UITabBarDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (strong, nonatomic) IBOutlet UITableView *accessoryTableView;



@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.magicalCreature.name;

    if
        ([self.magicalCreature.detail isEqualToString:@"Elf"])
    {
        self.creatureImageView.image = [UIImage imageNamed:@"elf"];
    }
    else if
        ([self.magicalCreature.detail isEqualToString:@"Magician"])
    {
        self.creatureImageView.image = [UIImage imageNamed:@"magician"];
    }
    else if
        ([self.magicalCreature.detail isEqualToString:@"Grinch"])
    {
        self.creatureImageView.image = [UIImage imageNamed:@"grinch"];
    }
    else if
        ([self.magicalCreature.detail isEqualToString:@"Demon"])
    {
            self.creatureImageView.image = [UIImage imageNamed:@"demon"];
    }
    else if
        ([self.magicalCreature.detail isEqualToString:@"Wizard"])
    {
            self.creatureImageView.image = [UIImage imageNamed:@"wizard"];
        }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MagicalCreature *creature = self.creatures[indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;
    return cell;
}



@end
