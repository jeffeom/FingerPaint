//
//  ViewController.m
//  FingerPaint
//
//  Created by Jeff Eom on 2016-07-08.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet DrawingView *drawingView;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.drawingView.path = [[UIBezierPath alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)drawGesture:(id)sender {
    UIPanGestureRecognizer *drawGesture = sender;
    
    switch (drawGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.locationFinger = [sender locationOfTouch:0 inView:self.view];
            NSLog(@"Gesture record start: (%f, %f)", self.locationFinger.x, self.locationFinger.y);
            self.drawingView.startPoint = self.locationFinger;
            [self.drawingView.path moveToPoint:self.locationFinger];
            
            break;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            self.locationFinger = [sender locationOfTouch:0 inView:self.view];
            NSLog(@"Gesture recording: (%f, %f)", self.locationFinger.x, self.locationFinger.y);
            self.drawingView.currentPoint = self.locationFinger;
            [self.drawingView.path addLineToPoint:self.locationFinger];
            [self.drawingView setNeedsDisplay];
            
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"Gesture recorded: (%f, %f)", self.locationFinger.x, self.locationFinger.y);
            self.drawingView.currentPoint = self.locationFinger;
            [self.drawingView setNeedsDisplay];
            
            break;
        }
            
        default:
            break;
    }
    
    
}

@end
