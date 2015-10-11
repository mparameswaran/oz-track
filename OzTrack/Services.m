//
//  Services.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "Services.h"
#import "Crusher.h"
#import <RKSerialization.h>
@implementation Services


-(Services *)initWithDelegate:(id<ServicesDelegate>)delegate
{
    if (!self) {
        self  = [super init];
    }
    [self setDelegate:delegate];
    return self;
}
-(void)fetchTargetBlendData:(NSString *)query
{

    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:[[[NSBundle mainBundle]infoDictionary]objectForKey:@"BASE_URL"]]];
    
    [[objectManager HTTPClient]getPath:query parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        [[self delegate]didFetchBlendTarget:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[self delegate]didFailFetchingBlendTarget:error];
    }];
    

    
                                      
}


-(void) fetchTruckData:(NSString *) query
{
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:[[[NSBundle mainBundle]infoDictionary]objectForKey:@"BASE_URL"]]];
    
    Truck *truck = [Truck new];
    [objectManager  setAcceptHeaderWithMIMEType:@"application/json"];
    
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/plain"];
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[Truck mapping] method:RKRequestMethodGET pathPattern:@"getTruckData" keyPath:@"Truck Info" statusCodes:nil];
    [objectManager addResponseDescriptor:responseDescriptor];
    [objectManager getObject:truck path:@"getTruckData" parameters:@{@"truckNo":query} success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
        [self.delegate didFetchTruckData:(Truck *)[mappingResult firstObject]];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self.delegate didFailFetchingTruckData:error];
    }];
}

-(void) fetchCrusherData:(NSString *) query
{
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:[[[NSBundle mainBundle]infoDictionary]objectForKey:@"BASE_URL"]]];
    Crusher *crusher = [Crusher new];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[Crusher mapping] method:RKRequestMethodGET pathPattern:query keyPath:@"Crusher Data" statusCodes:nil];
    [objectManager addResponseDescriptor:responseDescriptor];
    [objectManager getObject:crusher path:query parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [self.delegate didFetchCrusherData:(Crusher *)[mappingResult firstObject]];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self.delegate didFailFetchingCrusherData:error];
    }];
}

-(void) updateCrusherData:(Crusher *) data
{
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:[[[NSBundle mainBundle]infoDictionary]objectForKey:@"BASE_URL"]]];
    
    NSDictionary *crusherDictionary = @{@"a": [NSString stringWithFormat:@"%f", data.gradeA], @"b": [NSString stringWithFormat:@"%f",data.gradeB], @"c": [NSString stringWithFormat:@"%f",data.gradeC], @"d": [NSString stringWithFormat:@"%f",data.gradeD], @"e":[NSString stringWithFormat:@"%f",data.gradeE], @"f":[NSString stringWithFormat:@"%f",data.gradeF], @"g":[NSString stringWithFormat:@"%f",data.gradeG], @"h":[NSString stringWithFormat:@"%f",data.gradeH], @"i":[NSString stringWithFormat:@"%f",data.gradeI],@"tonnes":[NSString stringWithFormat:@"%f",data.tonsAtCrusher]};
    [objectManager  setAcceptHeaderWithMIMEType:@"application/json"];
    
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/plain"];
    [[objectManager HTTPClient]getPath:@"insertCrushData" parameters:crusherDictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        [[self delegate]didSendCrusherData:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[self delegate]didFailSendingCrusherData:error];
    }];
}

@end
