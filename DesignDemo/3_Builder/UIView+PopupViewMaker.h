//
//  UIView+PopupViewMaker.h
//  DesignDemo
//
//  Created by mqh on 2022/8/8.
//

#import <UIKit/UIKit.h>
#import "PopupViewMaker.h"
#import "MyPopupView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (PopupViewMaker)

- (MyPopupView*) makePopupView:(MyPopupView * (^)(PopupViewMaker * _Nonnull)) block;

- (MyPopupView*) makeMyPopupView:(void (^)(PopupViewMaker * _Nonnull)) block;
@end

NS_ASSUME_NONNULL_END
