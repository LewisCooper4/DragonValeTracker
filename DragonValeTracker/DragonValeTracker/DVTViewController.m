//
//  DVDViewController.m
//  DragonValeDatabase
//
//  Created by Lewis Cooper on 3/24/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "DVTViewController.h"

#import "DragonDatabase.h"

@implementation DVTViewController
@synthesize descriptionTextView;

@synthesize sellPriceLabel;
@synthesize buyPriceLabel;

@synthesize dragonNameLabel;
@synthesize eggImage;
@synthesize babyDragonImage;
@synthesize adultDragonImage;
@synthesize numberOfDragons;
@synthesize numberOfEggs;
@synthesize levelAvailability;
@synthesize coinEarningLabel;

@synthesize currentDragon;

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
    
    
    [dragonNameLabel setText:[currentDragon dragonName]];
    [babyDragonImage setImage:[currentDragon babyDragon]];
    [adultDragonImage setImage:[currentDragon adultDragon]];
    [eggImage setImage:[currentDragon dragonEgg]];
    [numberOfEggs setText:[NSString stringWithFormat:@"Egg total: %d", [currentDragon numberOfEggs]]];
    [numberOfDragons setText:[NSString stringWithFormat:@"Dragon total: %d", [currentDragon numberOfDragons]]];
    [levelAvailability setText:[NSString stringWithFormat:@"Dragon available at level: %d", [currentDragon levelAvailability]]];
    
    [descriptionTextView setText:[currentDragon desriptionOfDragon]];
    
    [coinEarningLabel setText:[NSString stringWithFormat:@"Level 1 earning: %d/min Level 10 earning: %d/min Level 15 earning: %d/min Level 20 earning: %d/min", [currentDragon rateOfCollectionLevel1], [currentDragon rateOfCollectionLevel10], [currentDragon rateOfCollectionLevel15], [currentDragon rateOfCollectionLevel20]]];
    
    [sellPriceLabel setText:[NSString stringWithFormat:@"Sell for %d", [currentDragon sellPrice]]];
    
    if ([currentDragon buyForGems]) {
        [buyPriceLabel setText:[NSString stringWithFormat:@"Buy for %d gems", [currentDragon buyPrice]]];
    }
    else {
        [buyPriceLabel setText:[NSString stringWithFormat:@"Buy for %d gold", [currentDragon buyPrice]]];
    }
    
    
    // set each of the elements to the images set for the positive elements
    for (int i = 0; i < currentDragon.elements.count; i++) {
        // set the image of each element to the element image corresponding to the element
        
        NSString *elementString = [[currentDragon elements] objectAtIndex:i];
        
        [[self.positiveElements objectAtIndex:i] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ Element.png", elementString]]];
    }
    
    // set each of the elements to the images set for the negative elements
    for (int i = 0; i < currentDragon.negativeElements.count; i++) {
        // same as above
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setSellPriceLabel:nil];
    [self setBuyPriceLabel:nil];
    [self setDescriptionTextView:nil];
    starredButton = nil;
    [super viewDidUnload];
}

- (IBAction)starDragon:(id)sender
{
    // add this dragon to the starred list
    DragonDatabase *database = [DragonDatabase sharedDragonDatabase];
    
    [database addStarredDragon:currentDragon];
}


@end
