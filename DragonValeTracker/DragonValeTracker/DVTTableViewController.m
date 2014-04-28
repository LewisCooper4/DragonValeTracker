//
//  DragonsTableViewController.m
//  DragonValeDatabase
//
//  Created by Lewis Cooper on 3/31/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "DVTTableViewController.h"

#import "DVTDragonCell.h"
#import "Dragon.h"
#import "DVTViewController.h"

@interface DVTTableViewController ()

@end

@implementation DVTTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        dragonDatabase = [[DragonDatabase alloc] init];
        
        UINavigationItem *navItem = [self navigationItem];
        [navItem setTitle:@"Dragon Vale"];
        
    }
    return self;
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Dragon Vale"];
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
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void) viewWillAppear:(BOOL)animated
{
    [dragonDatabase sortDragons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[DragonDatabase sharedDragonDatabase] allDragons] count];
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     
     DVTDragonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DVTDragonCell"];
    
    if (!cell) {
        cell = [[DVTDragonCell alloc] init];
    }
     
     Dragon *dragon = [[DragonDatabase sharedDragonDatabase] dragonAtIndex:[indexPath row]];
     
     
     [[cell dragonNameLabel] setText:dragon.dragonName];
     [[cell dragonThumbnailImage] setImage:dragon.adultDragon];
     [[cell numberOfDragonsAndEggsLabel] setText:[NSString stringWithFormat:@"Dragons:%d Eggs:%d", dragon.numberOfDragons, dragon.numberOfEggs]];
    
    // go through the array of dragon elements to put into the uimages in
    
    int i = 0;
    for (NSString *element in [dragon elements]) {
        
        [[[cell elementImages] objectAtIndex:i] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ Element.png", element]]];

        i++;        
    }
    
    
 
     // Configure the cell...
 
     return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DVTViewController *detailViewController = [[DVTViewController alloc] init];
    
    Dragon *dragon = [dragonDatabase dragonAtIndex:[indexPath row]];
    [detailViewController setCurrentDragon:dragon];
        
    [[self navigationController] pushViewController:detailViewController animated:YES];
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
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
