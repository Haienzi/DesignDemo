//
//  TestProxyViewController.m
//  DesignDemo
//
//  Created by mqh on 2022/8/18.
//

#import "ATestViewController.h"
#import "TestView.h"
#import "DelegateManager.h"
#import "BTestViewController.h"

@interface ATestViewController()<TestViewDelegate>
@property(nonatomic,strong) TestView * redView;
@property(nonatomic,strong) UIButton * jumpBtn;
@end

@implementation ATestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.redView = [[TestView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.redView.center = self.view.center;
    self.redView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.redView];
    
    DelegateManager * manager = [DelegateManager shareInstance];
    [manager addTarget:self withProtocol:@"TestViewDelegate"];
    self.redView.delegate = (id<TestViewDelegate>)manager;
   
    
    self.jumpBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100,  40)];
    self.jumpBtn.backgroundColor = [UIColor redColor];
    [self.jumpBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.jumpBtn];
   
}

- (void) clickBtn {
    BTestViewController * bv = [[BTestViewController alloc]init];
    bv.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:bv animated:YES completion:nil];
}

- (void)printSomething {
    NSLog(@"==%s 被调用",__func__);
}

- (void)tapView:(UIView *) view {
    NSLog(@"==%s 被调用",__func__);
}


@end
