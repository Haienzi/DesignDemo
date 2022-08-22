//
//  AlertBuilder.h
//  DesignDemo
//
//  Created by mqh on 2022/8/2.
//

#import <Foundation/Foundation.h>
#import "MyPopupView.h"

NS_ASSUME_NONNULL_BEGIN


@interface PopupViewMaker: NSObject
@property(nonatomic, strong) MyPopupView * popupView;

- (PopupViewMaker *(^) (CGRect)) createPopupView;

- (PopupViewMaker *(^) (NSString *)) setTitle;

- (PopupViewMaker *(^) (UIView *,CGSize)) setContentView;

- (PopupViewMaker *(^) (ButtonClick)) setOKBtnAnction;

- (PopupViewMaker *(^) (ButtonClick)) setCancelBtnAnction;

- (PopupViewMaker *(^) (NSString *)) setTitleForOkNormal;

- (PopupViewMaker *(^) (NSString *)) setTitleForOkHighLight;

- (PopupViewMaker *(^) (NSString *)) setTitleForCancelNormal;

- (PopupViewMaker *(^) (NSString *)) setTitleForCancelHighLight;

- (PopupViewMaker *(^) (CGFloat)) setCornerRedius;

@end

NS_ASSUME_NONNULL_END
