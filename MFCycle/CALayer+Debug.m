//
//  CALayer+Debug.m
//  MFCycle
//
//  Created by BackNotGod on 2018/1/29.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import "CALayer+Debug.h"

@implementation CALayer (Debug)

- (void)addDebugPoint:(CGPoint)point{
    
    
    [self addDebugPoint:point color:[UIColor blackColor]];

}

- (void)addDebugPoint:(CGPoint)point color:(UIColor*)color{
    CAShapeLayer * debugLayer = [CAShapeLayer layer];
    
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:point radius:5 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [path setLineWidth:1];
    debugLayer.path = path.CGPath;
    [debugLayer setFillColor:color.CGColor];
    
    [debugLayer setStrokeColor:color.CGColor];
    
    [self.superlayer addSublayer:debugLayer];
}

- (void)addDebugLine:(CGFloat)offset direction:(DIRECTION)direction{
    [self addDebugLine:offset direction:direction color:[UIColor blackColor]];
}

- (void)addDebugLine:(CGFloat)offset direction:(DIRECTION)direction color:(UIColor*)color{
    
    CAShapeLayer * debugLayer = [CAShapeLayer layer];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    CGPoint move = CGPointZero;
    CGPoint add = CGPointZero;

    if (direction == VERT) {
        move = CGPointMake(offset, 0);
        add = CGPointMake(offset, [UIScreen mainScreen].bounds.size.height);
    }else{
        move = CGPointMake(0, offset);
        add = CGPointMake([UIScreen mainScreen].bounds.size.width,offset);
    }
    
    [path moveToPoint:move];
    
    [path addLineToPoint:add];
    [path setLineWidth:1];
    debugLayer.path = path.CGPath;
    [debugLayer setFillColor:color.CGColor];
    
    [debugLayer setStrokeColor:color.CGColor];
    
    [self addSublayer:debugLayer];
    
}

@end
