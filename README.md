# FMResponderChain
使用响应链传递数据.


这个小工具是看了Taloyum大神的[这篇博客](https://casatwy.com/responder_chain_communication.html),自己动手简单实现了一下. 
使用前提是接收消息的控件处于发送消息控件的响应链下端.
接收方实现 BBResponderRouterProtocol 的协议方法
```
#pragma mark - FMResponderRouterProtocol
- (NSDictionary <NSString *, NSInvocation *> *)eventsMap
{
    return @{
             FMRouterEventNamePop:[self createInvocationWithSelector:@selector(popSelf)]
             };
}
```
在消息的发送方,使用方法routerEventWithName 发送消息.
```
-(void)postResponder:(UIButton *)sender
{
    [self routerEventWithName:FMRouterEventNamePop userInfo:nil];
}
```