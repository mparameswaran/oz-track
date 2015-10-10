//
//  ViewController.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *optionsTable;
@property (strong, nonatomic) NSDictionary *options;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _options = @{@"Metrics":@"Evaluate and display time information", @"Blending Target":@"View and edit blending target", @"Direct Tip":@"View possible direct tip"};
    [[self optionsTable] setDelegate:self];
    [[self optionsTable] setDataSource:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"OptionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    [[cell textLabel]setText:[[[self options]allKeys]objectAtIndex:[indexPath row]]];
    [[cell detailTextLabel]setText:[[[self options]allValues]objectAtIndex:[indexPath row]]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self options]count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showInfo" sender:[tableView cellForRowAtIndexPath:indexPath]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"showInfo"]) {
        DetailViewController *detailViewController = [segue destinationViewController];

        [detailViewController setTitle:[[sender textLabel]text]];
        
    }
}

@end
