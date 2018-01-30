//
//  RollCycle.h
//  MFCycle
//
//  Created by BackNotGod on 2018/1/28.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bursher.h"
@interface RollCycle : CAShapeLayer

@property(nonatomic,assign)CGFloat baseRadius;
@property(nonatomic,assign)CGPoint baseCenter;
@property(nonatomic,strong)UIBezierPath* baseCyclePath;
@property(nonatomic,assign)CGRect baseRect;
@property(nonatomic,assign)CGFloat selfRadius;
- (void)roll;

- (void)stop;


- (BOOL)addBrusher:(Bursher*)bursh point:(CGPoint)point;

@end
