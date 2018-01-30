//
//  BaseCycle.m
//  MFCycle
//
//  Created by BackNotGod on 2018/1/28.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import "BaseCycle.h"
#import "Vender.h"
@interface BaseCycle (){
    BOOL isInitlaizal;
    UIBezierPath* bPath;
}

@end
@implementation BaseCycle



- (void)startWithBursh:(Bursher *)bursh roll:(RollCycle *)roll{
    isInitlaizal = YES;
    self.bursh = bursh;
    self.roll = roll;
    [self setFillColor:[UIColor clearColor].CGColor];
    [self setStrokeColor:[Vender randomColor].CGColor];

    bPath = [UIBezierPath bezierPath];
    [self observeCurrentPoint];
}


- (void)observeCurrentPoint{
    
    CADisplayLink* link = [CADisplayLink displayLinkWithTarget:self selector:@selector(readPoint)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)readPoint{
    
    CGPoint cycleInSelf = [_roll convertPoint:_roll.presentationLayer.frame.origin toLayer:self];
    CGPoint brushInSelf = [self convertPoint:_bursh.presentationLayer.position toLayer:_roll];
    

    CGPoint prepareDrawPoint = CGPointMake(cycleInSelf.x+brushInSelf.x, brushInSelf.y+cycleInSelf.y);
    
    if (isInitlaizal) {
        isInitlaizal = NO;
        [bPath moveToPoint:prepareDrawPoint];
        
    }else{
        [bPath addLineToPoint:prepareDrawPoint];
        self.path = bPath.CGPath;
    }
    

}



    


@end
