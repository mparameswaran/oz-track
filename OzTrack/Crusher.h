//
//  Crusher.h
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Truck.h"
#import <RestKit/RestKit.h>
@interface Crusher : NSObject

extern const CGFloat MAX_TONS_HOUR;

@property(nonatomic) CGFloat gradeA;
@property(nonatomic) CGFloat gradeB;
@property(nonatomic) CGFloat gradeC;
@property(nonatomic) CGFloat gradeD;
@property(nonatomic) CGFloat gradeE;
@property(nonatomic) CGFloat gradeF;
@property(nonatomic) CGFloat gradeG;
@property(nonatomic) CGFloat gradeH;
@property(nonatomic) CGFloat gradeI;
@property(nonatomic) CGFloat tons;
-(BOOL) canDirectTip: (Truck *) truck;
+(RKObjectMapping *) mapping;
@end
