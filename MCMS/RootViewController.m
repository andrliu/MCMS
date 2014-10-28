//
//  ViewController.m
//  MCMS
//
//  Created by Andrew Liu on 10/28/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
//moved it from .h
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITextField *creatureTextField;
@property (strong, nonatomic) IBOutlet UITableView *creatureTableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatures = [@[@"Vampire", @"Werewolf", @"Shapeshifter"] mutableCopy];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.creatures[indexPath.row];

    return cell;
}
- (IBAction)onButtonPressedAddCreature:(UIBarButtonItem *)sender
{
    NSString *creature = self.creatureTextField.text;
    [self.creatures addObject:creature];
    self.creatureTextField.text = @"";
    [self.creatureTextField resignFirstResponder];
    [self.creatureTableView reloadData];
}



@end
