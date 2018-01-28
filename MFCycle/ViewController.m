//
//  ViewController.m
//  MFCycle
//
//  Created by BackNotGod on 2018/1/27.
//  Copyright © 2018年 terminus. All rights reserved.
//

#import "ViewController.h"
#import "BaseView.h"
#import "AttachView.h"
@interface ViewController ()
@property(nonatomic,strong)BaseView* bView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BaseView* baseview = [[BaseView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    baseview.backgroundColor = [UIColor redColor];
    [self.view addSubview:baseview];
    self.bView = baseview;
    AttachView* attView = [[AttachView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    attView.backgroundColor = [UIColor blackColor];
    
    [baseview attachView:attView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGRect exrect = self.bView.frame;
    exrect.origin = [touches.anyObject locationInView:self.view];
    [UIView animateWithDuration:0.1 animations:^{
        self.bView.frame = exrect;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
