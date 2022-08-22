//
//  TestBuilderViewController.m
//  DesignDemo
//
//  Created by mqh on 2022/8/4.
//

#import "TestBuilderViewController.h"
#import "PopupViewBuilder.h"
#import "MyPopupView.h"
#import "SingletonTest.h"
#import "UIView+PopupViewMaker.h"

@interface TestBuilderViewController ()
@property(nonatomic,strong) MyPopupView * popupView;
@property(nonatomic,strong) UILabel * popupContentLabel;
@property(nonatomic,strong) UIButton * popupBtn;
@property(nonatomic,strong) PopupViewBuilder * builder;

@end

@implementation TestBuilderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.popupBtn setTitle:@"测试弹出视图" forState:UIControlStateNormal];
    self.builder = [[PopupViewBuilder alloc]init];
    [self getMyPopupViewByMaker];
    //self.popupView = [self getPopupViewWithTwoBtn];
    SingletonTest * singleton = SingletonTest.shareInstance;
    NSLog(@"singleton: %@", singleton);
    SingletonTest * singleton1 = [[SingletonTest alloc]init];
    NSLog(@"singleton1: %@", singleton1);
    SingletonTest * singleton2 = [[SingletonTest allocWithZone:NULL]init];
    NSLog(@"singleton2: %@", singleton2);
    SingletonTest * singleton3 = [SingletonTest new];
    NSLog(@"singleton3: %@", singleton3);
    
}

- (void) getMyPopupViewByMaker {
    UIView * view = [[UIView alloc]init];
    self.popupView = [view makeMyPopupView:^(PopupViewMaker * maker) {
        maker.createPopupView(CGRectMake(0, 100, 300, 200));
        maker.setTitle(@"建造者模式单按钮测试");
        maker.setContentView(self.popupContentLabel,CGSizeMake(300, 100));
        maker.setOKBtnAnction(^(UIButton * _Nonnull sender) {
            NSLog(@"点击了确定按钮");
            [self.popupView dismiss];
        });
        maker.setTitleForOkNormal(@"确定").setTitleForOkHighLight(@"点击");
    }];
}

// 链式方式实现
- (void) getPopupViewByMaker {
    UIView * view = [[UIView alloc]init];
    self.popupView = [view makePopupView:^(PopupViewMaker * maker) {
        maker.createPopupView(CGRectMake(0, 100, 300, 200));
        maker.setTitle(@"建造者模式单按钮测试");
        maker.setContentView(self.popupContentLabel,CGSizeMake(300, 100));
        maker.setOKBtnAnction(^(UIButton * _Nonnull sender) {
            NSLog(@"点击了确定按钮");
            [self.popupView dismiss];
        });
        maker.setTitleForOkNormal(@"确定").setTitleForOkHighLight(@"点击");
        return maker.popupView;
    }];
}

- (MyPopupView *) getPopupViewWithSingleBtn {
    MyPopupView * popupView =  [[[[[[self.builder createPopupView:CGRectMake(0, 100, 300, 200)]
                                     setCornerRedius:5]
                                     setTitle:@"建造者模式单按钮测试"]
                                     setContentView:self.popupContentLabel withSize:CGSizeMake(300, 100)]
                                     setOKBtnAnction:^(UIButton * _Nonnull sender) {
                                         NSLog(@"点击了确定按钮");
                                         [self.popupView dismiss];
                                 }]build];
    return popupView;
}

- (MyPopupView * ) getPopupViewWithTwoBtn {
    
    MyPopupView * popupView =  [[[[[[[self.builder createPopupView:CGRectMake(0, 100, 300, 200)]
                                     setCornerRedius:5]
                                     setTitle:@"建造者模式双按钮测试"]
                                     setContentView:self.popupContentLabel withSize:CGSizeMake(300, 100)]
                                     setOKBtnAnction:^(UIButton * _Nonnull sender) {
                                         NSLog(@"点击了确定按钮");
                                         [self.popupView dismiss];
                                 }] setCancelBtnAnction:^(UIButton * _Nonnull sender) {
                                        NSLog(@"点击了取消按钮");
                                        [self.popupView dismiss];
                                 }] build];
    return popupView;
    
}
    
- (void)onBtnClick:(UIButton *) button {
    [self.popupView show];
}

- (UIButton*) popupBtn {
    if(!_popupBtn){
        _popupBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 200, 50)];
        _popupBtn.titleLabel.font = [UIFont systemFontOfSize: 15];
        [_popupBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_popupBtn setTitle:@"测试弹出视图" forState:UIControlStateNormal];
        [_popupBtn addTarget:self action: @selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_popupBtn];
        _popupBtn.center = self.view.center;
    }
    return _popupBtn;
}

- (UILabel*) popupContentLabel {
    if(!_popupContentLabel){
        _popupContentLabel = [[UILabel alloc]init];
        _popupContentLabel.font = [UIFont systemFontOfSize: 15];
        _popupContentLabel.textColor = [UIColor blackColor];
        _popupContentLabel.numberOfLines = 0;
        _popupContentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _popupContentLabel.text = @"我是弹出视图的具体内容。。。。。。。。。。。。😯！";
    }
    return _popupContentLabel;
}


@end
