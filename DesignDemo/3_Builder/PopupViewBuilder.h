//
//  AlertBuilder.h
//  DesignDemo
//
//  Created by mqh on 2022/8/2.
//

#import <Foundation/Foundation.h>
#import "MyPopupView.h"

NS_ASSUME_NONNULL_BEGIN


@interface PopupViewBuilder: NSObject
@property(nonatomic, strong) MyPopupView * popupView;

- (instancetype) createPopupView:(CGRect) frame;

- (instancetype) setTitle:(NSString *) title;

- (instancetype) setContentView:(UIView *)contentView withSize: (CGSize) contentSize;

- (instancetype) setOKBtnAnction:(ButtonClick) buttonAction;

- (instancetype) setCancelBtnAnction:(ButtonClick) buttonAction;

- (instancetype) setTitleForOkNormal:(NSString *) title;

- (instancetype) setTitleForOkHighLight:(NSString *) title;

- (instancetype) setTitleForCancelNormal:(NSString *) title;

- (instancetype) setTitleForCancelHighLight:(NSString *) title;

- (instancetype) setCornerRedius: (CGFloat) redius;

- (MyPopupView*)build;

- (instancetype)createPopupView:(NSString * __nullable) title withContentView:(UIView * __nullable) contentView withContentSize:(NSValue * __nullable) contentSize setOkButtonListener:(ButtonClick __nullable ) okBtnAction setCancelBtnListener:(ButtonClick __nullable) cancelBtnAction;

@end

NS_ASSUME_NONNULL_END
