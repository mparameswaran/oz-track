//
//  DetailViewController.h
//  OzTrack
//
//  Created by Madan on 10/10/15.
//  Copyright (c) 2015 Unearthed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Services.h"
#import "Crusher.h"
@interface DetailViewController : UIViewController <ServicesDelegate, UITextViewDelegate, UIWebViewDelegate>



@property(copy, nonatomic) NSString *title;

-(void) setTitle:(NSString *)title;
@property(strong, nonatomic) Crusher *targetCrusher;
@end
