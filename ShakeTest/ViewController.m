//
//  ViewController.m
//  ShakeTest
//
//  Created by liuwei on 12-12-10.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ([self isFirstResponder])
    {
        if (motion != UIEventSubtypeMotionShake) return;
        
        NSLog(@"hey, you shook me!");
    }
    else
    {
        [super motionEnded:motion withEvent:event];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self bgMove];
}

- (void) bgMove
{
    CGRect newFrame = self.bgImage.frame;
    newFrame.origin.y = -self.bgImage.frame.size.height;
    
	// Do any additional setup after loading the view, typically from a nib.
    [UIView animateWithDuration:5.0
                          delay:0.0
                        options:UIViewAnimationCurveLinear
                     animations:^{
                         [self.bgImage setFrame:newFrame];
                     }
                     completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_bgImage release];
    [super dealloc];
}
@end
