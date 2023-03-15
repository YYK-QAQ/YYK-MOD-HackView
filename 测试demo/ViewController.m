//
//  ViewController.m
//  测试demo
//
//  Created by yanyan on 2022/10/18.
//
#import "YYKView.h"
#import "ViewController.h"
#define 高度  [UIScreen mainScreen].bounds.size.width
#define 宽度 [UIScreen mainScreen].bounds.size.height
//int 屏幕高度 = 高度/3;
//int 屏幕宽度 = 宽度/3.5;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
     
    CGRect checkboxRect = CGRectMake(135,150,25,25);
    [checkbox setFrame:checkboxRect];
     
    [checkbox setImage:[UIImage imageNamed:@"checkbox_on.png"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"checkbox_off.png"] forState:UIControlStateSelected];
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkbox];
    
    // Do any additional setup after loading the view.
   // self.view.backgroundColor = [UIColor blackColor];
    UISwitch*A = [[UISwitch alloc] init];
    A.frame = CGRectMake(高度/3, 宽度/3.5+40, 20, 20);
    A.thumbTintColor = [ UIColor colorWithRed: 255 green: 255 blue: 255 alpha: 1.00];
    A.layer.cornerRadius = 50;
    A.onTintColor = [ UIColor clearColor];
    A.transform = CGAffineTransformMakeScale(0.85,0.85);
    [A addTarget:self action:@selector(菜单) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:A];
    
}
-(void)菜单{
    [[YYKView alloc] 显示隐藏菜单];
   // [[MemUI alloc] 扩展菜单];
}


-(void)checkboxClick:(UIButton *)btn
{

    if(btn.selected)
        {
            NSLog(@"开");
            [self feedbackGenerator];
            [[YYKView alloc] 显示隐藏菜单];
        }
        else
        {
            [[YYKView alloc] 显示隐藏菜单];
            NSLog(@"关");
            [self feedbackGenerator];
        }
    
    btn.selected = !btn.selected;

    
}

- (void)feedbackGenerator {
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [generator prepare];
    [generator impactOccurred];
}


@end
