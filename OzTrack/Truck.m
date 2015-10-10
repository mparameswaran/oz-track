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
    [truckMapping mappingForSourceKeyPath:@"truckData"];
    return truckMapping;
}

@end
