//
//  HabitatsCell.h
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/11/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HabitatsCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *habitatImage;
@property (weak, nonatomic) IBOutlet UIImageView *elementLabel;
@property (weak, nonatomic) IBOutlet UILabel *habitatNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dragonsLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalEarningsLabel;

@end
