//
//  DetailViewController.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "DetailViewController.h"
#import "Truck.h"

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
    NSLog(@"Target crusher: %@", self.targetCrusher);
  
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


    [[self truckLabel]setText:@"Truck Data for RD1818"];
    truck = (Truck *)truckResponse;
    
    NSString *truckDetails = [NSString stringWithFormat:@"Grade A: \t%0.2f\nGrade B: \t%0.2f\nGrade C: \t%0.2f\nGrade D: \t%0.2f\nGrade E: \t%0.2f\nGrade F: \t%0.2f\nGrade G: \t%0.2f\nGrade H: \t%0.2f\nGrade I: \t\t%0.2f\nTons: \t\t%0.2f", truck.gradeA, truck.gradeB, truck.gradeC, truck.gradeD, truck.gradeE, truck.gradeF, truck.gradeG, truck.gradeH, truck.gradeI,truck.tons];
    NSMutableArray *currentGrades = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%0.2f",truck.gradeA], [NSString stringWithFormat:@"%0.2f",truck.gradeB], [NSString stringWithFormat:@"%0.2f",truck.gradeC], [NSString stringWithFormat:@"%0.2f",truck.gradeD], [NSString stringWithFormat:@"%0.2f",truck.gradeE], [NSString stringWithFormat:@"%0.2f",truck.gradeF], [NSString stringWithFormat:@"%0.2f",truck.gradeG], [NSString stringWithFormat:@"%0.2f",truck.gradeH], [NSString stringWithFormat:@"%0.2f",truck.gradeI], nil];
    [truck setCurrentGradesAtTruck:currentGrades];
    [[self truckTextView]setText:truckDetails];
    Services *crusherService = [[Services alloc]initWithDelegate:self];
    [crusherService fetchCrusherData:@"viewCrusherData"];
    
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
    NSString *crusherDetails = [NSString stringWithFormat:@"Grade A: \t%0.2f\nGrade B: \t%0.2f\nGrade C: \t%0.2f\nGrade D: \t%0.2f\nGrade E: \t%0.2f\nGrade F: \t%0.2f\nGrade G: \t%0.2f\nGrade H: \t%0.2f\nGrade I: \t\t%0.2f\nTons: \t\t%0.2f", crusher.gradeA, crusher.gradeB, crusher.gradeC, crusher.gradeD, crusher.gradeE, crusher.gradeF, crusher.gradeG, crusher.gradeH, crusher.gradeI, crusher.tonsAtCrusher ];
    [[self crusherTextView]setText:crusherDetails];
    [crusher setTargetGradesAtCrusher:[self.targetCrusher targetGradesAtCrusher]];
    [crusher setHourlyVariation:[self.targetCrusher hourlyVariation]];
    [crusher setDailyVariation:[self.targetCrusher dailyVariation]];
    
    NSMutableArray *currentGrades = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%0.2f",crusher.gradeA], [NSString stringWithFormat:@"%0.2f",crusher.gradeB], [NSString stringWithFormat:@"%0.2f",crusher.gradeC], [NSString stringWithFormat:@"%0.2f",crusher.gradeD], [NSString stringWithFormat:@"%0.2f",crusher.gradeE], [NSString stringWithFormat:@"%0.2f",crusher.gradeF], [NSString stringWithFormat:@"%0.2f",crusher.gradeG], [NSString stringWithFormat:@"%0.2f",crusher.gradeH], [NSString stringWithFormat:@"%0.2f",crusher.gradeI], nil];
    [crusher setCurrentGradesAtCrusher:currentGrades];
        if(!truck)
        {
            Services *service = [[Services alloc]initWithDelegate:self];
            [service fetchTruckData:@"RD1818"];
        }
        else{
            if ([crusher canDirectTip:truck]) {
                [[self truckTextView]setBackgroundColor:[UIColor colorWithHexCode:0x6AE37F withAlpha:1.0]];

                NSURL *url = [NSURL URLWithString:@"http://192.168.52.25:8080/Crusher/CrushGauge.html"];
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                
                [crusher updateWithTruckData:truck];
               [[self graphView]loadRequest:request];
                
           // [[self graphView]loadHTMLString:@"<html><head></head><body><div id='chart_div' style='width: 400px; height: 120px;'></div>Tonnes in Crusher</body><script type='text/javascript' src='https://www.google.com/jsapi'></script><script type='text/javascript'>google.load('visualization', '1', {packages:['gauge']});google.setOnLoadCallback(drawChart);var init_value = 400;var final_value = 628;var max_value = 40000;function drawChart() {var data = google.visualization.arrayToDataTable([['Label', 'Value'],['', init_value],]);var options = {width: 250, height: 120,redFrom: 30000, redTo: 40000,yellowFrom:25000, yellowTo: 30000,greenFrom: 5000, greenTo: 25000,min: 0, max: 40000,majorTicks: ['0','','','','20000','','','','40000'],minorTicks: 10};var chart = new google.visualization.Gauge(document.getElementById('chart_div'));chart.draw(data, options);setInterval(function() {data.setValue(0, 1, final_value);chart.draw(data, options);}, 2000);}</script></html>" baseURL:nil];
               // [[self graphView]loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CrushGauge" ofType:@"html"]isDirectory:NO]]];
                NSLog(@"Can direct tip!");
            }
            else{
                [[self truckTextView]setBackgroundColor:[UIColor colorWithHexCode:0xFFB6C1 withAlpha:1.0]];
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Evaluation" message:@"Cannot direct tip!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            }
            
        }
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //do more calculations here
    NSLog(@"Web page loaded!");
    [webView stringByEvaluatingJavaScriptFromString:@"drawChart()"];
    [[self crusherLabel]setText:@"Crusher Data Updated"];
    NSString *crusherDetails = [NSString stringWithFormat:@"Grade A: \t%0.2f\nGrade B: \t%0.2f\nGrade C: \t%0.2f\nGrade D: \t%0.2f\nGrade E: \t%0.2f\nGrade F: \t%0.2f\nGrade G: \t%0.2f\nGrade H: \t%0.2f\nGrade I: \t\t%0.2f\nTons: \t\t%0.2f", crusher.gradeA, crusher.gradeB, crusher.gradeC, crusher.gradeD, crusher.gradeE, crusher.gradeF, crusher.gradeG, crusher.gradeH, crusher.gradeI, crusher.tonsAtCrusher ];
    [[self crusherTextView]setText:crusherDetails];

}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    Services *updateCrusherService = [[Services alloc]initWithDelegate:self];
    [updateCrusherService updateCrusherData:crusher];
    
}


-(void)didFailFetchingCrusherData:(NSError *)error
{
    NSLog(@"Error: %@", [error localizedDescription]);
}

-(void)didSendCrusherData:(id)response
{
    NSLog(@"%@",response);
}

-(void)didFailSendingCrusherData:(NSError *)error
{
    NSLog(@"Error: %@", error.localizedDescription);
}
@end
