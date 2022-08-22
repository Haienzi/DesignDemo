//
//  TestView.h
//  DesignDemo
//
//  Created by mqh on 2022/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TestViewDelegate<NSObject>
- (void) tapView:(UIView *) view;
- (void) printSomething;
@end

@interface TestView : UIView
@property(nonatomic,weak) id<TestViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
