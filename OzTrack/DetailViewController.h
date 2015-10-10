//
//  DetailViewController.h
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Services.h"
@interface DetailViewController : UIViewController <ServicesDelegate>



@property(copy, nonatomic) NSString *title;

-(void) setTitle:(NSString *)title;

@end
