//
//  ProductIterator.h
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//  具体迭代器

#import <Foundation/Foundation.h>
#import "AbstractIterator.h"
#import "ProductList.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProductIterator : NSObject<AbstractIterator>
-(instancetype) initWithProductList:(ProductList *) list;

@end

NS_ASSUME_NONNULL_END
