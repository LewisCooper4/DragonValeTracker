//
//  DVTDragonCell.h
//  DragonValeTracker
//
//  Created by Lewis Cooper on 4/4/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DVTDragonCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *dragonThumbnailImage;
@property (weak, nonatomic) IBOutlet UILabel *dragonNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfDragonsAndEggsLabel;



@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *elementImages;

// use these for the types of the dragons
@property (weak, nonatomic) IBOutlet UIImageView *element1Image;
@property (weak, nonatomic) IBOutlet UIImageView *element2Image;
@property (weak, nonatomic) IBOutlet UIImageView *element3Image;
@property (weak, nonatomic) IBOutlet UIImageView *element4Image;

@end
