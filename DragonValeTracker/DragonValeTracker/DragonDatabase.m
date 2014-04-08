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
        
        
        // this is to make one dragon show up in the table for testing purposes early
        // TESTING
        Dragon *newDragon = [[Dragon alloc] init];
        [newDragon setDragonName:@"First Dragon"];
        [newDragon setDesriptionOfDragon:@"This dragon is cool"];
        [newDragon setNumberOfDragons:2];
        [newDragon setNumberOfEggs:1];
        [newDragon setBuyPrice:500];
        [newDragon setLevelAvailability:1];
        [newDragon setSellPrice:0];
        
        [dragons addObject:newDragon];
        
        newDragon = [[Dragon alloc] init];
        [newDragon setDragonName:@"Second Dragon"];
        [newDragon setDesriptionOfDragon:@"This dragon is super duper cool"];
        [newDragon setNumberOfDragons:1];
        [newDragon setNumberOfEggs:0];
        [newDragon setBuyPrice:500];
        [newDragon setLevelAvailability:10];
        [newDragon setSellPrice:0];
        
        [dragons addObject:newDragon];
        
        [starredDragons addObject:newDragon];
        
        // TESTING
    }
    
    return self;
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
