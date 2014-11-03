//
//  CreatureViewController.m
//  MCMS
//
//  Created by Supreme Overlord on 10/28/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "CreatureViewController.h"
#import "BattleViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (weak, nonatomic) IBOutlet UILabel *currentDetail;
@property NSMutableArray *creatureAccessory;
@property MagicalCreature *angel;
@property MagicalCreature *phoenix;
@property MagicalCreature *troll;
@property MagicalCreature *giant;

@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = self.magicalCreature.name;
    self.currentDetail.text = self.magicalCreature.detail;
    self.creatureImageView.image = self.magicalCreature.image;
    self.creatureAccessory = self.magicalCreature.accessoryArray;
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//    self.navigationItem.title = self.magicalCreature.name;
//    self.currentDetail.text = self.magicalCreature.detail;
//    self.creatureImageView.image = self.magicalCreature.image;
//    self.creatureAccessory = self.magicalCreature.accessoryArray;
//
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatureAccessory.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accessoryCell" forIndexPath:indexPath];
    MagicalCreature *creatureAccessories = self.creatureAccessory[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", creatureAccessories];
    return cell;
}

- (IBAction)editCreatureOnButtonPressed:(UIButton *)sender
{
    UIAlertController *creatureList = [UIAlertController alertControllerWithTitle:@"Creature List"
                                                                          message: nil
                                                                   preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *angel = [UIAlertAction actionWithTitle:@"Angel"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {

                                                      self.magicalCreature.detail = @"Angel";
                                                      self.magicalCreature.image = [UIImage imageNamed:@"angel"];
                                                      self.magicalCreature.accessoryArray = [@[@"Sword",
                                                                                  @"Wings",
                                                                                  @"Shield"] mutableCopy];

                                                      self.currentDetail.text = @"Angel";
                                                      self.creatureImageView.image = [UIImage imageNamed:@"angel"];

                                                      self.creatureAccessory = [@[@"Sword",
                                                                                  @"Wings",
                                                                                  @"Shield"] mutableCopy];
                                                      [self.detailTableView reloadData];
                                                  }];
    [creatureList addAction:angel];
    UIAlertAction *phoenix = [UIAlertAction actionWithTitle:@"Phoenix"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {

                                                      self.magicalCreature.detail = @"Phoenix";
                                                      self.magicalCreature.image = [UIImage imageNamed:@"phoenix"];
                                                      self.magicalCreature.accessoryArray = [@[@"Feathers",
                                                                                               @"Fireblood"] mutableCopy];

                                                      self.currentDetail.text = @"Phoenix";
                                                      self.creatureImageView.image = [UIImage imageNamed:@"phoenix"];

                                                      self.creatureAccessory = [@[@"Feathers",
                                                                                  @"Fireblood"] mutableCopy];
                                                      [self.detailTableView reloadData];
                                                  }];
    [creatureList addAction:phoenix];
    UIAlertAction *troll = [UIAlertAction actionWithTitle:@"Troll"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {

                                                      self.magicalCreature.detail = @"Troll";
                                                      self.magicalCreature.image = [UIImage imageNamed:@"troll"];
                                                      self.magicalCreature.accessoryArray = [@[@"Mace",
                                                                                               @"Skull Helmet",
                                                                                               @"Hardskin"] mutableCopy];

                                                      self.currentDetail.text = @"Troll";
                                                      self.creatureImageView.image = [UIImage imageNamed:@"troll"];

                                                      self.creatureAccessory = [@[@"Mace",
                                                                                  @"Skull Helmet",
                                                                                  @"Hardskin"] mutableCopy];
                                                      [self.detailTableView reloadData];
                                                  }];
    [creatureList addAction:troll];
    UIAlertAction *giant = [UIAlertAction actionWithTitle:@"Giant"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {
                                                      self.magicalCreature.detail = @"Giant";
                                                      self.magicalCreature.image = [UIImage imageNamed:@"giant"];
                                                      self.magicalCreature.accessoryArray = [@[@"Two Handed Axe"] mutableCopy];

                                                      self.currentDetail.text = @"Giant";
                                                      self.creatureImageView.image = [UIImage imageNamed:@"giant"];

                                                      self.creatureAccessory = [@[@"Two Handed Axe"] mutableCopy];
                                                      [self.detailTableView reloadData];
                                                  }];

    [creatureList addAction:giant];
    [self presentViewController: creatureList animated:YES completion:nil];
}
- (IBAction)battleOnButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"battleSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    BattleViewController *bvc = segue.destinationViewController;
    bvc.creatureImage = self.creatureImageView.image;
}

@end
