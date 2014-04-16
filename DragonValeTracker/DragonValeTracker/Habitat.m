//
//  Habitat.m
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/13/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "Habitat.h"

#import "Dragon.h"

@implementation Habitat




- (NSInteger) getEarnings
{
    int earnings = 0;
    for (Dragon *d in self.dragons) {
        
        switch ([d level]) {
            case 1:
                earnings += [d rateOfCollectionLevel1];
                break;
            case 10:
                earnings += [d rateOfCollectionLevel10];
                break;
            case 15:
                earnings += [d rateOfCollectionLevel15];
                break;
            case 20:
                earnings += [d rateOfCollectionLevel20];
                break;
            default:
                earnings += 0;
                break;
        }
    }
    
    return earnings;
}

@end
