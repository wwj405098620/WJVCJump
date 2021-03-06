//
//  ViewController2.m
//  界面跳转Demo
//
//  Created by WenJie on 15/8/31.
//  Copyright (c) 2015年 fosung_newMac. All rights reserved.
//

#import "ViewController2.h"
#import "WJVCJump.h"

@interface ViewController2 ()<WJVCtrlJumpProtocol>

@end


@implementation ViewController2
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10, 10, 100, 100)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(120, 10, 100, 100)];
    [btn1 setBackgroundColor:[UIColor blueColor]];
    [btn1 setTitle:@"跳转" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    NSLog(@"name:%@",self.name);
}

- (void)back{
    [self goback];
}
- (void)jump{
    [self jumpToViewController:WJCreatViewController("ViewController") params:@{@"age":@"1"} jumpOptions:WJVCtrlJumpWayModal];
}
@end
