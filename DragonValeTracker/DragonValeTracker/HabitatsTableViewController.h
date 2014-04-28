//
//  HabitatsTableViewController.h
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/7/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HabitatDatabase.h"

@interface HabitatsTableViewController : UITableViewController
{
    HabitatDatabase *habitatDatabase;
}


- (void) addNewHabitat:(id)sender;

@end
