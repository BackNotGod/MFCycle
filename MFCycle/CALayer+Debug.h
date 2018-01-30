//
//  CALayer+Debug.h
//  MFCycle
//
//  Created by BackNotGod on 2018/1/29.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DIRECTION) {
    HORI,
    VERT,
};

@interface CALayer (Debug)

- (void)addDebugPoint:(CGPoint)point;

- (void)addDebugPoint:(CGPoint)point color:(UIColor*)color;

- (void)addDebugLine:(CGFloat)offset direction:(DIRECTION)direction;

@end
