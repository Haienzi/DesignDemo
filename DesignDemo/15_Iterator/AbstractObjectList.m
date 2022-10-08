//
//  AbstractObjectList.m
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//

#import "AbstractObjectList.h"

@interface AbstractObjectList()
@property(nonatomic,strong) NSMutableArray * objects;
@end

@implementation AbstractObjectList

-(instancetype)init {
    self = [super init];
    if(self){
        _objects = [NSMutableArray array];
    }
    return self;
}

-(void) addObject:(id)object {
    [self.objects addObject:object];
}

-(void) removeObject:(id)object {
    [self.objects removeObject:object];
}

- (NSArray *)getObjects {
    return  self.objects;
}

- (AbstractIterator)createIterator {
    return  nil;
}

@end
