//
//  UIResponder+Router.m
//  BananaBall
//
//  Created by lidaoyuan on 2018/1/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIResponder+Router.h"
#import "FMResponderRouterProtocol.h"
@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    if ([self conformsToProtocol:@protocol(FMResponderRouterProtocol)]) {
        NSDictionary *eventStrategyDic = [self performSelector:@selector(eventsMap)];
        if (eventStrategyDic[eventName]) {
            NSInvocation *invocation = eventStrategyDic[eventName];
            if(userInfo){
                [invocation setArgument:&userInfo atIndex:2];
            }
            [invocation invoke];
        }else{
            [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
        }
    }else{
        [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
    }
}


-(NSInvocation *)createInvocationWithSelector:(SEL)select
{
    NSMethodSignature *methodSignature = [self methodSignatureForSelector:select];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    invocation.selector = select;
    invocation.target = self;
    return invocation;
}
@end
