//
//  Services.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "Services.h"

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
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://192.168.51.189:8080"]];
    
    [[objectManager HTTPClient]getPath:query parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        [[self delegate]didFetchBlendTarget:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[self delegate]didFailFetchingBlendTarget:error];
    }];
    

    
                                      
}


-(void) fetchTruckData:(NSString *) query
{
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://192.168.51.189:8080"]];
    
    [[objectManager HTTPClient]getPath:query parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        [[self delegate]didFetchTruckData:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[self delegate]didFailFetchingTruckData:error];
    }];
}

-(void) fetchCrusherData:(NSString *) query
{
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://192.168.51.189:8080"]];
    
    [[objectManager HTTPClient]getPath:query parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        [[self delegate]didFetchCrusherData:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[self delegate]didFailFetchingCrusherData:error];
    }];
}

-(void) sendCrusherData:(NSString *) data
{
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://192.168.51.189:8080"]];
    
    [[objectManager HTTPClient]getPath:data parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        [[self delegate]didSendCrusherData:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[self delegate]didFailSendingCrusherData:error];
    }];
}

@end
