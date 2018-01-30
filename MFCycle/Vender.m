//
//  Vender.m
//  MFCycle
//
//  Created by BackNotGod on 2018/1/29.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import "Vender.h"

@implementation Vender
+ (CGPoint)transfromRectToCener:(CGRect)rect{
    
    CGPoint origin = rect.origin;
    
    CGPoint resOringin = CGPointZero;
    
    resOringin.x = origin.x + rect.size.width/2 ;
    resOringin.y = origin.y + rect.size.height/2 ;
    
    return resOringin;
}



+(UIColor *) randomColor

{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
}

@end
