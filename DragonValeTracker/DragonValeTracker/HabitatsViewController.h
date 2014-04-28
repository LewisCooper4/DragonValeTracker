//
//  HabitatsViewController.h
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/11/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habitat.h"

@interface HabitatsViewController : UIViewController

@property (nonatomic) Habitat *currentHabitat;

@property (weak, nonatomic) IBOutlet UILabel *habitatNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *habitatImage;
@property (weak, nonatomic) IBOutlet UITableView *dragonTable;
@property (weak, nonatomic) IBOutlet UILabel *earningLabel;

- (IBAction)addDragon:(id)sender;

@end
