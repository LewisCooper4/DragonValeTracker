//
//  Dragon.h
//  DragonValeDatabase
//
//  Created by Lewis Cooper on 3/24/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dragon : NSObject <NSCoding>


// name of the dragon
@property (nonatomic) NSString *dragonName;

// pictures for each dragon
@property (nonatomic) UIImage *babyDragon;
@property (nonatomic) UIImage *adultDragon;
@property (nonatomic) UIImage *dragonEgg;


// whether or not the dragon is had and number of each instance
@property (nonatomic) BOOL haveDragon;
@property (nonatomic) BOOL haveDragonEgg;
@property (nonatomic) NSInteger numberOfDragons;
@property (nonatomic) NSInteger numberOfEggs;

// elements of the dragon for sorting purposes
@property (nonatomic) NSMutableArray *elements;
@property (nonatomic) NSMutableArray *positiveElements;
@property (nonatomic) NSMutableArray *negativeElements;

// prices of the dragon
@property (nonatomic) NSInteger sellPrice;
@property (nonatomic) NSInteger buyPrice;
// whether it requires gems or coins to buy
@property (nonatomic) BOOL buyForGems;
@property (nonatomic) NSInteger level;
@property (nonatomic) NSInteger rateOfCollectionLevel1;
@property (nonatomic) NSInteger rateOfCollectionLevel10;
@property (nonatomic) NSInteger rateOfCollectionLevel15;
@property (nonatomic) NSInteger rateOfCollectionLevel20;

// time for breeding/incubating  NEED TO FIGURE OUT HOW TO PUT THIS INTO HOURS/MINUTES
@property (nonatomic) NSTimeInterval *breedingTime;


// when is the dragon available
@property (nonatomic) NSInteger levelAvailability;


// short description of the dragon
@property (nonatomic) NSString *desriptionOfDragon;


@end
