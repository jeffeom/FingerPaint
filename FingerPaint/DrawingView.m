//
//  DrawingView.m
//  FingerPaint
//
//  Created by Jeff Eom on 2016-07-08.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    
    self.path = [[UIBezierPath alloc] init];
        
    [self.path moveToPoint:self.startPoint];
    [self.path addLineToPoint:self.currentPoint];
    
    NSLog(@"Drew Start Point: %f, %f, Current Point: %f, %f", self.startPoint.x, self.startPoint.y, self.currentPoint.x, self.currentPoint.y);
    
    self.path.lineWidth = 5;
    self.path.lineCapStyle = kCGLineCapRound;
    
    [[UIColor blueColor] setStroke];
    [self.path stroke];
        
    for (UIBezierPath *pastPath in self.paths){
        [pastPath stroke];
    }

    
}

@end
