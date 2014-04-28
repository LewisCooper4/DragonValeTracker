//
//  HabitatsViewController.m
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/11/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "HabitatsViewController.h"

#import "Dragon.h"

@interface HabitatsViewController ()

@end

@implementation HabitatsViewController
@synthesize habitatNameLabel;
@synthesize habitatImage;
@synthesize dragonTable;
@synthesize earningLabel;

@synthesize currentHabitat;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [habitatNameLabel setText:[currentHabitat habitatElement]];
    [habitatImage setImage:[currentHabitat habitatImage]];    
    [earningLabel setText:[NSString stringWithFormat:@"Total earnings = %d", [currentHabitat getEarnings]]];
}

- (void)viewDidUnload
{
    [self setHabitatNameLabel:nil];
    [self setHabitatImage:nil];
    [self setDragonTable:nil];
    [self setEarningLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addDragon:(id)sender {
}
@end
