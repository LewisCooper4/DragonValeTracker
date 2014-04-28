//
//  HabitatDatabase.h
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/13/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Habitat.h"
#import "Dragon.h"

@interface HabitatDatabase : NSObject
{
    NSMutableArray *habitats;
}


+ (HabitatDatabase *) sharedHabitatDatabase;

- (void) addDragon:(Dragon *)dragon ToHabitat:(NSInteger)index;
- (Habitat *) habitatAtIndex:(NSInteger)index;

- (NSArray *) allHabitats;

- (void) populateHabitats;

@end
