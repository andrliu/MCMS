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
@property (weak, nonatomic) IBOutlet UITextField *creatureTextField;
@property (weak, nonatomic) IBOutlet UILabel *hiddenTextFieldLabel;
@property (strong, nonatomic) IBOutlet UITableView *creatureTableView;
@property NSMutableArray *creature;
@property MagicalCreature *angel;
@property MagicalCreature *phoenix;
@property MagicalCreature *troll;
@property MagicalCreature *giant;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.creature = [NSMutableArray array];

    self.angel = [[MagicalCreature alloc] initWithName:@"Angela"
                                            withDetail:@"Angel"
                                         withAccessory:[@[@"Sword",
                                                          @"Wings",
                                                          @"Shield"]mutableCopy]
                                             withImage:[UIImage imageNamed:@"angel"]];

    self.phoenix = [[MagicalCreature alloc] initWithName:@"Pioneer"
                                              withDetail:@"Phoenix"
                                           withAccessory:[@[@"Feathers",
                                                            @"Fireblood"]mutableCopy]
                                               withImage:[UIImage imageNamed:@"phoenix"]];

    self.troll = [[MagicalCreature alloc] initWithName:@"Tron"
                                            withDetail:@"Troll"
                                         withAccessory:[@[@"Mace",
                                                          @"Skull Helmet",
                                                          @"Hardskin"]mutableCopy]
                                             withImage:[UIImage imageNamed:@"troll"]];

    self.giant = [[MagicalCreature alloc] initWithName:@"Hugo"
                                            withDetail:@"Giant"
                                         withAccessory:[@[@"Two Handed Axe"]mutableCopy]
                                             withImage:[UIImage imageNamed:@"giant"]];

    [self.creature addObjectsFromArray:@[self.angel, self.phoenix, self.troll, self.giant]];

}

- (IBAction)onButtonPressedAddCreature:(UIBarButtonItem *)sender
{
    MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.creatureTextField.text
                                                               withDetail:nil
                                                            withAccessory:nil
                                                                withImage:nil];
    [self.creature addObjectsFromArray:@[creature]];

    self.creatureTextField.text = @"";
    
    [self.creatureTextField resignFirstResponder];

    [self.creatureTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creature.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MagicalCreature *creature = self.creature[indexPath.row];
    cell.textLabel.text = creature.name;
    return cell;
}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)editButton
{
    if ([editButton.title isEqualToString:@"Edit"]) {
        editButton.title = @"Done";
        self.creatureTextField.hidden = NO;
        self.hiddenTextFieldLabel.hidden = YES;
        self.navigationItem.rightBarButtonItem.enabled = YES;
    } else {
        editButton.title = @"Edit";
        self.navigationItem.rightBarButtonItem.enabled = YES;
        self.creatureTextField.hidden = YES;
        self.hiddenTextFieldLabel.hidden = NO;
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *cvc = segue.destinationViewController;
    NSInteger rowNumber = [self.creatureTableView indexPathForSelectedRow].row;
    MagicalCreature *theCreature = [self.creature objectAtIndex:rowNumber];
    cvc.magicalCreature = theCreature;
    cvc.magicalAngel = theCreature;
    cvc.magicalPhoenix = theCreature;
    cvc.magicalTroll = theCreature;
    cvc.magicalGiant = theCreature;
}


@end
