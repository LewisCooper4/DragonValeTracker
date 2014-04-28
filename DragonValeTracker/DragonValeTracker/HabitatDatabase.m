//
//  HabitatDatabase.m
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/13/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "HabitatDatabase.h"

#import "Habitat.h"
#import "Dragon.h"

@implementation HabitatDatabase


- (id) init
{
    self = [super init];
    
    if (self) {
        habitats = [[NSMutableArray alloc] init];
        
        [self populateHabitats];
        
        /*
        Habitat *plantHabitat = [[Habitat alloc] init];
        
        [plantHabitat setHabitatElement:@"Plant"];
        [plantHabitat setHabitatImage:[UIImage imageNamed:@"url.png"]];
        
        Dragon *firstDragon = [[Dragon alloc] init];        
        [firstDragon setDragonName:@"First Dragon"];
        [firstDragon setDesriptionOfDragon:@"This dragon is cool"];
        [firstDragon setNumberOfDragons:2];
        [firstDragon setNumberOfEggs:1];
        [firstDragon setBuyPrice:500];
        [firstDragon setLevelAvailability:1];
        [firstDragon setSellPrice:0];
        
        Dragon *secondDragon = [[Dragon alloc] init];
        [secondDragon setDragonName:@"Second Dragon"];
        [secondDragon setDesriptionOfDragon:@"This dragon is super duper cool"];
        [secondDragon setNumberOfDragons:1];
        [secondDragon setNumberOfEggs:0];
        [secondDragon setBuyPrice:500];
        [secondDragon setLevelAvailability:10];
        [secondDragon setSellPrice:0];
        
        [plantHabitat setDragons:[NSArray arrayWithObjects:firstDragon, secondDragon, nil]];
        
        [habitats addObject:plantHabitat];
         */
        
    }
    
    return self;
}

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedHabitatDatabase];
}

+ (HabitatDatabase *) sharedHabitatDatabase
{
    static HabitatDatabase *sharedHabitatDatabase = nil;
    if (!sharedHabitatDatabase) {
        sharedHabitatDatabase = [[super allocWithZone:nil] init];
    }
    return sharedHabitatDatabase;
}


- (Habitat *) habitatAtIndex:(NSInteger)index
{
    return [habitats objectAtIndex:index];
}

- (void) addDragon:(Dragon *)dragon ToHabitat:(NSInteger)index
{
    [[[habitats objectAtIndex:index] dragons] addObject:dragon];
}

- (NSArray *) allHabitats
{
    return habitats;
}

- (void) populateHabitats
{
    
    NSArray *habitatNames = [NSArray arrayWithObjects:@"Air", @"Cold", @"Dark", @"Earth", @"Fire", @"Light",   @"Lightning", @"Metal", @"Plant", @"Water", nil];
    
    for (int i = 0; i < [habitatNames count]; i++) {
        
        NSString *habitatName = [habitatNames objectAtIndex:i];
        
        Habitat *newHabitat = [[Habitat alloc] init];
        [newHabitat setHabitatElement:habitatName];
        [newHabitat setHabitatImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ Habitat.png", habitatName]]];
        [habitats addObject:newHabitat];
    }
}

@end
