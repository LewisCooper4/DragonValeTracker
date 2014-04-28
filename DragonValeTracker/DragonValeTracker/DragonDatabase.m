//
//  DragonDatabase.m
//  DragonValeDatabase
//
//  Created by Lewis Cooper on 3/31/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "DragonDatabase.h"

#import "Dragon.h"

@implementation DragonDatabase


- (id) init
{
    self = [super init];
    if (self) {
        dragons = [[NSMutableArray alloc] init];
        starredDragons = [[NSMutableArray alloc] init];
        
        [self populateDragons];
        
    }
    
    return self;
}

- (void) sortDragons
{
    NSArray *sortedTasks = [dragons sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *d1 = [obj1 dragonName];
        NSString *d2 = [obj2 dragonName];
        return [d1 compare:d2];
    }];
    
    dragons = [NSMutableArray arrayWithArray:sortedTasks];
}

- (void) populateDragons
{    
    NSArray *dragonNames = [NSArray arrayWithObjects:@"Air", @"Cold", @"Dark", @"Earth", @"Fire", @"Light", @"Lightning", @"Metal", @"Plant", @"Water", nil];
     
    NSString *plantDescription     = @"This dragon likes plants";
    NSString *fireDescription      = @"This dragon is full of fire";
    NSString *earthDescription     = @"This dragon is down to earth";
    NSString *airDescription       = @"This dragon likes to fly";
    NSString *coldDescription      = @"This dragon loves the snow";
    NSString *darkDescription      = @"This dragon is not afraid of the dark";
    NSString *lightDescription     = @"This dragon is a light in the dark";
    NSString *lightningDescription = @"This dragon is sparkie";
    NSString *metalDescription     = @"This dragon is super shiny";
    NSString *waterDescription     = @"This dragon is a fish";
    
    NSArray *dragonDescriptions = [NSArray arrayWithObjects:plantDescription, fireDescription, earthDescription, airDescription, coldDescription, darkDescription, lightDescription, lightningDescription, metalDescription, waterDescription, nil];
      
    
    for (int i = 0; i < [dragonNames count]; i++) {
        
        Dragon *newDragon = [[Dragon alloc] init];
        
        NSString *dragonName = [dragonNames objectAtIndex:i];
        
        [newDragon setDragonName:[NSString stringWithFormat:@"%@ Dragon", dragonName]];
        [newDragon setDesriptionOfDragon:[dragonDescriptions objectAtIndex:i]];
        [newDragon setElements:[NSArray arrayWithObjects:dragonName, nil]];
        [newDragon setNumberOfDragons:0];
        [newDragon setNumberOfEggs:0];
        [newDragon setBuyPrice:0];
        [newDragon setLevelAvailability:0];
        [newDragon setSellPrice:0];
        // add the image from the file
        [newDragon setAdultDragon:[UIImage imageNamed:[NSString stringWithFormat:@"%@ adult.jpeg", dragonName]]];
        [newDragon setBabyDragon:[UIImage imageNamed:[NSString stringWithFormat:@"%@ baby.jpeg", dragonName]]];
        [newDragon setDragonEgg:[UIImage imageNamed:[NSString stringWithFormat:@"%@ egg.jpeg", dragonName]]];
        [dragons addObject:newDragon];
    }
    
    // this dragon is to test to see if the multiple elements will be shown in the table
    Dragon *hybridDragon = [[Dragon alloc] init];
    [hybridDragon setDragonName:@"Crystal Dragon"];
    [hybridDragon setDesriptionOfDragon:@"This is a wonderful purple crystal"];
    [hybridDragon setElements:[NSArray arrayWithObjects:@"Lightning", @"Earth", nil]];
    [hybridDragon setNumberOfDragons:0];
    [hybridDragon setNumberOfEggs:0];
    [hybridDragon setBuyPrice:0];
    [hybridDragon setLevelAvailability:0];
    [hybridDragon setSellPrice:0];
    // add the image from the file
    [hybridDragon setAdultDragon:[UIImage imageNamed:@"Crystal adult.jpg"]];
    [hybridDragon setBabyDragon:[UIImage imageNamed:@"Crystal baby.jpg"]];
    [hybridDragon setDragonEgg:[UIImage imageNamed:@"Crystal egg.jpg"]];
    [dragons addObject:hybridDragon];
    
    hybridDragon = [[Dragon alloc] init];
    [hybridDragon setDragonName:@"Panlong"];
    [hybridDragon setDesriptionOfDragon:@"This is a chinese dragon"];
    [hybridDragon setElements:[NSArray arrayWithObjects:@"Water", @"Earth", @"Fire", @"Air", nil]];
    [hybridDragon setNumberOfDragons:2];
    [hybridDragon setNumberOfEggs:4];
    [hybridDragon setBuyPrice:0];
    [hybridDragon setLevelAvailability:0];
    [hybridDragon setSellPrice:0];
    // add the image from the file
    [hybridDragon setAdultDragon:[UIImage imageNamed:@"Panlong adult.jpg"]];
    [hybridDragon setBabyDragon:[UIImage imageNamed:@"Panlong baby.jpg"]];
    [hybridDragon setDragonEgg:[UIImage imageNamed:@"Panlong egg.jpg"]];
    [dragons addObject:hybridDragon];
    
}


+ (id) allocWithZone:(struct _NSZone *)zone
{
    return [self sharedDragonDatabase];
}

+ (DragonDatabase *) sharedDragonDatabase
{
    static DragonDatabase *sharedDragonDatabase = nil;
    if (!sharedDragonDatabase) {
        sharedDragonDatabase = [[super allocWithZone:nil] init];
    }
    return sharedDragonDatabase;
}


- (NSArray *) allDragons
{
    return dragons;
}

- (NSArray *) getStarredDragons
{
    return starredDragons;
}


- (void) addDragon:(Dragon *)newDragon
{
    [dragons addObject:newDragon];
}

- (void) addStarredDragon:(Dragon *)newDragon
{
    [starredDragons addObject:newDragon];
}

- (void) deleteDragonFromStarred:(NSInteger)index
{
    [starredDragons removeObjectAtIndex:index];
}

- (Dragon *) dragonAtIndex:(NSInteger)index
{
    return [dragons objectAtIndex:index];
}

- (Dragon *) starredDragonAtIndex:(NSInteger)index
{
    return [starredDragons objectAtIndex:index];
}

- (BOOL) doesDragonExist:(Dragon *)testDragon
{
    return [dragons containsObject:testDragon];
}


- (void) moveDragonAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    
    Dragon *d = [starredDragons objectAtIndex:from];
    
    [starredDragons removeObjectAtIndex:from];
    
    [starredDragons insertObject:d atIndex:to];
}


// there are going to need to be several sort functions which will return only dragons that fit a particular attribute such as an element they have or the number of dragons/eggs they have

- (NSArray *) sortDragonsByNumberOfDragons:(NSInteger)number compare:(NSString *)compare
{
    if ([compare isEqualToString:@"less than"]) {
        // sort dragons that have less than number
    }
    else if ([compare isEqualToString:@"more than"]) {
        // sort dragons that have more than number
    }
    else if ([compare isEqualToString:@"equal to"]) {
        // sort dragons that have exactly number
    }
    
    return nil;
}

- (NSArray *) sortDragonsByNumberOfEggs:(NSInteger)number compare:(NSString *)compare
{
    if ([compare isEqualToString:@"less than"]) {
        // sort dragons that have less than number of eggs
    }
    else if ([compare isEqualToString:@"more than"]) {
        // sort dragons that have more than number of eggs
    }
    else if ([compare isEqualToString:@"equal to"]){
        // sort dragons that have exactly number of eggs
    }
    
    return nil;
}

- (NSArray *) sortDragonsByElement:(NSString *)element
{
    NSMutableArray *sortedDragons = [[NSMutableArray alloc] init];
    
    for (Dragon *d in dragons) {
        
        NSArray *elements = [d elements];
        if ([elements containsObject:element]) {
            [sortedDragons addObject:d];
        }
    }
    
    return sortedDragons;
}

@end
