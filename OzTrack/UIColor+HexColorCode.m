//
//  UIColor+HexColorCode.m

//
//  Created by Madan Parameswaran on 11/12/12.
//  Copyright (c) 2012 Administrator. All rights reserved.
//

#import "UIColor+HexColorCode.h"

@implementation UIColor (HexColorCode)

+ (UIColor *)colorWithHexCode: (NSInteger)hexCode withAlpha: (CGFloat) alphaValue
{
    
    return [UIColor colorWithRed:((float)(((hexCode) & 0xFF0000) >> 16))/255.0
                           green:((float)(((hexCode) & 0xFF00) >> 8))/255.0
                            blue:((float)((hexCode) & 0xFF))/255.0
                           alpha:alphaValue];
}
@end
