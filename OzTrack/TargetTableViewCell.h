//
//  TargetTableViewCell.h
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TargetTableViewCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UILabel *grade;
@property(weak, nonatomic) IBOutlet UILabel *target;
@property(weak, nonatomic) IBOutlet UILabel *hourlyVariance;
@property(weak, nonatomic) IBOutlet UILabel *dailyVariance;
+(TargetTableViewCell *)cellFromNib:(NSString *)nibName;
@end
