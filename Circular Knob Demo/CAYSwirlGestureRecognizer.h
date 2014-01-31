//
//  CAYSwirlGestureRecognizer.h
//  Sense Of Direction
//
//  Created by Scott Erholm on 10/14/13.
//  Copyright (c) 2013 Cayuse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@protocol CAYSwirlGestureRecognizerDelegate <UIGestureRecognizerDelegate>

@end

@interface CAYSwirlGestureRecognizer : UIGestureRecognizer

@property CGFloat currentAngle;
@property CGFloat previousAngle;

@end
