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
@property(weak, nonatomic) IBOutlet UITextView *crusherTextView;
@property(weak, nonatomic) IBOutlet UITextView *truckTextView;
@property(weak, nonatomic) IBOutlet UIWebView *graphView;







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
   
    [activityIndicator setFrame:CGRectMake(50, 150, 75, 75)];
    [crusherActivity setFrame:CGRectMake(230, 150, 75, 75)];
    
    [[self truckLabel]setText:@"Fetching truck data..."];
    
    [[self crusherLabel]setText:@"Fetching crusher data..."];
    [[self crusherTextView]setDelegate:self];
    [[self crusherTextView]setFrame:CGRectMake(210, 240, 180, 250)];
    [[self truckTextView]setFrame:CGRectMake(12, 240, 180, 250)];
    [[self truckTextView]setUserInteractionEnabled:NO];
    [[self crusherLabel]setFrame:CGRectMake(210, 130, 180, 30)];
    [[self truckLabel]setFrame:CGRectMake(30, 130, 180, 30)];
    [[self crusherTextView]setUserInteractionEnabled:NO];
    [[self graphView]setFrame:CGRectMake(210, 400, 190, 190)];
    [[self graphView]setDelegate:self];
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
    [truckService fetchTruckData:@"RD1818"];
    Services *crusherService = [[Services alloc]initWithDelegate:self];
    [crusherService fetchCrusherData:@"viewCrusherData"];
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
    truck = (Truck *)truckResponse;
    
    NSString *truckDetails = [NSString stringWithFormat:@"Grade A: \t%0.2f\nGrade B: \t%0.2f\nGrade C: \t%0.2f\nGrade D: \t%0.2f\nGrade E: \t%0.2f\nGrade F: \t%0.2f\nGrade G: \t%0.2f\nGrade H: \t%0.2f\nGrade I: \t\t%0.2f\nTons: \t\t%0.2f", truck.gradeA, truck.gradeB, truck.gradeC, truck.gradeD, truck.gradeE, truck.gradeF, truck.gradeG, truck.gradeH, truck.gradeI,crusher.tons ];
    [[self truckTextView]setText:truckDetails];
   
    
}

-(void)didFailFetchingTruckData:(NSError *)error
{
    NSLog(@"Error: %@", [error localizedDescription]);
}


-(void)didFetchCrusherData:(id)crusherResponse
{
    [crusherActivity stopAnimating];
    crusher = (Crusher *)crusherResponse;
    [[self crusherLabel]setText:@"Crusher Data"];
    NSString *crusherDetails = [NSString stringWithFormat:@"Grade A: \t%0.2f\nGrade B: \t%0.2f\nGrade C: \t%0.2f\nGrade D: \t%0.2f\nGrade E: \t%0.2f\nGrade F: \t%0.2f\nGrade G: \t%0.2f\nGrade H: \t%0.2f\nGrade I: \t\t%0.2f\nTons: \t\t%0.2f", crusher.gradeA, crusher.gradeB, crusher.gradeC, crusher.gradeD, crusher.gradeE, crusher.gradeF, crusher.gradeG, crusher.gradeH, crusher.gradeI, crusher.tons ];
    [[self crusherTextView]setText:crusherDetails];
    
    
        if(!truck)
        {
            Services *service = [[Services alloc]initWithDelegate:self];
            [service fetchTruckData:@"truck"];
        }
        else{
            if ([crusher canDirectTip:truck]) {
                

                NSURL *url = [NSURL URLWithString:@"http://192.168.0.4:8080/Crusher/CrushGauge.html"];
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                [[self graphView]loadRequest:request];
                NSLog(@"Can direct tip!");
            }
            
        }
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //do more calculations here
}


-(void)didFailFetchingCrusherData:(NSError *)error
{
    NSLog(@"Error: %@", [error localizedDescription]);
}
@end
