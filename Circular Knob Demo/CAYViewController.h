//
//  CAYViewController.h
//  Circular Knob Demo
//
//  Created by Scott Erholm on 1/30/14.
//  Copyright (c) 2014 Cayuse Concepts. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "CAYSwirlGestureRecognizer.h"

@interface CAYViewController : UIViewController <CAYSwirlGestureRecognizerDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *controlsView;

@property (strong, nonatomic) IBOutlet UIImageView *knob;
@property (strong, nonatomic) IBOutlet UILabel *position;

@end
