//
//  ViewController.m
//  percentCircleView
//
//  Created by 中投德利 on 2018/6/4.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "ViewController.h"
#import "JackPercentView.h"

@interface ViewController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet JackPercentView *percentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float a = 10.0,b = 20.0,c = 30.0,d = 40.0;
    float total = a + b + c + d;
    self.percentView.circleArray =@[ @{@"strokeColor":[UIColor blackColor],@"precent":@(a/total)},
                                     @{@"strokeColor":[UIColor redColor],@"precent":@(b/total)},
                                     @{@"strokeColor":[UIColor orangeColor],@"precent":@(c/total)},
                                     @{@"strokeColor":[UIColor greenColor],@"precent":@(d/total)}
                                     ];
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
