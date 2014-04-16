//
//  Habitat.h
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/13/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Habitat : NSObject

@property (nonatomic) NSString *habitatElement;
@property (nonatomic) NSMutableArray *dragons;
@property (nonatomic) UIImage *habitatImage;

- (NSInteger) getEarnings;

@end
