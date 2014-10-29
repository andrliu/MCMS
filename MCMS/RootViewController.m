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
    //I ave a question here about implementing NSMutableArray with accessory objects
    //Confusion on why can't use Custom class to classify object.
    NSMutableArray *accessoryArray = [@[@"Sword", @"Mace", @"Potion", @"Toys", @"Spell"]mutableCopy];
    MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.creatureTextField.text
                                                           withDetail:self.creatureDetailTextField.text withAccessory:accessoryArray];
    [self.creatures addObjectsFromArray:@[creature]];
    self.creatureTextField.text = @"";
    self.creatureDetailTextField.text = @"";
    [self.creatureTextField resignFirstResponder];
    [self.creatureDetailTextField resignFirstResponder];
    [self.creatureTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSInteger rowNumber = [self.creatureTableView indexPathForSelectedRow].row;
    MagicalCreature *theCreature = [self.creatures objectAtIndex:rowNumber];
    vc.magicalCreature = theCreature;


}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)editButton
{
    if ([editButton.title isEqualToString:@"Edit"]) {
        editButton.title = @"Done";
        self.creatureTextField.hidden = NO;
        self.hiddenTextFieldLabel.hidden = YES;
        self.creatureDetailTextField.hidden = NO;
        self.hiddenDetailTextFieldLabel.hidden = YES;


    } else {
        editButton.title = @"Edit";
        self.hiddenTextFieldLabel.hidden = NO;
        self.creatureTextField.hidden = YES;
        self.hiddenDetailTextFieldLabel.hidden = NO;
        self.creatureDetailTextField.hidden = YES;
    }

}

@end
