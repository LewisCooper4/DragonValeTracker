//
//  HabitatsTableViewController.m
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/7/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "HabitatsTableViewController.h"

#import "HabitatDatabase.h"
#import "HabitatsCell.h"
#import "Habitat.h"
#import "HabitatsViewController.h"

@interface HabitatsTableViewController ()

@end

@implementation HabitatsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        habitatDatabase = [[HabitatDatabase alloc] init];
        
        UINavigationItem *navItem = [self navigationItem];
        [navItem setTitle:@"Habitats"];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewHabitat:)];
        
        [[self navigationItem] setRightBarButtonItem:bbi];
        
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UINib *nib = [UINib nibWithNibName:@"HabitatsCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"HabitatsCell"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[HabitatDatabase sharedHabitatDatabase] allHabitats] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HabitatsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HabitatsCell"];
    
    Habitat *habitat = [[HabitatDatabase sharedHabitatDatabase] habitatAtIndex:[indexPath row]];
    
    [[cell habitatImage] setImage:habitat.habitatImage];
    [[cell habitatNameLabel] setText:habitat.habitatElement];
    [[cell totalEarningsLabel] setText:[NSString stringWithFormat:@"Total Earnings %d", [habitat getEarnings]]];
    [[cell elementLabel] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ Element", habitat.habitatElement]]];
    
    return cell;
}


- (void) addNewHabitat:(id)sender
{
    NSLog(@"This will eventually allow for creation of new habitats");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     HabitatsViewController *hvc = [[HabitatsViewController alloc] init];
     // ...
     // Pass the selected object to the new view controller.
    
    [hvc setCurrentHabitat:[[HabitatDatabase sharedHabitatDatabase] habitatAtIndex:[indexPath row]]];
    
     [self.navigationController pushViewController:hvc animated:YES];
}

@end
