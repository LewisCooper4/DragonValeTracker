//
//  HabitatsCell.m
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/11/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "HabitatsCell.h"

@implementation HabitatsCell
@synthesize habitatImage;
@synthesize elementLabel;
@synthesize habitatNameLabel;
@synthesize dragonsLabel;
@synthesize totalEarningsLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
