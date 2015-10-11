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
        
        float temp = [self tonsAtCrusher] * [[[self currentGradesAtCrusher]objectAtIndex:0]floatValue];
        float temp2 = truck.tons * [[[truck currentGradesAtTruck]objectAtIndex:i]floatValue] ;

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
    [self setGradeA:((self.gradeA*self.tonsAtCrusher + truck.gradeA*truck.tons) / (self.tonsAtCrusher + truck.tons))];
    [self setGradeB:((self.gradeB*self.tonsAtCrusher + truck.gradeB*truck.tons) / (self.tonsAtCrusher + truck.tons))];
    [self setGradeC:((self.gradeC*self.tonsAtCrusher + truck.gradeC*truck.tons) / (self.tonsAtCrusher + truck.tons))];
    [self setGradeD:((self.gradeD*self.tonsAtCrusher + truck.gradeD*truck.tons) / (self.tonsAtCrusher + truck.tons))];
    [self setGradeE:((self.gradeE*self.tonsAtCrusher + truck.gradeE*truck.tons) / (self.tonsAtCrusher + truck.tons))];
    [self setGradeF:((self.gradeF*self.tonsAtCrusher + truck.gradeF*truck.tons) / (self.tonsAtCrusher + truck.tons))];
    [self setGradeG:((self.gradeG*self.tonsAtCrusher + truck.gradeG*truck.tons)/ (self.tonsAtCrusher + truck.tons))];
    [self setGradeH:((self.gradeH*self.tonsAtCrusher + truck.gradeH*truck.tons) / (self.tonsAtCrusher + truck.tons)) ];
    [self setGradeI: ((self.gradeI*self.tonsAtCrusher + truck.gradeI*truck.tons)/ (self.tonsAtCrusher + truck.tons)) ];
    [self setTonsAtCrusher:(self.tonsAtCrusher + truck.tons)];
    
}
@end
