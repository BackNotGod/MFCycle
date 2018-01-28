//
//  BaseView.m
//  MFCycle
//
//  Created by BackNotGod on 2018/1/27.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)attachView:(UIView*)view{
    
    view.frame = CGRectMake(0, 0, view.bounds.size.width,  view.bounds.size.height);
    [self addSubview:view];
    
    self.attach = [[UIAttachmentBehavior alloc] initWithItem:view offsetFromCenter:UIOffsetZero attachedToAnchor:self.center];
    // 吸附行为中的两个吸附点之间的距离，通常用这个属性来调整吸附的长度，可以创建吸附行为之后调用。系统基于你创建吸附行为的方法来自动初始化这个长度
    self.attach.length = 2;
    
    // 吸附行为震荡的频率
    self.attach.frequency = .1;
    // 描述吸附行为减弱的阻力大小
    self.attach.damping = .3;
    [self.animator addBehavior:self.attach];

}

@end
