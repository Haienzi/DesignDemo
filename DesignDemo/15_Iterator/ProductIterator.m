//
//  ProductIterator.m
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//

#import "ProductIterator.h"

@interface  ProductIterator()
@property(nonatomic, strong) NSArray * objects;
@property(nonatomic, assign) NSInteger index;

@end

@implementation ProductIterator
- (instancetype)initWithProductList:(ProductList *) list {
    self = [super init];
    if(self){
        _objects = [list getObjects];
        _index = 0;
    }
    return  self;
}

- (id)getCurrentItem {
    return  self.objects[self.index];
}

- (BOOL)hasLast {
    return self.index == (self.objects.count-1);
}

- (void)next {
    if(self.index < self.objects.count){
        self.index++;
    }
}

@end
