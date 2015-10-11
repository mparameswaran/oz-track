//
//  UIColor+HexColorCode.h

//
//  Created by Madan Parameswaran on 11/12/12.
//  Copyright (c) 2012 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColorCode)
+ (UIColor *)colorWithHexCode: (NSInteger)hexCode withAlpha: (CGFloat) alphaValue;
@end
