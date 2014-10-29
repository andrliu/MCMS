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

@property (weak, nonatomic) IBOutlet UITableViewCell *accessoryCell;



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
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accessoryCell" forIndexPath:indexPath];
    float i = arc4random_uniform(100)/100.0;


    if (i < 0.25) {
        cell.textLabel. text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[0]];
    }
    else if ( 0.25 <= i && i <0.5){
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[1]];
    }
    else if ( 0.5 <= i && i <0.75){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[2]];
    }

    else if ( 0.75 <= i && i <1){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[3]];
    }
    else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.magicalCreature.accessoryArray[4]];
    }

    return cell;
}



@end
