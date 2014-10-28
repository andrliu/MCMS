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
//moved it from .h
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITextField *creatureTextField;
@property (strong, nonatomic) IBOutlet UITableView *creatureTableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.creatures = [@[@"Vampire", @"Werewolf", @"Shapeshifter"] mutableCopy];
    self.creatures = [NSMutableArray array];
    MagicalCreature *objectOne = [[MagicalCreature alloc]initWithName:@"Archer"];
    [self.creatures addObjectsFromArray:@[objectOne]];

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
    MagicalCreature *creature = self.creatureTextField.text;  //textfiled to local variable
//    [self.creatures addObject:creature];                //add local vaiable to array



    self.creatureTextField.text = @"";                  //reset textfield
    [self.creatureTextField resignFirstResponder];      //dismiss keyboard
    [self.creatureTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSInteger rowNumber = [self.creatureTableView indexPathForSelectedRow].row;
/////come back soon


}


@end
