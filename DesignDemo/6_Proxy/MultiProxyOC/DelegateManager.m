//
//  DelegateManager.m
//  DesignDemo
//
//  Created by mqh on 2022/8/17.
//

#import "DelegateManager.h"

@interface DelegateManager()
@property(nonatomic,strong) NSMapTable * protocols;

@end

@implementation DelegateManager

static DelegateManager * delegateCenter = nil;

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        delegateCenter = [[DelegateManager alloc]init];
    });
    return  delegateCenter;
}

- (void)addTarget:(id)target withProtocol:(NSString *) protocol {
    NSHashTable * targets = [self.protocols objectForKey:protocol];
    //判断是否存在代理列表，不存在则创建
    if(targets) {
        //判断列表是否存在该对象
        if([targets.allObjects containsObject:target]){
            return;
        }
    }else{
        //targets弱引用
        targets = [NSHashTable weakObjectsHashTable];
    }
    //添加代理对象
    [targets addObject:target];
    [self.protocols setObject:targets forKey:protocol];
}

- (void)removeTarget:(id)target withProtocol:(NSString *)protocol {
    //遍历协议代理列表，删除指定的协议遵守者
    NSHashTable * targets = [self.protocols objectForKey:protocol];
    if([targets.allObjects containsObject:target]) {
        [targets removeObject:target];
    }
}

- (void)removeProtocol:(NSString *) protocol {
    //删除指定的协议遵守者列表
    [self.protocols removeObjectForKey:protocol];
}

- (void)removeAllProtocol {
    //清空所有协议以及对应的协议遵守者
    [self.protocols removeAllObjects];
}

//判断方法是否实现 防止出现异常
- (BOOL)respondsToSelector:(SEL)aSelector {
    //判断是否实现了某方法 实现直接返回YES
    if([super respondsToSelector:aSelector]){
        return YES;
    }
    //遍历代理查看是否能响应响应方法
    NSEnumerator * enumerator = [self.protocols objectEnumerator];
    for(NSHashTable * targets in enumerator.allObjects) {
        for(id target in targets){
            if ([target respondsToSelector: aSelector]){
                return YES;
            }
        }
    }
    return NO;
}

/// 重载方返回函数签名，防止崩溃？
/// @param aSelector aSelector description
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature * signature = [super methodSignatureForSelector:aSelector];
    if(!signature){
        NSEnumerator * enumerator = [self.protocols objectEnumerator];
        for(NSHashTable * targets in enumerator.allObjects) {
            for(id target in targets){
                if ((signature = [target methodSignatureForSelector:aSelector])){
                    break;
                }
            }
        }
    }
    return signature;
}

/// 执行方法 从NSInvocation中截获selector，设置selector的调用者，遍历执行
/// @param anInvocation anInvocation description
- (void)forwardInvocation:(NSInvocation *) anInvocation {
    //遍历代理查看是否能响应响应方法
    NSEnumerator * enumerator = [self.protocols objectEnumerator];
    for(NSHashTable * targets in enumerator.allObjects) {
        for(id target in targets){
            //判断是否能够响应方法 能响应则进行消息转发
            if ([target respondsToSelector: anInvocation.selector]){
                [anInvocation invokeWithTarget:target];
            }
        }
    }
}

#pragma getter
- (NSMapTable *)protocols {
    if(!_protocols) {
        //键弱引用，值强引用
        _protocols = [NSMapTable weakToStrongObjectsMapTable];
    }
    return _protocols;
}

@end
