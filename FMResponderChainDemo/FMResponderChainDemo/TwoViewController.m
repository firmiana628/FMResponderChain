//
//  TwoViewController.m
//  FMResponderChainDemo
//
//  Created by lidaoyuan on 2018/4/9.
//  Copyright © 2018年 lidaoyuan. All rights reserved.
//

#import "TwoViewController.h"
#import "FMResponderRouterProtocol.h"
#import "UIResponder+Router.h"
#import "chainView.h"

@interface TwoViewController()<FMResponderRouterProtocol>
@end

@implementation TwoViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    chainView *view = [[chainView alloc]initWithFrame:CGRectMake(20, 100, 300, 90)];
    [self.view addSubview:view];
}


-(void)popSelf
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - FMResponderRouterProtocol
- (NSDictionary <NSString *, NSInvocation *> *)eventsMap
{
    return @{
             FMRouterEventNamePop:[self createInvocationWithSelector:@selector(popSelf)]
             };
}

@end
