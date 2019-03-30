//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;

    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    // The largest circle will circumstribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;

    UIBezierPath *path = [[UIBezierPath alloc] init];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];

        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }

    // Configure line width to 10 points
    path.lineWidth = 10;

    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];

    // Draw the line!
    [path stroke];
    
    // Build the triangle area
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    
    CGPoint sPoints[3];
    sPoints[0] = CGPointMake(bounds.size.width * 0.5, bounds.size.height * 0.2);
    sPoints[1] = CGPointMake(bounds.size.width * 0.18, bounds.size.height * 0.85);
    sPoints[2] = CGPointMake(bounds.size.width * 0.82, bounds.size.height * 0.85);
    UIBezierPath *myPath = [[UIBezierPath alloc] init];
    [myPath moveToPoint:sPoints[0]];
    [myPath addLineToPoint:sPoints[1]];
    [myPath addLineToPoint:sPoints[2]];
    [myPath closePath];
    [myPath addClip];
    
    // Draw Gradient
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0 };
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    CGPoint startPoint = CGPointMake(0.0, bounds.size.height * 0.85);
    CGPoint endPoint = CGPointMake(0.0, bounds.size.height * 0.2);
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    CGContextRestoreGState(currentContext);
    
    // Draw the shadow
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(8.0, 8.0), 4.0);
    CGRect r = [[UIScreen mainScreen] bounds];
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:CGRectMake(r.size.width * 0.2, r.size.height * 0.2, r.size.width * 0.6, r.size.height * 0.6)];
    CGContextRestoreGState(currentContext);
}

@end
