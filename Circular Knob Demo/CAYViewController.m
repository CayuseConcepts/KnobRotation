//
//  CAYViewController.m
//  Circular Knob Demo
//
//  Created by Scott Erholm on 1/30/14.
//  Copyright (c) 2014 Cayuse Concepts. All rights reserved.
//

#import "CAYViewController.h"

@interface CAYViewController ()

@property (strong, nonatomic) CAYSwirlGestureRecognizer *swirlGestureRecognizer;
@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation CAYViewController

float bearing = 0.0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.swirlGestureRecognizer = [[CAYSwirlGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    
    [self.swirlGestureRecognizer setDelegate:self];
    
    [self.controlsView addGestureRecognizer:self.swirlGestureRecognizer];
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetToZero:)];
    
    [self.tapGestureRecognizer setDelegate:self];
    
    self.tapGestureRecognizer.numberOfTapsRequired = 2;
    
    [self.controlsView addGestureRecognizer:self.tapGestureRecognizer];
    
    [self.swirlGestureRecognizer requireGestureRecognizerToFail:self.tapGestureRecognizer];
}

- (void)rotationAction:(id)sender {
    
    if([(CAYSwirlGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        return;
    }
    
    CGFloat direction = ((CAYSwirlGestureRecognizer*)sender).currentAngle - ((CAYSwirlGestureRecognizer*)sender).previousAngle;
    
    bearing += 180 * direction / M_PI;
    
    if (bearing < -0.5) {
        bearing += 360;
    }
    else if (bearing > 359.5) {
        bearing -= 360;
    }
    
    CGAffineTransform knobTransform = self.knob.transform;
    
    CGAffineTransform newKnobTransform = CGAffineTransformRotate(knobTransform, direction);

    [self.knob setTransform:newKnobTransform];
    
    self.position.text = [NSString stringWithFormat:@"%dº", (int)lroundf(bearing)];
}

- (void)resetToZero:(id)sender {
    [self animateRotationToBearing:0];
}

- (void)animateRotationToBearing:(int)direction {
    
    bearing = direction;
    
    CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(180 * direction / M_PI);
    
    [UIImageView beginAnimations:nil context:nil];
    [UIImageView setAnimationDelegate:self];
    [UIImageView setAnimationDuration:0.8f];
    [UIImageView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    [self.knob setTransform:rotationTransform];
    
    [UIImageView commitAnimations];
    
    self.position.text = [NSString stringWithFormat:@"%dº", direction];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
