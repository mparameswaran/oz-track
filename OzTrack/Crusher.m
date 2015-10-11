//
//  Crusher.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "Crusher.h"

@interface Crusher()


@end

@implementation Crusher

const CGFloat MAX_TONS_HOUR = 1700.0;

-(BOOL)canDirectTip:(Truck *)truck
{
    if ( ([self tonsAtCrusher] + [truck tons]) > MAX_TONS_HOUR) {
        return NO;
    }
    for (int i = 0; i < [[self currentGradesAtCrusher]count]; i++) {
        CGFloat weightage = ([self tonsAtCrusher] * [[[self currentGradesAtCrusher]objectAtIndex:i]floatValue] ) + (truck.tons * [[[truck currentGradesAtTruck]objectAtIndex:i]floatValue] );
        float grade = weightage/([self tonsAtCrusher] + [truck tons]);
        if(grade > [[[self targetGradesAtCrusher]objectAtIndex:i]floatValue] +[[[self targetGradesAtCrusher]objectAtIndex:i]floatValue] * [[[self hourlyVariation]objectAtIndex:i]floatValue]/100  || grade < [[[self targetGradesAtCrusher]objectAtIndex:i]floatValue] - [[[self targetGradesAtCrusher]objectAtIndex:i]floatValue] * [[[self hourlyVariation]objectAtIndex:i]floatValue]/100 )
        {
            return NO;
        }
    }
    
    
    return YES;
    
}


+(RKObjectMapping *) mapping
{
    RKObjectMapping *crusherMapping = [RKObjectMapping mappingForClass:[Crusher class]];
    [crusherMapping mappingForSourceKeyPath:@"Crusher Data"];
    [crusherMapping addAttributeMappingsFromDictionary:@{@"grade A":@"gradeA",@"grade B":@"gradeB",@"grade C":@"gradeC",@"grade D":@"gradeD",@"grade E":@"gradeE",@"grade F":@"gradeF",@"grade G":@"gradeG",@"grade H":@"gradeH",@"grade I":@"gradeI", @"Tonnes":@"tonsAtCrusher"}];
    return crusherMapping;
}

-(void)updateWithTruckData:(Truck *)truck
{
    [self setGradeA:(self.gradeA + truck.gradeA)];
    [self setGradeB:(self.gradeB + truck.gradeB)];
    [self setGradeC:(self.gradeC + truck.gradeC)];
    [self setGradeD:(self.gradeD + truck.gradeD)];
    [self setGradeE:(self.gradeE + truck.gradeE)];
    [self setGradeF:(self.gradeF + truck.gradeF)];
    [self setGradeG:(self.gradeG + truck.gradeG)];
    [self setGradeH:(self.gradeH + truck.gradeH)];
    [self setGradeI:(self.gradeI + truck.gradeI)];
    
    
}
@end
