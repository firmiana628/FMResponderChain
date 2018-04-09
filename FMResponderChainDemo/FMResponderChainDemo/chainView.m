//
//  chainView.m
//  FMResponderChainDemo
//
//  Created by lidaoyuan on 2018/4/9.
//  Copyright © 2018年 lidaoyuan. All rights reserved.
//

#import "chainView.h"
#import "FMResponderRouterProtocol.h"
#import "UIResponder+Router.h"
@implementation chainView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatSubviews];
    }
    return self;
}

-(void)creatSubviews
{
    self.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 200, 50);
    button.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(postResponder:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    
}

-(void)postResponder:(UIButton *)sender
{
    [self routerEventWithName:FMRouterEventNamePop userInfo:nil];
}



@end
