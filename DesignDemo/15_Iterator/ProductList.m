//
//  ProductList.m
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//

#import "ProductList.h"
#import "ProductIterator.h"

@implementation ProductList

- (AbstractIterator)createIterator {
    return [[ProductIterator alloc] initWithProductList:self];
}
@end
