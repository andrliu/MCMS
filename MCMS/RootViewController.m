//
//  ViewController.m
//  MCMS
//
//  Created by Andrew Liu on 10/28/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "RootViewController.h"
#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITextField *creatureTextField;
@property (weak, nonatomic) IBOutlet UILabel *hiddenTextFieldLabel;
@property (weak, nonatomic) IBOutlet UITextField *creatureDetailTextField;
@property (weak, nonatomic) IBOutlet UILabel *hiddenDetailTextFieldLabel;
@property (strong, nonatomic) IBOutlet UITableView *creatureTableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatures = [NSMutableArray array];
//    NSMutableArray *imageArray = [@[[UIImage imageNamed:@"elf"],
//                                    [UIImage imageNamed:@"grinch"],
//                                    [UIImage imageNamed:@"magician"],
//                                    [UIImage imageNamed:@"demon"],
//                                    [UIImage imageNamed:@"wizard"]] mutableCopy];
//    NSMutableArray *accessoryArray = [@[@"Sword",
//                                        @"Mace",
//                                        @"Potion",
//                                        @"Toys",
//                                        @"Crown"] mutableCopy];
//    MagicalCreature *objectElf = [[MagicalCreature alloc]initWithName:@"Elf"
//                                                           withDetail:@"Elf"
//                                                        withAccessory:accessoryArray
//                                                            withImage:imageArray];
//    MagicalCreature *objectGrinch = [[MagicalCreature alloc]initWithName:@"Grinch"
//                                                              withDetail:@"Grinch"
//                                                           withAccessory:accessoryArray
//                                                               withImage:imageArray];
//    MagicalCreature *objectMagician = [[MagicalCreature alloc]initWithName:@"Magician"
//                                                                withDetail:@"Magician"
//                                                             withAccessory:accessoryArray
//                                                                 withImage:imageArray];
//    MagicalCreature *objectDemon = [[MagicalCreature alloc]initWithName:@"Demon"
//                                                             withDetail:@"Demon"
//                                                          withAccessory:accessoryArray
//                                                              withImage:imageArray];
//    MagicalCreature *objectWizard = [[MagicalCreature alloc]initWithName:@"Wizard"
//                                                              withDetail:@"Wizard"
//                                                           withAccessory:accessoryArray
//                                                               withImage:imageArray];
//    [self.creatures addObjectsFromArray:@[objectElf,objectGrinch,objectMagician,objectDemon,objectWizard]];
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

- (IBAction)onButtonPressedAddCreature:(UIBarButtonItem *)sender
{
    NSMutableArray *accessoryArray = [@[@"Sword",
                                        @"Mace",
                                        @"Potion",
                                        @"Toys",
                                        @"Crown"]mutableCopy];
    NSMutableArray *imageArray = [@[[UIImage imageNamed:@"elf"],
                                    [UIImage imageNamed:@"grinch"],
                                    [UIImage imageNamed:@"magician"],
                                    [UIImage imageNamed:@"demon"],
                                    [UIImage imageNamed:@"wizard"]] mutableCopy];
    MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.creatureTextField.text
                                                           withDetail:self.creatureDetailTextField.text
                                                        withAccessory:accessoryArray
                                                            withImage:imageArray];
    [self.creatures addObjectsFromArray:@[creature]];
    self.creatureTextField.text = @"";
    self.creatureDetailTextField.text = @"";
    [self.creatureTextField resignFirstResponder];
    [self.creatureDetailTextField resignFirstResponder];
    [self.creatureTableView reloadData];
}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)editButton
{
    if ([editButton.title isEqualToString:@"Edit"]) {
        editButton.title = @"Done";
        self.creatureTextField.hidden = NO;
        self.creatureDetailTextField.hidden = NO;
        self.hiddenTextFieldLabel.hidden = YES;
        self.hiddenDetailTextFieldLabel.hidden = YES;
        self.navigationItem.rightBarButtonItem.enabled = YES;
    } else {
        editButton.title = @"Edit";
        self.navigationItem.rightBarButtonItem.enabled = YES;
        self.creatureTextField.hidden = YES;
        self.creatureDetailTextField.hidden = YES;
        self.hiddenTextFieldLabel.hidden = NO;
        self.hiddenDetailTextFieldLabel.hidden = NO;
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSInteger rowNumber = [self.creatureTableView indexPathForSelectedRow].row;
    MagicalCreature *theCreature = [self.creatures objectAtIndex:rowNumber];
    vc.magicalCreature = theCreature;
}

@end
