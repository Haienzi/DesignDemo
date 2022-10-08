//
//  AbstractObjectList.h
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//

#import <Foundation/Foundation.h>
#import "AbstractIterator.h"

NS_ASSUME_NONNULL_BEGIN

@interface AbstractObjectList : NSObject
- (void) addObject:(id) object;
- (void) removeObject:(id) object;
- (NSArray *) getObjects;
- (AbstractIterator) createIterator; //创建迭代器对象的抽象工厂方法
@end

NS_ASSUME_NONNULL_END
