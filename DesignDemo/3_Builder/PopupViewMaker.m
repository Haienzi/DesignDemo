//
//  AlertBuilder.m
//  DesignDemo
//
//  Created by mqh on 2022/8/2.
//

#import "PopupViewMaker.h"

@interface PopupViewMaker()
@end

@implementation PopupViewMaker

- (PopupViewMaker * _Nonnull (^)(CGRect))createPopupView {
    return ^(CGRect frame) {
        self.popupView = [[MyPopupView alloc] initWithFrame: frame];
        return self;
    };
}

- (PopupViewMaker * _Nonnull (^)(NSString * _Nonnull))setTitle {
    return ^(NSString * title) {
        [self.popupView setTitle:title];
        return self;
    };
}

- (PopupViewMaker * _Nonnull (^)(UIView * _Nonnull, CGSize))setContentView {
    return ^(UIView * contentView, CGSize contentSize) {
        [self.popupView setContentView:contentView withSize:contentSize];
        return self;
    };
}

- (PopupViewMaker * _Nonnull (^)(ButtonClick _Nonnull))setOKBtnAnction {
    return ^(ButtonClick buttonAction) {
        [self.popupView setOkAction:buttonAction];
        return self;
    };
}

- (PopupViewMaker * _Nonnull (^)(ButtonClick _Nonnull))setCancelBtnAnction {
    return ^(ButtonClick buttonAction) {
        [self.popupView setCancelAction:buttonAction];
        return self;
    };
}

- (PopupViewMaker * _Nonnull (^)(NSString * _Nonnull))setTitleForOkNormal {
    return ^(NSString * title) {
        [self.popupView setTitleForOkNormal:title];
        return self;
    };
}

- (PopupViewMaker * _Nonnull (^)(NSString * _Nonnull))setTitleForCancelNormal {
    return ^(NSString * title) {
        [self.popupView setTitleForCancelNormal:title];
        return self;
    };
}

- (PopupViewMaker * _Nonnull (^)(NSString * _Nonnull))setTitleForOkHighLight {
    return ^(NSString * title) {
        [self.popupView setTitleForOkNormal:title];
        return self;
    };
}

- (PopupViewMaker * _Nonnull (^)(NSString * _Nonnull))setTitleForCancelHighLight {
    return ^(NSString * title) {
        [self.popupView setTitleForCancelHighLight:title];
        return self;
    };
}

- (PopupViewMaker * _Nonnull (^)(CGFloat))setCornerRedius{
    return ^(CGFloat redius) {
        [self.popupView setCornerRedius:redius];
        return self;
    };
}


@end
