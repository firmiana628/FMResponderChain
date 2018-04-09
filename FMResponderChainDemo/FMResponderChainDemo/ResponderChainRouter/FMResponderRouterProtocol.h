//
//  BBResponderRouterProtocol.h
//  BananaBall
//
//  Created by lidaoyuan on 2018/1/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FMResponderRouterProtocol <NSObject>

@required

/**
 事件映射的map,key是响应事件的名字,value是方法

 @return map
 */
- (NSDictionary <NSString *, NSInvocation *> *)eventsMap;

@end


// 退出直播间
extern NSString * const FMRouterEventNamePop;


