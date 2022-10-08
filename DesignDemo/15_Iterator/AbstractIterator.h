//
//  AbstractIterator.h
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//  抽象迭代器

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AbstractIterator <NSObject>
-(void) next;
-(BOOL) hasLast;
-(id) getCurrentItem;
@end

typedef id<AbstractIterator> AbstractIterator;

NS_ASSUME_NONNULL_END
