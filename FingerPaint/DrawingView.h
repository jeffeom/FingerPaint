//
//  DrawingView.h
//  FingerPaint
//
//  Created by Jeff Eom on 2016-07-08.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingView : UIView

@property CGPoint currentPoint;
@property CGPoint startPoint;
@property CGPoint endPoint;

@property UIBezierPath *path;

@end
