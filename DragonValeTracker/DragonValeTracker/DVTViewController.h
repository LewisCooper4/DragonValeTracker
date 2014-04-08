//
//  DVTViewController.h
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/4/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Dragon.h"

@interface DVTViewController : UIViewController
{    
    __weak IBOutlet UIButton *starredButton;
}

// current dragon to be shown
@property (nonatomic) Dragon *currentDragon;

// name of dragon appears here
@property (weak, nonatomic) IBOutlet UILabel *dragonNameLabel;

// dragon egg in this spot
@property (weak, nonatomic) IBOutlet UIImageView *eggImage;

// dragon baby in this spot
@property (weak, nonatomic) IBOutlet UIImageView *babyDragonImage;

// dragon adult in this spot
@property (weak, nonatomic) IBOutlet UIImageView *adultDragonImage;

// label for the number of dragons
@property (weak, nonatomic) IBOutlet UILabel *numberOfDragons;

// label for the number of eggs
@property (weak, nonatomic) IBOutlet UILabel *numberOfEggs;

// label for the level availability
@property (weak, nonatomic) IBOutlet UILabel *levelAvailability;

// label for the coins earned
@property (weak, nonatomic) IBOutlet UILabel *coinEarningLabel;

// label for description
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

// collection of positive/negative elements
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *positiveElements;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *negativeElements;

// price to buy/sell dragon
@property (weak, nonatomic) IBOutlet UILabel *sellPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyPriceLabel;

// starred button
- (IBAction)starDragon:(id)sender;

@end
