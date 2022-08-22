//
//  TestView.m
//  DesignDemo
//
//  Created by mqh on 2022/8/18.
//

#import "TestView.h"

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height)];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)clickBtn:(UIButton*) sender{
    
    if ([self.delegate respondsToSelector:@selector(tapView:)]){
        sender.tag = 1;
        NSLog(@"==%s 被调用,代理将调用%@方法",__func__, @"tapView");
        [self.delegate tapView:sender];
    }
    
    if([self.delegate respondsToSelector:@selector(printSomething)]){
        NSLog(@"==%s 被调用,代理将调用%@方法",__func__, @"printSomething");
        [self.delegate printSomething];
    }
}

@end
