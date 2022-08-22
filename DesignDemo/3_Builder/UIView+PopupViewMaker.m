//
//  UIView+PopupViewMaker.m
//  DesignDemo
//
//  Created by mqh on 2022/8/8.
//

#import "UIView+PopupViewMaker.h"


@implementation UIView (PopupViewMaker)

- (MyPopupView*) makePopupView:(MyPopupView * (^)(PopupViewMaker * _Nonnull)) block {
    PopupViewMaker * maker = [[PopupViewMaker alloc]init];
    MyPopupView * popupView = block(maker);
    return popupView;
}

- (MyPopupView *)makeMyPopupView:(void (^)(PopupViewMaker * _Nonnull))block {
    PopupViewMaker * maker = [[PopupViewMaker alloc]init];
    block(maker);
    return maker.popupView;
}

@end
