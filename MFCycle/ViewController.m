//
//  ViewController.m
//  MFCycle
//
//  Created by BackNotGod on 2018/1/27.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import "ViewController.h"
#import "BaseCycle.h"
#import "RollCycle.h"
#import "Bursher.h"
#import "Vender.h"
#import "CALayer+Debug.h"
#import <math.h>
@interface ViewController (){
    BOOL running;
}
@property(nonatomic,strong)RollCycle* roll;
@property(nonatomic,strong)BaseCycle* baseCycle;

@property(nonatomic,strong)NSMutableArray* rolls;

@end

@implementation ViewController

- (IBAction)startClick:(UIButton *)sender {
    
//    if (running) {
//        return;
//    }
    running = YES;
//    [self.roll roll];
    NSInteger i = 0;
    for (RollCycle* roll  in self.rolls) {
        Bursher* b = [Bursher layer];
        b.backgroundColor = [UIColor greenColor].CGColor;
        BaseCycle* cycle = [[BaseCycle alloc] init];
        [roll addBrusher:b point:CGPointMake(22, 22)];
        [roll rollIndex:i];
        cycle.frame = self.baseCycle.frame;
        cycle.position = self.baseCycle.position;
        [self.view.layer addSublayer:cycle];
        [cycle startWithBursh:b roll:roll];
        i++;
    }
    
    
    
}
- (IBAction)endClick:(UIButton *)sender {
    [self.roll stop];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    running = NO;
    
    self.rolls = [[NSMutableArray alloc] initWithCapacity:4];
    
    
    BaseCycle* cycle = [[BaseCycle alloc] init];
    BaseCycle* showcycle = [[BaseCycle alloc] init];

    CGFloat baseRadius = 150;
    
    CGRect rect = CGRectMake(0, 0, 300, 300);
    
    showcycle.frame = rect;
    showcycle.position = self.view.center;
    
    cycle.frame = rect;
    cycle.position = self.view.center;
    UIBezierPath * basePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:150];
    [basePath setLineWidth:1];
    cycle.path = basePath.CGPath;
    showcycle.path = basePath.CGPath;
    
    [cycle setFillColor:[UIColor clearColor].CGColor];

    [showcycle setFillColor:[UIColor clearColor].CGColor];
    [showcycle setStrokeColor:[UIColor redColor].CGColor];
    
    
    [self.view.layer addSublayer:cycle];
    [self.view.layer addSublayer:showcycle];
    self.baseCycle = cycle;

    
    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimation.duration = 1.5f;
    checkAnimation.fromValue = @(0.0f);
    checkAnimation.toValue = @(1.0f);
//    checkAnimation.delegate = self;
    [cycle addAnimation:checkAnimation forKey:@"checkAnimation"];
    
    
    for (int i = 0; i < 36; i++) {
        
        RollCycle* roll = [[RollCycle alloc] init];
        CGPoint arcCenter = [Vender transfromRectToCener:rect];
        CGFloat radius = 50;
        
        roll.frame = CGRectMake(0, 0, radius*2, radius*2);
        
        CGFloat padding = baseRadius - radius;
        CGFloat radian = 10*i;// 弧度
        roll.radian = radian;
        // 余弦
        CGFloat xP = cos(radian)*padding;
        
        CGFloat x = baseRadius - xP;
        
        // 正弦
        CGFloat yP = sin(radian)*padding;
        CGFloat y  = baseRadius - yP;
        
        roll.position = CGPointMake(x, y);

        UIBezierPath* rollPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
        [rollPath setLineWidth:1];
        roll.path = rollPath.CGPath;
        [roll setFillColor:[UIColor clearColor].CGColor];
        [roll setStrokeColor:[UIColor blueColor].CGColor];
//        roll.backgroundColor = [UIColor yellowColor].CGColor;
//            roll.hidden = YES;
        // pro
        roll.baseRadius = 150;
        roll.baseCenter = arcCenter;
        roll.baseCyclePath = basePath;
        roll.baseRect = rect;
        roll.selfRadius = radius;

//        self.roll = roll;
        [cycle addSublayer:roll];
        
        
        /// debug
        //    [roll addDebugPoint:CGPathGetPathBoundingBox(roll.path).origin];
        //    [roll addDebugPoint:roll.position color:[UIColor redColor]];
        //    [cycle addDebugPoint:cycle.position color:[UIColor blueColor]];
        //    [roll addDebugPoint:roll.anchorPoint color:[UIColor yellowColor]];
        //    [cycle addDebugLine:rect.origin.y + rect.size.height direction:HORI];
        
        [roll addAnimation:checkAnimation forKey:@"checkAnimation1"];
        
        [self.rolls addObject:roll];
    }
 

    
}



//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    CGPoint location = [touches.anyObject locationInView:self.view];
//
//    Bursher* b = [Bursher layer];
//    b.backgroundColor = [UIColor greenColor].CGColor;
//
//    if ([self.roll addBrusher:b point:[self.view.layer convertPoint:location toLayer:_roll]]) {
//        [self startClick:nil];
//        BaseCycle* cycle = [[BaseCycle alloc] init];
//        cycle.frame = self.baseCycle.frame;
//        cycle.position = self.baseCycle.position;
//        [self.view.layer addSublayer:cycle];
//        [cycle startWithBursh:b roll:_roll];
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
