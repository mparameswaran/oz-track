//
//  TargetTableViewCell.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "TargetTableViewCell.h"

@implementation TargetTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



+(TargetTableViewCell *)cellFromNib:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle]loadNibNamed:nibName owner:self options:nil];
    NSObject *cell = nil;
    TargetTableViewCell *targetCell = nil;
    for (cell in nibContents) {
        if ([cell isKindOfClass:[TargetTableViewCell class]]) {
            
            targetCell = (TargetTableViewCell *)cell;
            break;
        }
        
    }
    [targetCell setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.3]];
    return targetCell;
}

@end
