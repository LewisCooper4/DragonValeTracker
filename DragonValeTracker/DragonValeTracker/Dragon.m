//
//  Dragon.m
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/4/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "Dragon.h"

@implementation Dragon

@synthesize babyDragon;
@synthesize breedingTime;
@synthesize buyForGems;
@synthesize buyPrice;
@synthesize dragonName;
@synthesize desriptionOfDragon;
@synthesize dragonEgg;
@synthesize elements;
@synthesize adultDragon;
@synthesize haveDragon;
@synthesize haveDragonEgg;
@synthesize level;
@synthesize levelAvailability;
@synthesize negativeElements;
@synthesize numberOfDragons;
@synthesize numberOfEggs;
@synthesize positiveElements;
@synthesize rateOfCollectionLevel1;
@synthesize rateOfCollectionLevel10;
@synthesize rateOfCollectionLevel15;
@synthesize rateOfCollectionLevel20;
@synthesize sellPrice;

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    // images
    [aCoder encodeObject:babyDragon forKey:@"babyDragon"];
    [aCoder encodeObject:adultDragon forKey:@"adultDragon"];
    [aCoder encodeObject:dragonEgg forKey:@"dragonEgg"];
    
    // strings
    [aCoder encodeObject:dragonName forKey:@"dragonName"];
    [aCoder encodeObject:desriptionOfDragon forKey:@"descriptionOfDragon"];
    
    // rate of collection
    [aCoder encodeInteger:rateOfCollectionLevel1 forKey:@"rateOfCollection1"];
    [aCoder encodeInteger:rateOfCollectionLevel10 forKey:@"rateOfCollection10"];
    [aCoder encodeInteger:rateOfCollectionLevel15 forKey:@"rateOfCollection15"];
    [aCoder encodeInteger:rateOfCollectionLevel20 forKey:@"rateOfCollection20"];
    
    // elements
    [aCoder encodeObject:elements forKey:@"elements"];
    [aCoder encodeObject:positiveElements forKey:@"positiveElements"];
    [aCoder encodeObject:negativeElements forKey:@"negativeElements"];
    
    // prices
    [aCoder encodeInteger:sellPrice forKey:@"sellPrice"];
    [aCoder encodeInteger:buyPrice forKey:@"buyPrice"];
    
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        [self setAdultDragon:[aDecoder decodeObjectForKey:@"adultDragon"]];
        [self setBabyDragon:[aDecoder decodeObjectForKey:@"babyDragon"]];
        [self setDragonEgg:[aDecoder decodeObjectForKey:@"dragonEgg"]];
        [self setDragonName:[aDecoder decodeObjectForKey:@"dragonName"]];
        [self setDesriptionOfDragon:[aDecoder decodeObjectForKey:@"descriptionOfDragon"]];
        
        
    }
}

@end
