//
//  UIResponder+Router.h
//  BananaBall
//
//  Created by lidaoyuan on 2018/1/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)


/**
 发消息,消息将会沿着相应链传递.如果响应者能够处理这条消息,就会处理消息并且停止向下传递.否则将会一直向下传递.
 响应者应该实现协议 FMResponderRouterProtocol

 @param eventName 消息的名字,响应者通过名字识别消息
 @param userInfo 消息传递的信息
 */
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;



/**
 工具方法,通过select构造Invocation

 @param select select
 @return invocation
 */
-(NSInvocation *)createInvocationWithSelector:(SEL)select;

@end
