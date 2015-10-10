//
//  ViewController.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "TargetTableViewCell.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *optionsTable;
@property (strong, nonatomic) NSDictionary *options;
@property (strong, nonatomic) NSArray *gradeData;

@end
UIActivityIndicatorView *activityIndicator;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _options = @{@"Metrics":@"Evaluate and display time information", @"Blending Target":@"View and edit blending target", @"Direct Tip":@"View possible direct tip"};
    [[self optionsTable] setDelegate:self];
    [[self optionsTable] setDataSource:self];
   
    [[self optionsTable] setHidden:YES];
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [[self view]setBackgroundColor:[UIColor darkGrayColor]];
    [activityIndicator setFrame:CGRectMake(150, 200, 150, 150)];
    [activityIndicator setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [[self view]addSubview:activityIndicator];
    Services *service = [[Services alloc]initWithDelegate:self];
    [service fetchTargetBlendData:@"ClientTarget/viewAll"];
    [activityIndicator startAnimating];
    
}

-(void)didFetchBlendTarget:(id)responseObject
{
    [[self view]setBackgroundColor:[UIColor whiteColor]];
    [self setGradeData:[ NSArray arrayWithArray:(NSArray *)[responseObject objectForKey:@"ClientTargets"]]];
    [activityIndicator stopAnimating];
    [[self optionsTable]setHidden:NO];
    [[self optionsTable]reloadData];
}


-(void)didFailFetchingBlendTarget:(NSError *)error
{
    NSLog(@"Error: %@", [error localizedDescription]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"OptionCell";
    TargetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [TargetTableViewCell cellFromNib:@"TargetTableViewCell"];
    }

    
    [[cell grade]setText:[[[self gradeData] objectAtIndex:indexPath.row]objectForKey:@"letterGrades"]];
    [[cell target]setText:[NSString stringWithFormat:@"Target: %@",[[[self gradeData] objectAtIndex:indexPath.row]objectForKey:@"gradelevels"]]];
    [[cell hourlyVariance]setText:[NSString stringWithFormat:@"Hourly: ±%@%%",[[[self gradeData] objectAtIndex:indexPath.row]objectForKey:@"Hourly_Tol"]]];
    [[cell dailyVariance]setText:[NSString stringWithFormat:@"Daily: ±%@%%",[[[self gradeData] objectAtIndex:indexPath.row]objectForKey:@"Daily_Tol"]]];
    return (UITableViewCell *)cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self gradeData]count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end
