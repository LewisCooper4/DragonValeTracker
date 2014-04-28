//
//  StarredDragonsTableViewController.m
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/6/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "StarredDragonsTableViewController.h"

#import "Dragon.h"
#import "DVTDragonCell.h"
#import "DragonDatabase.h"

@interface StarredDragonsTableViewController ()

@end

@implementation StarredDragonsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        UINavigationItem *navItem = [self navigationItem];
        [navItem setTitle:@"Starred Dragons"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"DVTDragonCell" bundle:nil];
    
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"DVTDragonCell"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [[self tableView] reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillAppear:(BOOL)animated
{
    [[self tableView] reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[DragonDatabase sharedDragonDatabase] getStarredDragons] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DVTDragonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DVTDragonCell"];
    
    if (!cell) {
        cell = [[DVTDragonCell alloc] init];
    }
    
    Dragon *dragon = [[DragonDatabase sharedDragonDatabase] starredDragonAtIndex:[indexPath row]];
    
    [[cell dragonNameLabel] setText:dragon.dragonName];
    [[cell dragonThumbnailImage] setImage:dragon.adultDragon];
    [[cell numberOfDragonsAndEggsLabel] setText:[NSString stringWithFormat:@"Dragons:%d Eggs:%d", dragon.numberOfDragons, dragon.numberOfEggs]];
    
    int i = 0;
    for (NSString *element in dragon.elements) {
        
        [[[cell elementImages] objectAtIndex:i] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ Element.png", element]]];
        
        i++;
    }
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [[DragonDatabase sharedDragonDatabase] deleteDragonFromStarred:[indexPath row]];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
        
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [[DragonDatabase sharedDragonDatabase] moveDragonAtIndex:[fromIndexPath row] toIndex:[toIndexPath row]];
}


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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
