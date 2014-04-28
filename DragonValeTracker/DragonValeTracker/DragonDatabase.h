//
//  DragonDatabase.h
//  DragonValeDatabase
//
//  Created by Lewis Cooper on 3/31/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Dragon.h"

@interface DragonDatabase : NSObject
{
    NSMutableArray *dragons;
    NSMutableArray *starredDragons;
}


+ (DragonDatabase *) sharedDragonDatabase;

- (NSArray *) allDragons;
- (NSArray *) getStarredDragons;

- (void) addDragon:(Dragon *)newDragon;
- (void) addStarredDragon:(Dragon *)newDragon;
- (void) deleteDragonFromStarred:(NSInteger)index;
- (Dragon *) dragonAtIndex:(NSInteger)index;
- (Dragon *) starredDragonAtIndex:(NSInteger)index;

- (void) moveDragonAtIndex:(int)from toIndex:(int)to;

- (void) populateDragons;

- (void) sortDragons;

// use this to check if the dragon is a part of the list or not
- (BOOL) doesDragonExist:(Dragon *)testDragon;


@end
