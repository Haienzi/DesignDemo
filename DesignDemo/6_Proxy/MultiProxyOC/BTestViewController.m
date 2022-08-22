//
//  BTestViewController.m
//  DesignDemo
//
//  Created by mqh on 2022/8/18.
//

#import "BTestViewController.h"
#import "TestView.h"
#import "DelegateManager.h"

@interface BTestViewController ()<TestViewDelegate>
@property(nonatomic,strong) TestView * testView;
@property(nonatomic,strong) UILabel * label;
@end

@implementation BTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.testView = [[TestView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.testView.center = self.view.center;
    self.testView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.testView];
    
    self.testView.delegate = (id<TestViewDelegate>)[DelegateManager shareInstance];
    [[DelegateManager shareInstance]addTarget:self withProtocol:@"TestViewDelegate"];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 300, 50)];
    self.label.textColor = UIColor.blackColor;
    self.label.text = @"点击下方视图将会触发所有遵循协议的代理类的方法";
    [self.view addSubview:self.label];
}

- (void)printSomething {
    NSLog(@"==%s 被调用",__func__);
}

- (void)tapView:(UIView *)view {
    NSLog(@"==%s 被调用",__func__);
}



@end
