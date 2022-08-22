//
//  AlertBuilder.m
//  DesignDemo
//
//  Created by mqh on 2022/8/2.
//

#import "PopupViewBuilder.h"

@interface PopupViewBuilder()
@end

@implementation PopupViewBuilder

- (instancetype)createPopupView:(CGRect)frame{
    self.popupView = [[MyPopupView alloc]initWithFrame:frame];
    return self;
}

- (instancetype)setTitle:(NSString *)title {
    [self.popupView setTitle:title];
    return self;
}

- (instancetype)setContentView:(UIView *)contentView withSize:(CGSize)contentSize{
    [self.popupView setContentView:contentView withSize:contentSize];
    return self;
}

- (instancetype)setOKBtnAnction:(ButtonClick)buttonAction {
    [self.popupView setOkAction:buttonAction];
    return self;
}

- (instancetype)setCancelBtnAnction:(ButtonClick)buttonAction {
    [self.popupView setCancelAction:buttonAction];
    return self;
}

- (instancetype)setTitleForOkNormal:(NSString *)title {
    [self.popupView setTitleForOkNormal:title];
    return self;
}

- (instancetype)setTitleForOkHighLight:(NSString *)title {
    [self.popupView setTitleForOkNormal:title];
    return self;
}

- (instancetype)setTitleForCancelNormal:(NSString *)title {
    [self.popupView setTitleForCancelNormal:title];
    return self;
}

- (instancetype)setTitleForCancelHighLight:(NSString *)title {
    [self.popupView setTitleForCancelHighLight:title];
    return self;
}

- (instancetype)setCornerRedius:(CGFloat)redius {
    [self.popupView setCornerRedius: redius];
    return self;
}

- (instancetype)createPopupView:(NSString * __nullable)title withContentView:(UIView * __nullable)contentView withContentSize:(NSValue * __nullable)contentSize setOkButtonListener:(ButtonClick __nullable) okBtnAction setCancelBtnListener:(ButtonClick __nullable) cancelBtnAction {
    [self.popupView initWithAttributes:title withContentView:contentView withContentSize:contentSize setOkButtonListener:okBtnAction setCancelBtnListener:cancelBtnAction];
    return self;
}

- (MyPopupView *) build {
    return self.popupView;
}

@end
