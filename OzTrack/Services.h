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

@optional-(void)didFetchBlendTarget:(id)responseObject;
@optional-(void)didFailFetchingBlendTarget:(NSError *)error;
@optional-(void)didFetchTruckData:(id)truckResponse;
@optional-(void)didFailFetchingTruckData:(NSError *)error;
@optional-(void)didFetchCrusherData:(id)crusherResponse;
@optional-(void)didFailFetchingCrusherData:(NSError *)error;
@optional-(void)didSendCrusherData:(id)response;
@optional-(void)didFailSendingCrusherData:(NSError *)error;

@end

@interface Services : NSObject

@property(nonatomic, weak) id<ServicesDelegate> delegate;
-(Services *)initWithDelegate:(id <ServicesDelegate>)delegate;
-(void) fetchTargetBlendData:(NSString *) query;
-(void) fetchCrusherData:(NSString *) query;
-(void) fetchTruckData:(NSString *) query;
-(void) sendCrusherData:(NSString *)data;

@end
