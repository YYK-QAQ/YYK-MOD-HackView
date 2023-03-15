//
//  ViewController.h
//  Radar
//
//  Created by 挽眸 on 2022/8/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYKView : UIView<UIScrollViewDelegate>
//+(void)MemLoad;
//-(void)初始化菜单1配置;
-(void)显示隐藏菜单;
-(void)菜单1;
//-(void)扩展菜单;
- (void)点击关闭菜单;
@end
#define XiaPng @"data:image/jpeg;base64,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"
NS_ASSUME_NONNULL_END