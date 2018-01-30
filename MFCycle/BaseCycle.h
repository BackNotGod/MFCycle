//
//  BaseCycle.h
//  MFCycle
//
//  Created by BackNotGod on 2018/1/28.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bursher.h"
#import "RollCycle.h"
@interface BaseCycle : CAShapeLayer

@property(nonatomic,strong)Bursher* bursh;
@property(nonatomic,strong)RollCycle* roll;



- (void)startWithBursh:(Bursher*)bursh roll:(RollCycle*)roll;

@end
