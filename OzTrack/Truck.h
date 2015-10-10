//
//  Truck.h
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
@interface Truck : NSObject


@property(strong, nonatomic) NSArray *currentGradesAtTruck;
@property(nonatomic) CGFloat tons;
@property(nonatomic) CGFloat gradeA;
@property(nonatomic) CGFloat gradeB;
@property(nonatomic) CGFloat gradeC;
@property(nonatomic) CGFloat gradeD;
@property(nonatomic) CGFloat gradeE;
@property(nonatomic) CGFloat gradeF;
@property(nonatomic) CGFloat gradeG;
@property(nonatomic) CGFloat gradeH;
@property(nonatomic) CGFloat gradeI;
@property(nonatomic, copy) NSString *number;

+(RKObjectMapping *)mapping;


@end
