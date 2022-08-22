//
//  SingletonTest.h
//  DesignDemo
//
//  Created by mqh on 2022/8/5.
//  单例模式特点：只初始化一次，生命和程序的声明周期相同，访问方便
//  1、 alloc和allocWithZone
//  2、 单例模式初始化时设置属性默认值，属性的地址是否一致？

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingletonTest : NSObject

+(instancetype)shareInstance;

@property(nonatomic, assign) NSInteger count;
@property(nonatomic, strong) NSString * singletonStr;
@property(nonatomic, strong) NSMutableArray * arrayM;


@end

NS_ASSUME_NONNULL_END
