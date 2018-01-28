//
//  BaseView.h
//  MFCycle
//
//  Created by BackNotGod on 2018/1/27.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

/**
 物理仿真器(相当于一个存放运动行为的容器)
 */
@property (nonatomic, strong) UIDynamicAnimator *animator;

/**
 吸附行为
 */
@property (nonatomic, strong) UIAttachmentBehavior *attach;

- (void)attachView:(UIView*)view;


@end
