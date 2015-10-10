//
//  Services.h
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>


@protocol ServicesDelegate <NSObject>

-(void)didFetchBlendTarget:(id)responseObject;
-(void)didFailFetchingBlendTarget:(NSError *)error;

@end

@interface Services : NSObject

@property(nonatomic, weak) id<ServicesDelegate> delegate;
-(Services *)initWithDelegate:(id <ServicesDelegate>)delegate;
-(void) fetchData:(NSString *) query;
@end
