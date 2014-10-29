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
    return cell;
}

- (IBAction)onButtonPressedAddCreature:(UIBarButtonItem *)sender
{
    MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.creatureTextField.text];
    [self.creatures addObjectsFromArray:@[creature]];
    self.creatureTextField.text = @"";
    [self.creatureTextField resignFirstResponder];
    [self.creatureTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSInteger rowNumber = [self.creatureTableView indexPathForSelectedRow].row;
    


}


@end
