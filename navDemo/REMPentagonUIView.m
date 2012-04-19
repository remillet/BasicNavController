//
//  REMPentagonUIView.m
//  MilletPentagon
//
//  Created by Richard Millet on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "REMPentagonUIView.h"
#include <math.h>

#define PI 3.14159
#define m_Sides 5

@implementation REMPentagonUIView

@synthesize drawPoint;

- (void)handleTap:(UITapGestureRecognizer *)sender
{     
    CGPoint tapLocation;
    if (sender.state == UIGestureRecognizerStateEnded) {
        tapLocation = [sender locationInView:self];
    }
    
    drawPoint = tapLocation;
    [self setNeedsDisplay];
    
    NSLog(@"Tapped at x:%f y:%f", tapLocation.x, tapLocation.y);
}
    
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)makePentagon:(CGContextRef)context atPoint:(CGPoint)point
{
    CGPoint PointOrigin = point;
        
    CGFloat Ox = PointOrigin.x;
    CGFloat Oy = PointOrigin.y;
    CGFloat Px = Ox + 50;
    CGFloat Py = Oy + 50;
    CGFloat phai = PI / ( m_Sides );
    CGFloat theta = PI / 2 - phai;
    CGFloat hyp = sqrt( ( Px - Ox ) * ( Px - Ox ) + ( Py - Oy ) * ( Py - Oy ) );
    
    CGContextSaveGState(context);
    CGContextBeginPath(context);

    for (int f = 0; f < m_Sides; f ++ )
    {
        CGFloat x1 = hyp * cos( theta );
        CGFloat mu = atan2( Py - Oy , Px - Ox );
        CGFloat x2 = x1 * cos( ( mu - theta ) );
        CGFloat y2 = x1 * sin( ( mu - theta ) );
        // Draw the line
        CGContextMoveToPoint(context, Px, Py);
        CGContextAddLineToPoint(context, Px - 2 * x2, Py - 2 * y2);
        Px = ( Px - 2 * x2 );
        Py = ( Py - 2 * y2 );
    }
    
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self makePentagon:context atPoint:drawPoint];
    NSLog(@"drawRect called.");
}



@end
