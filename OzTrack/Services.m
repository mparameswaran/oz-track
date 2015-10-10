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
-(void)fetchData:(NSString *)query
{
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost:6789"]];
    
    [[objectManager HTTPClient]getPath:query parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [[self delegate]didFetchBlendTarget:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[self delegate]didFailFetchingBlendTarget:error];
    }];
    
                                      
}

@end
