//
//  AlertDialog.h
//  DesignDemo
//
//  Created by mqh on 2022/8/2.
//  弹窗：标题、内容、底部按钮
//  建造者模式构建弹窗视图

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ButtonClick) (UIButton * sender);

@interface MyPopupView: UIView
@property(nonatomic, strong) NSString * title; //标题
@property(nonatomic, copy) ButtonClick okBtnAction; //确定按钮的点击事件
@property(nonatomic, copy) ButtonClick cancelBtnAction; //取消按钮点击事件

- (void) setTitle:(NSString *) title;

- (void) setContentView:(UIView *)contentView withSize: (CGSize) contentSize;

- (void) setOkAction:(ButtonClick) buttonAction;

- (void) setCancelAction:(ButtonClick) buttonAction;

- (void) setTitleForOkNormal:(NSString *) title;

- (void) setTitleForOkHighLight:(NSString *) title;

- (void) setTitleForCancelNormal:(NSString *) title;

- (void) setTitleForCancelHighLight:(NSString *) title;

- (void) setCornerRedius: (CGFloat) redius;

- (void) show;

- (void) dismiss;

/// 弹窗初始化方法
/// @param title 弹窗标题 可为空
/// @param contentView  内容视图  可为空 支持自定义
/// @param contentSize  内容视图的尺寸 内容视图为空时 不起作用
/// @param okBtnAction  确定按钮的点击事件  可为空 支持自定义
/// @param cancelBtnAction 取消按钮的点击事件 可为空 支持自定义
- (void)initWithAttributes:(NSString * __nullable) title withContentView:(UIView * __nullable) contentView withContentSize:(NSValue * __nullable) contentSize setOkButtonListener:(ButtonClick __nullable ) okBtnAction setCancelBtnListener:(ButtonClick __nullable) cancelBtnAction;

@end

NS_ASSUME_NONNULL_END
