//
//  AlertDialog.m
//  DesignDemo
//
//  Created by mqh on 2022/8/2.
//

#import "MyPopupView.h"
#import "Masonry.h"

#define TITLE_HEIGHT  40
#define CONTENT_HEIGHT 100
#define BOTTOM_HEIGHT  40
#define POPUP_MASK_VIEW_TAG 7777
#define POPUP_INNER

@interface MyPopupView()
@property(nonatomic, strong) UILabel * titleLable; //内容
@property(nonatomic, strong) UIButton * okBtn; //确定
@property(nonatomic, strong) UIButton * cancelBtn; //取消
@property(nonatomic, assign) CGSize popupSize; //弹出视图大小

@end
 
@implementation MyPopupView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.popupSize =  frame.size;
    }
    return self;
}

- (void) initWithAttributes:(NSString * __nullable)title withContentView:(UIView * __nullable)contentView withContentSize:(NSValue * __nullable) contentSize setOkButtonListener:(ButtonClick _Nullable)okBtnAction setCancelBtnListener:(ButtonClick _Nullable)cancelBtnAction{
    //标题
    if(title){
        [self setTitle:title];
    }
    //内容视图
    if(contentView ) {
        CGSize size = [contentSize CGSizeValue];
        [self setContentView:contentView withSize:size];
    }
    //确定按钮事件
    if(okBtnAction){
        [self setOkAction:okBtnAction];
    }
    //取消按钮事件
    if(cancelBtnAction){
        [self setCancelAction:cancelBtnAction];
    }
}

#pragma titleLable相关设置
- (void) setTitleViewLayout {
    BOOL isSubView = [self.titleLable isDescendantOfView:self];
    if(!isSubView){
        [self addSubview:self.titleLable];
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(15);
            make.width.mas_equalTo(self.popupSize.width-30);
            make.height.mas_equalTo(TITLE_HEIGHT);
        }];
    }
}

- (void) setTitle:(NSString *)title{
    [self setTitleViewLayout];
    self.titleLable.text = title;
}

#pragma contentView相关设置
- (void) setContentView:(UIView *)contentView withSize: (CGSize) contentSize {
    BOOL isSubView = [contentView isDescendantOfView:self];
    if(!isSubView){
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(15);
            make.width.mas_equalTo(self.popupSize.width - 30);
            make.height.mas_equalTo(contentSize.height);
        }];
    }
}

#pragma 底部按钮相关设置
- (void) setOKBtnView {
    BOOL isOkSubView = [self.okBtn isDescendantOfView:self];
    BOOL isCancelSubview = [self.cancelBtn isDescendantOfView:self];
    //取消和确定按钮均未添加过
    if(!isOkSubView && !isCancelSubview){
        [self addSubview:self.okBtn];
        [self.okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(15);
            make.width.mas_equalTo((self.popupSize.width - 30));
            make.height.mas_equalTo(BOTTOM_HEIGHT);
        }];
    }else if(isCancelSubview){
        [self addSubview:self.okBtn];
        //取消按钮存在 说明取消按钮先添加 更新按钮布局 两个按钮宽度相等
        [self.cancelBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.width.mas_equalTo((self.popupSize.width - 40)/2.0);
        }];
        [self.okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo((self.popupSize.width - 40)/2.0 + 25);
            make.width.mas_equalTo((self.popupSize.width - 40)/2.0);
            make.height.mas_equalTo(BOTTOM_HEIGHT);
        }];
    }
}

- (void) setCancelBtnView {
    BOOL isOkSubView = [self.okBtn isDescendantOfView:self];
    BOOL isCancelSubview = [self.cancelBtn isDescendantOfView:self];
    //取消和确定按钮均未添加过
    if(!isOkSubView && !isCancelSubview){
        [self addSubview:self.cancelBtn];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(15);
            make.width.mas_equalTo((self.popupSize.width - 30));
            make.height.mas_equalTo(BOTTOM_HEIGHT);
        }];
    }else if(isCancelSubview){
        [self addSubview:self.cancelBtn];
        //确定按钮存在 说明确定按钮先添加 更新按钮布局 两个按钮宽度相等
        [self.okBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.width.mas_equalTo((self.popupSize.width - 40)/2.0);
        }];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo((self.popupSize.width - 40)/2.0 + 25);
            make.width.mas_equalTo((self.popupSize.width - 40)/2.0);
            make.height.mas_equalTo(BOTTOM_HEIGHT);
        }];
    }
}

- (void) buttonClick: (UIButton *) sender {
    if (sender.tag == 1) {
        //确定按钮添加点击事件
        if(self.okBtnAction) {
            self.okBtnAction(sender);
        }
    } else if(sender.tag == 2) {
        //取消按钮添加点击事件
        if(self.cancelBtnAction){
            self.cancelBtnAction(sender);
        }
    }
}

- (void) setOkAction:(ButtonClick) buttonAction {
    [self setOKBtnView];
    self.okBtnAction = buttonAction;
}

- (void) setCancelAction:(ButtonClick) buttonAction {
    [self setCancelBtnView];
    self.cancelBtnAction = buttonAction;
}

/// 设置确定按钮默认标题
/// @param title  标题
- (void) setTitleForOkNormal:(NSString *) title {
    [self.okBtn setTitle:title forState:UIControlStateNormal];
}

/// 设置确定按钮选中时标题
/// @param title  标题
- (void) setTitleForOkHighLight:(NSString *) title {
    [self.okBtn setTitle:title forState:UIControlStateHighlighted];
}

/// 设置取消按钮默认标题
/// @param title  标题
- (void) setTitleForCancelNormal:(NSString *) title {
    [self.cancelBtn setTitle:title forState:UIControlStateNormal];
}

/// 设置取消按钮选中时标题
/// @param title  标题
- (void) setTitleForCancelHighLight:(NSString *) title {
    [self.cancelBtn setTitle:title forState:UIControlStateHighlighted];
}

#pragma popupView相关设置
- (void) setCornerRedius:(CGFloat)redius {
    self.layer.cornerRadius = redius;
}

- (void) show {
    //
    //UIWindow * window = [[[UIApplication sharedApplication] delegate]window];
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView * maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width , [[UIScreen mainScreen]bounds].size.height)];
    maskView.tag = POPUP_MASK_VIEW_TAG;
    maskView.alpha = 1.0;
    maskView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    [window addSubview:maskView];
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    self.backgroundColor = [UIColor whiteColor];
    self.center = maskView.center;
    [maskView addSubview:self];
    [UIView animateWithDuration:0.15 animations:^{
        maskView.alpha = 1.0;
    }];
}

- (void) dismiss {
    [UIView animateWithDuration:0.25 animations:^{
        [self.superview removeFromSuperview];
    }];
}

#pragma getter
- (UILabel *)titleLable{
    if(!_titleLable){
        _titleLable = [[UILabel alloc]init];
        _titleLable.font = [UIFont systemFontOfSize:16];
        _titleLable.textColor = UIColor.blackColor;
        _titleLable.numberOfLines = 1;
    }
    return  _titleLable;
}

- (UIButton *)okBtn{
    if(!_okBtn){
        _okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _okBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _okBtn.tag = 1;
        [_okBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_okBtn setTitle:@"确定" forState: UIControlStateNormal];
        [_okBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _okBtn;
}

- (UIButton *) cancelBtn{
    if(!_cancelBtn){
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _cancelBtn.tag = 1;
        [_okBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_cancelBtn setTitle:@"取消" forState: UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
@end
