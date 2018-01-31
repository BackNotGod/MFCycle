//
//  RollCycle.m
//  MFCycle
//
//  Created by BackNotGod on 2018/1/28.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import "RollCycle.h"
#import "Vender.h"
#import <math.h>
#import "CALayer+Debug.h"
#define Duration 2.0f

@interface RollCycle (){
//    Bursher * bursher;
    
}

@end

@implementation RollCycle



- (void)rollIndex:(NSInteger)index{
    
    if (_baseRadius<=0 || (_baseCenter.x <= 0 && _baseCenter.y <= 0)) {
        return;
    }
//    CGRect selfRect = CGPathGetPathBoundingBox(self.path);
    
    CGFloat i = (CGFloat)self.radian/360;
    
    UIBezierPath* animationPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_baseRadius, _baseRadius) radius:self.baseRadius - _selfRadius startAngle:i*2*M_PI endAngle:(i*2*M_PI)+M_PI*2 clockwise:YES];
    
    

    CAKeyframeAnimation* keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = animationPath.CGPath;
    keyAnimation.duration = Duration;
    keyAnimation.autoreverses = NO;
    keyAnimation.repeatCount = MAXFLOAT;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.calculationMode = kCAAnimationPaced;
//    keyAnimation.rotationMode = kCAAnimationRotateAutoReverse;
    [self addAnimation:keyAnimation forKey:@"keyframeAnimation"];

}

- (BOOL)addBrusher:(Bursher*)bursh point:(CGPoint)point{
    
    if (!CGRectContainsPoint(CGPathGetPathBoundingBox(self.path), point)) {
        return NO;
    }
    
    CGRect rect = CGRectMake(0, 0, 2, 2);
    
    bursh.frame = rect;
    bursh.position = point;
    
//    bursher = bursh;
    bursh.path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:1].CGPath;
    
//    bursher.backgroundColor = bursher.backgroundColor;
    [self addSublayer:bursh];
    
    CGRect selfRect = CGPathGetPathBoundingBox(self.path);

    CGPoint selfCenter = [Vender transfromRectToCener:selfRect];

    CGFloat radius = sqrt(pow(selfCenter.x - bursh.position.x, 2)+pow(selfCenter.y-bursh.position.y, 2));
    
    UIBezierPath* animationPath = [UIBezierPath bezierPathWithArcCenter:selfCenter radius: radius startAngle:-M_PI endAngle:M_PI clockwise:YES];
    
    CGFloat perimeter = _selfRadius;
    CGFloat basePerimeter = self.baseRadius;

    CGFloat coefficient = (CGFloat)perimeter/basePerimeter;
    
    CAKeyframeAnimation* keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = animationPath.CGPath;
    keyAnimation.duration = (CGFloat)Duration*coefficient;
    keyAnimation.autoreverses = NO;
    keyAnimation.repeatCount = MAXFLOAT;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.calculationMode = kCAAnimationPaced;
    [bursh addAnimation:keyAnimation forKey:@"keyframeAnimationBrush"];
    return YES;
//    [bursh addDebugPoint:bursh.position color:[UIColor blueColor]];
}


@end
