//
//  DetailViewController.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "DetailViewController.h"
#import "Truck.h"
#import "Crusher.h"
@interface DetailViewController()
@property(weak, nonatomic) IBOutlet UILabel *truckLabel;
@property(weak, nonatomic) IBOutlet UILabel *crusherLabel;








@end


@implementation DetailViewController
UIActivityIndicatorView * activityIndicator;
UIActivityIndicatorView *crusherActivity;
NSArray *truckData;
NSArray *crusherData;
Truck *truck;
Crusher *crusher;

-(void)viewDidLoad
{

  
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    crusherActivity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
   
    [activityIndicator setFrame:CGRectMake(50, 100, 75, 75)];
    [crusherActivity setFrame:CGRectMake(230, 100, 75, 75)];

    [[self truckLabel]setText:@"Fetching truck data..."];
    
    [[self crusherLabel]setText:@"Fetching crusher data..."];
    
    [[self view]bringSubviewToFront:[self truckLabel]];
    [[self view]bringSubviewToFront:[self crusherLabel]];
    [[self view]addSubview:activityIndicator];
    [[self view]bringSubviewToFront:activityIndicator];
    [[self view]addSubview:crusherActivity];
    [[self view]bringSubviewToFront:crusherActivity];
    [activityIndicator startAnimating];
    [[activityIndicator layer]setCornerRadius:10];
    [activityIndicator setBackgroundColor:[UIColor darkGrayColor]];
    [crusherActivity startAnimating];
    [[crusherActivity layer]setCornerRadius:10];
    [crusherActivity setBackgroundColor:[UIColor darkGrayColor]];
    Services *truckService = [[Services alloc]initWithDelegate:self];
    [truckService fetchTruckData:@"truck"];
    Services *crusherService = [[Services alloc]initWithDelegate:self];
    [crusherService fetchCrusherData:@"crusher"];
}

-(void)didFailFetchingBlendTarget:(NSError *)error
{

}

-(void) didFetchBlendTarget:(id)responseObject
{
  
}

-(void)didFetchTruckData:(id)truckResponse
{
    [activityIndicator stopAnimating];
    
    [[self truckLabel]setText:@"Truck Data"];
    
    
   
    
}

-(void)didFailFetchingTruckData:(NSError *)error
{
    NSLog(@"Error: %@", [error localizedDescription]);
}


-(void)didFetchCrusherData:(id)crusherResponse
{
    [crusherActivity stopAnimating];
    [[self crusherLabel]setText:@"Crusher Data"];
    NSLog(@"Response Object: %@", crusherResponse);
}

-(void)didFailFetchingCrusherData:(NSError *)error
{
    NSLog(@"Error: %@", [error localizedDescription]);
}
@end
