//
//  DelegateManager.h
//  DesignDemo
//
//  Created by mqh on 2022/8/17.
//  代理一对多实现，截获OC的方法执行变为遍历执行
//  在某个页面或者某个方法进行某种操作后需要通知整个app
//  当委托方调用方法时，所有注册了协议的类都会接受到协议的方法回调。
//  NSMapTable: key value可以设置弱引用
//  NSPointerArray：设置弱引用或强引用维护
//  NSHashTable:NSSet类似，成员弱引用
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DelegateManager : NSObject

+ (instancetype) shareInstance;

/// 添加代理
/// @param target 协议遵守者
/// @param protocol 协议
- (void)addTarget:(id)target withProtocol:(NSString *) protocol;

/// 删除代理
/// @param target 协议遵守者
/// @param protocol 协议
- (void)removeTarget:(id)target withProtocol:(NSString *) protocol;

/// 删除指定协议以及协议的所有代理
/// @param protocol 协议
- (void)removeProtocol:(NSString *) protocol;

/// 删除所有协议
- (void)removeAllProtocol;

@end

NS_ASSUME_NONNULL_END
