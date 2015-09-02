//
//  ViewController.m
//  界面跳转Demo
//
//  Created by WenJie on 15/8/31.
//  Copyright (c) 2015年 fosung_newMac. All rights reserved.
//

#import "ViewController.h"
#import "WJVCJump.h"
@interface ViewController ()<WJVCtrlJumpProtocol>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"age:%ld",self.age);
    
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(10, 10, 100, 100)];
    [btn1 setBackgroundColor:[UIColor blueColor]];
    [btn1 setTitle:@"跳转" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10, 120, 100, 100)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)jump{
    [self jumpToViewController:WJCreatViewController("ViewController3") params:nil jumpOptions:WJVCtrlJumpWayAuto];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)back
{
    [self goback];
}

@end
