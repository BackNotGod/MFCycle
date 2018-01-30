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

@interface ViewController (){
    BOOL running;
}
@property(nonatomic,strong)RollCycle* roll;
@property(nonatomic,strong)BaseCycle* baseCycle;

@end

@implementation ViewController

- (IBAction)startClick:(UIButton *)sender {
    
    if (running) {
        return;
    }
    running = YES;
    [self.roll roll];
}
- (IBAction)endClick:(UIButton *)sender {
    [self.roll stop];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    running = NO;
    BaseCycle* cycle = [[BaseCycle alloc] init];
    BaseCycle* showcycle = [[BaseCycle alloc] init];

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
    
    
    RollCycle* roll = [[RollCycle alloc] init];
    CGPoint arcCenter = [Vender transfromRectToCener:rect];
    CGFloat radius = 90;

    roll.frame = CGRectMake(0, 0, radius*2, radius*2);
    roll.position = CGPointMake(radius, 150);
//    roll.backgroundColor = [UIColor greenColor].CGColor;
    
    UIBezierPath* rollPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [rollPath setLineWidth:1];
    roll.path = rollPath.CGPath;
    [roll setFillColor:[UIColor clearColor].CGColor];
    [roll setStrokeColor:[UIColor blueColor].CGColor];

    roll.hidden = YES;
    // pro
    roll.baseRadius = 150;
    roll.baseCenter = arcCenter;
    roll.baseCyclePath = basePath;
    roll.baseRect = rect;
    roll.selfRadius = radius;
    
    self.roll = roll;
    [cycle addSublayer:roll];
    
    
    /// debug
//    [roll addDebugPoint:CGPathGetPathBoundingBox(roll.path).origin];
//    [roll addDebugPoint:roll.position color:[UIColor redColor]];
//    [cycle addDebugPoint:cycle.position color:[UIColor blueColor]];
//    [roll addDebugPoint:roll.anchorPoint color:[UIColor yellowColor]];
//    [cycle addDebugLine:rect.origin.y + rect.size.height direction:HORI];
    
    [roll addAnimation:checkAnimation forKey:@"checkAnimation1"];

    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint location = [touches.anyObject locationInView:self.view];
    
    Bursher* b = [Bursher layer];
    b.backgroundColor = [UIColor greenColor].CGColor;
    
    if ([self.roll addBrusher:b point:[self.view.layer convertPoint:location toLayer:_roll]]) {
        [self startClick:nil];
        BaseCycle* cycle = [[BaseCycle alloc] init];
        cycle.frame = self.baseCycle.frame;
        cycle.position = self.baseCycle.position;
        [self.view.layer addSublayer:cycle];
        [cycle startWithBursh:b roll:_roll];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
