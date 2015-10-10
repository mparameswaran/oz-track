//
//  Crusher.h
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Truck.h"

@interface Crusher : NSObject

extern const CGFloat MAX_TONS_HOUR;


-(BOOL) canDirectTip: (Truck *) truck;
@end
