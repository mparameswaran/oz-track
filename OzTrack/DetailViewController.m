//
//  DetailViewController.m
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController()

@property(weak, nonatomic) IBOutlet UILabel *titleLabel;


@end


@implementation DetailViewController

-(void)viewDidLoad
{

    [[self titleLabel]setText:[self title]];
    Services *service = [[Services alloc]initWithDelegate:self];
    [service fetchData:[self title]];
}

-(void)didFailFetchingBlendTarget:(NSError *)error
{
    NSLog(@"Error: %@", [error localizedDescription]);
}

-(void) didFetchBlendTarget:(id)responseObject
{
    NSLog(@"Response Object: %@", responseObject);
}

@end
