//
//  Truck.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "Truck.h"

@implementation Truck

+(RKObjectMapping *) mapping
{
    RKObjectMapping *truckMapping = [RKObjectMapping mappingForClass:[Truck class]];
    [truckMapping mappingForSourceKeyPath:@"Truck Info"];
    [truckMapping addAttributeMappingsFromDictionary:@{@"Truck No":@"number",@"grade A":@"gradeA",@"grade B":@"gradeB",@"grade C":@"gradeC",@"grade D":@"gradeD",@"grade E":@"gradeE",@"grade F":@"gradeF",@"grade G":@"gradeG",@"grade H":@"gradeH",@"grade I":@"gradeI",@"weight":@"tons"}];
    return truckMapping;
}

@end
