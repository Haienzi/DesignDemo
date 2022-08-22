//
//  SingletonTest.m
//  DesignDemo
//
//  Created by mqh on 2022/8/5.
//

#import "SingletonTest.h"

@implementation SingletonTest

static SingletonTest * singleton = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[[self class] alloc] init];
    });
    return singleton;
//    return [[self alloc] init];
}

//调用alloc方法时，会自动调用allocWithZone方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [super allocWithZone:zone];
    });
    return singleton;
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.count = 1;
//        self.singletonStr = @"单例模式";
//        self.arrayM = [[NSMutableArray alloc] init];
//    }
//    return self;
//}

// init方法调用dispatch_once 避免多次对属性进行初始化
- (instancetype) init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [super init];
        self.count = 1;
        self.singletonStr = @"单例模式";
        self.arrayM = [[NSMutableArray alloc] init];
    });
    return singleton;
}

- (NSString *) description {
    NSString * result = @"";
    result = [result stringByAppendingFormat:@"<%@, %p>",[self class], self];
    result = [result stringByAppendingFormat:@" count = %ld ", (long)self.count];
    result = [result stringByAppendingFormat:@" singletonStr = %@", self.singletonStr];
    result = [result stringByAppendingFormat:@" arrayM = %p ", self.arrayM];
    return result;
}

@end
