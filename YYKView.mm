//
//  YYKView.mm
//  挽眸Demo
//
//  Created by 杨勇康 on 2023/3/2.
//

/*
 这套菜单完全免费开源,提供OC新手学习
 请勿用于非法用途,倒卖
 作者QQ:2748422598
    微信:zreosir
 我会尽量写注释让你们看懂
 */

//头文件在这里调用
#import "YYKView.h"
#import "HeeeNoScreenShotView.h"
#import <AVFoundation/AVFoundation.h>
#import "DeviceInfo.h"

#define 宽度  [UIScreen mainScreen].bounds.size.width
#define 高度 [UIScreen mainScreen].bounds.size.height

@interface YYKView()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@end
@implementation YYKView
static void __attribute__((constructor)) entry() {
    //在这里执行其他类或者进行初始化,加载等操作
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        语音开关=[[NSUserDefaults standardUserDefaults] boolForKey:@"语音开关"];
        过直播开关=[[NSUserDefaults standardUserDefaults] boolForKey:@"过直播开关"];
        NSLog(@"开始运行");//多食用NSlog,哪一步出错你都可以在控制台获取到日志
        [[YYKView alloc] 初始化菜单配置];//执行初始化,进入视图前决定好使用过直播视图还是正常视图
        [[YYKView alloc] 初始菜单];
        [[YYKView alloc] 菜单1];
        [[YYKView alloc] 菜单2];
        [[YYKView alloc] 菜单3];
//        [[YYKView alloc] 菜单2];
    });


}
#pragma mark - 初始化一些控件=========
NSData *imgaeData;
static UIScrollView *滚动视图[5];
static NSTimer *定时器;
static YYKView *主视图;
static HeeeNoScreenShotView *隐私视图;
static UIView *视图[99],*子视图[99],*菜单[99];
static BOOL 显示隐藏,过直播开关,语音开关;
static UIWindow*window;
static YYKView *手势视图;
static UISlider *视距滑条;
static UIButton *Name;
static UILabel*功能描述,*标题[99];
#pragma mark - 初始化相关=========
-(void)初始化菜单配置
{
    [[YYKView alloc] 定时器];
    [[YYKView alloc] 主菜单];
//    imgaeData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://lwx.24pifa.com/logo.jpg"]];

    
}

-(void)定时器
{
    //获取当前音量
    定时器 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            window=[UIApplication sharedApplication].keyWindow;
            隐私视图= [[HeeeNoScreenShotView alloc] initWithFrame:CGRectMake(0, 0, 宽度, 高度)];
            隐私视图.userInteractionEnabled=NO;
            [self bofang:@"欢迎使用 鸢浅辅助"];
        });
       
        //读取过直播开关状态
        过直播开关=[[NSUserDefaults standardUserDefaults] boolForKey:@"过直播开关"];
        if(过直播开关){
            隐私视图.hidden=NO;
            [隐私视图 addSubview:主视图];
            [window addSubview:隐私视图];
        }else{
            隐私视图.hidden=YES;
            [window addSubview:主视图];
        }
        
    }];
    [[NSRunLoop currentRunLoop] addTimer:定时器 forMode:NSRunLoopCommonModes];
    
    
}




#pragma mark - 视图相关=========
//这里创建UI的主视图,-和+无所谓一个是成员函数一个是类函数,而成员函数必须要他所用的对象
- (void)主菜单
{
    NSLog(@"主菜单已打开");//你可以在Xcode的Debug或者真机调试控制台看到这些内容,下面我不会说明这项操作
    
    隐私视图= [[HeeeNoScreenShotView alloc] init];
    //主视图= [[YYKView alloc] init];
    
    主视图 = [YYKView new];
    /*
     Objective-C创建对象需通过alloc以及init两个消息。
     alloc的作用是分配内存，init则是初始化对象。 init与alloc都是定义在NSObject里的方法，父对象收到这两个信息并做出正确回应后，新对象才创建完毕。以下为范例：
     仅是语法上的精简，效果完全相同。若要自己定义初始化的过程，可以重写init方法，来添加额外的工作。(用法类似构造函数)
     */
    
    主视图.userInteractionEnabled=YES;
    主视图.multipleTouchEnabled = YES;

    主视图.frame=CGRectMake(宽度/2-150, 50, 560, 315);
    主视图.layer.cornerRadius=16;
    主视图.layer.borderWidth = 4.0f;
    主视图.hidden=YES;
    主视图.layer.borderColor = [[UIColor colorWithRed:200/255.0f green:200/255.0f blue:100/255.0f alpha:1.0f] CGColor];
    主视图.backgroundColor =  [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    

    
    视图[0]=[[UIView alloc] initWithFrame:CGRectMake(10, 10, 105, 35)];
    视图[0].backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    视图[0].layer.cornerRadius=10;
    视图[0].layer.borderWidth = 0.1;
    视图[0].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0] CGColor];
    [主视图 addSubview:视图[0]];
    
    Name = [[UIButton alloc] initWithFrame:CGRectMake(40, 0, 80, 30)];
    Name.layer.borderWidth = 0.0f;
    Name.layer.cornerRadius = 10.0f;
    Name.backgroundColor = [UIColor colorWithRed:255/255.0 green:192/255.0 blue:203/250.0 alpha:0];
    Name.layer.borderColor = [[UIColor whiteColor] CGColor];
    [Name setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    Name.clipsToBounds = YES;
    [Name setTitle:@"鸳浅" forState:UIControlStateNormal];
    [Name.titleLabel setFont:[UIFont italicSystemFontOfSize:20]];
    [Name addTarget:self action:@selector(调用1) forControlEvents:UIControlEventTouchUpInside];
    [视图[0] addSubview:Name];
    

//    UIImage *头像文件 = [UIImage imageWithData:imgaeData];
//   // UIImage *scaledImage = [self scaleImage:头像文件 newSize:CGSizeMake(35, 35)];
//    UIImageView *头像 = [[UIImageView alloc] initWithImage:头像文件];
//    头像.layer.cornerRadius = 25;//圆角
//    头像.center = CGPointMake(20, 20);
//    头像.frame = CGRectMake(0, 0, 250, 240);
//    头像.layer.cornerRadius = 头像.frame.size.width/2;
//    [视图[0] addSubview:头像];
    
    视图[1]=[[UIView alloc] initWithFrame:CGRectMake(10, 55, 105, 245)];
    视图[1].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    视图[1].layer.cornerRadius=10;
    视图[1].layer.borderWidth = 0.1;
    视图[1].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
    [主视图 addSubview:视图[1]];
    
    视图[2]=[[UIView alloc] initWithFrame:CGRectMake(130, 10, 420, 42)];
    视图[2].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    视图[2].layer.cornerRadius=10;
    视图[2].layer.borderWidth = 0.1;
    视图[2].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
    [主视图 addSubview:视图[2]];
    
    UIButton * 基础 = [[UIButton alloc] initWithFrame:CGRectMake(5, 10, 95, 35)];
    基础.layer.borderWidth = 0.0f;
    基础.layer.cornerRadius = 10.0f;
    基础.backgroundColor = [UIColor colorWithRed:255/255.0 green:192/255.0 blue:203/250.0 alpha:1];
    基础.layer.borderColor = [[UIColor whiteColor] CGColor];
    [基础 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    基础.clipsToBounds = YES;
    [基础 setTitle:@"基础功能" forState:UIControlStateNormal];
    [基础.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];

    [基础 addTarget:self action:@selector(调用2) forControlEvents:UIControlEventTouchUpInside];
    [视图[1] addSubview:基础];
    


    
    UIButton * 进阶 = [[UIButton alloc] initWithFrame:CGRectMake(5, 50, 95, 35)];
    进阶.layer.borderWidth = 0.0f;
    进阶.layer.cornerRadius = 10.0f;
    进阶.backgroundColor = [UIColor colorWithRed:255/255.0 green:192/255.0 blue:203/250.0 alpha:1];
    进阶.layer.borderColor = [[UIColor whiteColor] CGColor];//边框颜色
    [进阶 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//p1颜色
    进阶.clipsToBounds = YES;
    [进阶 setTitle:@"进阶功能" forState:UIControlStateNormal];
    [进阶.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [进阶 addTarget:self action:@selector(调用3) forControlEvents:UIControlEventTouchUpInside];
    [视图[1] addSubview:进阶];
    
    UIButton * 设置 = [[UIButton alloc] initWithFrame:CGRectMake(5, 90, 95, 35)];
    设置.layer.borderWidth = 0.0f;
    设置.layer.cornerRadius = 10.0f;
    设置.backgroundColor = [UIColor colorWithRed:255/255.0 green:192/255.0 blue:203/250.0 alpha:1];
    设置.layer.borderColor = [[UIColor whiteColor] CGColor];//边框颜色
    [设置 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//p1颜色
    设置.clipsToBounds = YES;
    [设置 setTitle:@"菜单设置" forState:UIControlStateNormal];
    [设置.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [设置 addTarget:self action:@selector(调用4) forControlEvents:UIControlEventTouchUpInside];
    [视图[1] addSubview:设置];
    
    UIButton * 看片 = [[UIButton alloc] initWithFrame:CGRectMake(5, 130, 95, 35)];
    看片.layer.borderWidth = 0.0f;
    看片.layer.cornerRadius = 10.0f;
    看片.backgroundColor = [UIColor colorWithRed:255/255.0 green:192/255.0 blue:203/250.0 alpha:1];
    看片.layer.borderColor = [[UIColor whiteColor] CGColor];//边框颜色
    [看片 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//p1颜色
    看片.clipsToBounds = YES;
    [看片 setTitle:@"听个歌先？" forState:UIControlStateNormal];
    [看片.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [看片 addTarget:self action:@selector(听歌测试) forControlEvents:UIControlEventTouchUpInside];
    [视图[1] addSubview:看片];
    
    UIButton * 关闭 = [[UIButton alloc] initWithFrame:CGRectMake(5, 200, 95, 35)];
    关闭.layer.borderWidth = 0.0f;
    关闭.layer.cornerRadius = 10.0f;
    关闭.backgroundColor = [UIColor colorWithRed:255/255.0 green:192/255.0 blue:203/250.0 alpha:1];
    关闭.layer.borderColor = [[UIColor whiteColor] CGColor];//边框颜色
    [关闭 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//p1颜色
    关闭.clipsToBounds = YES;
    [关闭 setTitle:@"关闭菜单" forState:UIControlStateNormal];
    [关闭.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [关闭 addTarget:self action:@selector(显示隐藏菜单) forControlEvents:UIControlEventTouchUpInside];
    [视图[1] addSubview:关闭];
    
    标题[0] = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 260, 30)];
    标题[0].numberOfLines = 0;
    标题[0].lineBreakMode = NSLineBreakByCharWrapping;
    标题[0].text = @"📢:欢迎使用本辅助,请低调演戏,开始您的表演!";
    标题[0].textAlignment = NSTextAlignmentCenter;
    标题[0].font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    标题[0].textColor = [UIColor whiteColor];
    [视图[2] addSubview:标题[0]];

    标题[1] = [[UILabel alloc] initWithFrame:CGRectMake(0, 18, 170, 30)];
    标题[1].numberOfLines = 0;
    标题[1].lineBreakMode = NSLineBreakByCharWrapping;
    标题[1].text = @"📝:特征码:F2LXP0QSKXKW";
    标题[1].textAlignment = NSTextAlignmentCenter;
    标题[1].font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    标题[1].textColor = [UIColor whiteColor];
    [视图[2] addSubview:标题[1]];
    
    标题[3] = [[UILabel alloc] initWithFrame:CGRectMake(170, 18, 170, 30)];
    标题[3].numberOfLines = 0;
    标题[3].lineBreakMode = NSLineBreakByCharWrapping;
    标题[3].text = @"🕙:过期时间:作者不会过期的!";
    标题[3].textAlignment = NSTextAlignmentCenter;
    标题[3].font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    标题[3].textColor = [UIColor redColor];
    [视图[2] addSubview:标题[3]];
    
}

-(void)听歌测试{
    NSString *path =[[NSBundle mainBundle] pathForResource:@"只因你太美" ofType:@"mp3"];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    NSError *error;
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&error];
    _audioPlayer.volume = 1.0;
    _audioPlayer.numberOfLoops = 1;
    [_audioPlayer play];
}

-(void)setHidden:(BOOL)hidden
{
 if (hidden) {
 self.alpha= 1.0f;
 [UIView beginAnimations:@"fadeOut" context:nil];
 [UIView setAnimationDuration:0.8];
 [UIView setAnimationDelegate:self];//设置委托
 [UIView setAnimationDidStopSelector:@selector(animationStop)];//当动画结束时，我们还需要再将其隐藏
 self.alpha = 0.0f;
 [UIView commitAnimations];
 }
 else
 {
 self.alpha= 0.0f;
 [super setHidden:hidden];
 [UIView beginAnimations:@"fadeIn" context:nil];
 [UIView setAnimationDuration:0.4];
 self.alpha= 1.0f;
 [UIView commitAnimations];
 }
}
-(void)animationStop
{
 [super setHidden:!self.hidden];
}

-(void)调用1{
    主视图.hidden = NO;
    菜单[0].hidden = NO;
    菜单[1].hidden = YES;
    菜单[2].hidden = YES;
    菜单[3].hidden = YES;
}

-(void)调用2{
    主视图.hidden = NO;
    菜单[0].hidden = YES;
    菜单[1].hidden = NO;
    菜单[2].hidden = YES;
    菜单[3].hidden = YES;
}
-(void)调用3{
    主视图.hidden = NO;
    菜单[0].hidden = YES;
    菜单[1].hidden = YES;
    菜单[2].hidden = NO;
    菜单[3].hidden = YES;
}
-(void)调用4{
    主视图.hidden = NO;
    菜单[0].hidden = YES;
    菜单[1].hidden = YES;
    菜单[2].hidden = YES;
    菜单[3].hidden = NO;
}

-(void)初始菜单
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        菜单[0]=[[UIView alloc] initWithFrame:CGRectMake(130, 60, 420, 240)];
        菜单[0].hidden=NO;
        菜单[0].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        菜单[0].layer.cornerRadius=10;
        菜单[0].layer.borderWidth = 0.1;
        菜单[0].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
    [主视图 addSubview:菜单[0]];

    UILabel *Info = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 240)];
    Info.numberOfLines = 0;
    Info.lineBreakMode = NSLineBreakByCharWrapping;
        
    NSMutableString *shebei = [[NSMutableString alloc] init];
    [shebei appendFormat:@"%@",DeviceInfo.getBatteryState];
        
    NSString *OSVersion = [NSString stringWithFormat:@"%@ %@",[[UIDevice currentDevice] systemName],[[UIDevice currentDevice] systemVersion]];
        
    Info.text = [NSString stringWithFormat:@"您的设备信息:\n当前进程:%@\n游戏版本:%@\n包名:%@\nIP:%@\n语言:%@\nMac地址:%@\n是否越狱:%d\n型号:%@\n系统版本:%@",DeviceInfo.getApplicationName,DeviceInfo.getLocalAppVersion,DeviceInfo.getBundleID,DeviceInfo.getDeviceIPAdress,DeviceInfo.getDeviceLanguage,DeviceInfo.getMacAddress,DeviceInfo.isJailBroken,DeviceInfo.deviceTypeDetail,OSVersion];
        Info.textAlignment = NSTextAlignmentCenter;
        Info.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        Info.textColor = [UIColor blackColor];
        [菜单[0] addSubview:Info];
        
        UIView*分割线=[[UIView alloc] initWithFrame:CGRectMake(160, 0, 4.2, 240)];
        分割线.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        分割线.layer.borderWidth = 0.1;
        分割线.layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
        [菜单[0] addSubview:分割线];
        
        UILabel *GG = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 250, 40)];
        GG.numberOfLines = 0;
        GG.lineBreakMode = NSLineBreakByCharWrapping;
        GG.text = [NSString stringWithFormat:@"公告"];
        GG.textAlignment = NSTextAlignmentCenter;
        GG.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        GG.textColor = [UIColor blackColor];
        [菜单[0] addSubview:GG];
        
        UILabel *Text = [[UILabel alloc] initWithFrame:CGRectMake(190, 40, 200, 200)];
        Text.numberOfLines = 0;
        Text.lineBreakMode = NSLineBreakByCharWrapping;
        Text.text = [NSString stringWithFormat:@"母猪产后做好4个方面的护理会有利于猪的健康。1、做好环境控制工作，母猪舍要保持适宜的湿度。2、做好卫生与消毒保健工作，以保证母猪健康以及快速恢复。3、母猪产后合理供料，在母猪产后首先要及时的补充水分，可以补充电解多维或者盐水，可以促进母猪体质的恢复以及乳汁的分泌。另外，要及时对分娩后母猪进行补料，但是要注意不可一次性饲喂过多，否则会导致母猪暴饮暴食。4、做好药物保健工作，对于顺利分娩的母猪，药物保健的作用主要是消炎，以促进母猪产后快速恢复的有效措施。"];
        Text.textAlignment = NSTextAlignmentCenter;
        Text.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        Text.textColor = [UIColor blackColor];
        [菜单[0] addSubview:Text];
        
    });
}

-(void)菜单1
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        菜单[1]=[[UIView alloc] initWithFrame:CGRectMake(130, 60, 420, 240)];
        菜单[1].hidden=YES;
        菜单[1].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0];
        菜单[1].layer.cornerRadius=10;
        菜单[1].layer.borderWidth = 0.1;
        菜单[1].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
    [主视图 addSubview:菜单[1]];
        
        视图[3] = [UIView new];
        视图[3].frame = CGRectMake(190, 0, 230, 80);
        视图[3].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        视图[3].layer.cornerRadius=10;
        视图[3].layer.borderWidth = 0.1;
        视图[3].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
        [菜单[1] addSubview:视图[3]];
        
        UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(-10, 0, 100, 40)];
        label.text=@"选择范围:";
        label.textColor=[UIColor blueColor];
        label.numberOfLines = 2;
        label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor=[UIColor orangeColor];
        [视图[3] addSubview:label];
        
        NSArray *array = [NSArray arrayWithObjects:@"2.0",@"0.8",@"头2.0",nil];
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:array];
        segment.userInteractionEnabled=YES;
        segment.frame = CGRectMake(30, 30, 160, 30);
        segment.backgroundColor = [UIColor blueColor];
        segment.selectedSegmentIndex = 0;
        segment.apportionsSegmentWidthsByContent = NO;
        segment.layer.cornerRadius = 20.00;
        //绑定点击事件
        [segment addTarget:self action:@selector(范围选择框:) forControlEvents:UIControlEventValueChanged];
        [视图[3] addSubview:segment];
        
        视图[4] = [UIView new];
        视图[4].frame = CGRectMake(190, 90, 230, 150);
        视图[4].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        视图[4].layer.cornerRadius=10;
        视图[4].layer.borderWidth = 0.1;
        视图[4].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
        [菜单[1] addSubview:视图[4]];
        
        功能描述 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 40)];
        功能描述.text=@"这里是功能的描述";
        功能描述.textColor=[UIColor blueColor];
        功能描述.numberOfLines = 2;
        功能描述.font = [UIFont fontWithName:@"AlNile-Bold" size:15];
        功能描述.textAlignment = NSTextAlignmentRight;
        功能描述.textColor=[UIColor orangeColor];
        [视图[4] addSubview:功能描述];
        

       滚动视图[0]= [[UIScrollView alloc] init];
       滚动视图[0].userInteractionEnabled=YES;
       滚动视图[0].hidden=NO;
       滚动视图[0].layer.cornerRadius=10;
       滚动视图[0].frame=CGRectMake(0, 0, 180, 240);
        滚动视图[0].backgroundColor =  [UIColor clearColor];
        //滑动的高度
        滚动视图[0].contentSize=CGSizeMake(180, 350);
        [菜单[1] addSubview:滚动视图[0]];
        
        for (int i=0; i<8; i++) {
            UIView*fgx=[[UIView alloc] initWithFrame:CGRectMake(0, i*42, 180, 38)];
            fgx.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
            fgx.layer.cornerRadius=10;
            fgx.layer.borderWidth = 0.1;
            fgx.layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
            [滚动视图[0] addSubview:fgx];
            
            
            if (i==0) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[0] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"天线";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[0] addSubview:label];
            }
            if (i==1) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[0] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"范围";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[0] addSubview:label];
            }
            if (i==2) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[0] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"无后";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[0] addSubview:label];
            }
            if (i==3) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[0] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"上色";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[0] addSubview:label];
            }
            if (i==4) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[0] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"秒换";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[0] addSubview:label];
            }
            if (i==5) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[0] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"聚点";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[0] addSubview:label];
            }
            if (i==6) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[0] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"灵魂";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[0] addSubview:label];
            }
            if (i==7) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[0] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"八倍";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[0] addSubview:label];
            }
        }});
}
-(void)菜单2
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        菜单[2]=[[UIView alloc] initWithFrame:CGRectMake(130, 60, 420, 240)];
        菜单[2].hidden=YES;
        菜单[2].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0];
        菜单[2].layer.cornerRadius=10;
        菜单[2].layer.borderWidth = 0.1;
        菜单[2].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
    [主视图 addSubview:菜单[2]];
        
        视图[5] = [UIView new];
        视图[5].frame = CGRectMake(190, 0, 230, 240);
        视图[5].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        视图[5].layer.cornerRadius=10;
        视图[5].layer.borderWidth = 0.1;
        视图[5].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
        [菜单[2] addSubview:视图[5]];

       滚动视图[1]= [[UIScrollView alloc] init];
       滚动视图[1].userInteractionEnabled=YES;
       滚动视图[1].hidden=NO;
       滚动视图[1].layer.cornerRadius=10;
       滚动视图[1].frame=CGRectMake(0, 0, 180, 240);
        滚动视图[0].backgroundColor =  [UIColor clearColor];
        //滑动的高度
        滚动视图[1].contentSize=CGSizeMake(180, 420);
        [菜单[2] addSubview:滚动视图[1]];

        for (int i=0; i<10; i++) {
            UIView*fgx=[[UIView alloc] initWithFrame:CGRectMake(0, i*42, 180, 38)];
            fgx.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
            fgx.layer.cornerRadius=10;
            fgx.layer.borderWidth = 0.1;
            fgx.layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
            [滚动视图[1] addSubview:fgx];
            
            
            if (i==0) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"水下";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
            if (i==1) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 40, 40)];
                label.text=@"昼夜";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
            if (i==2) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 75, 40)];
                label.text=@"强制建造";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
            if (i==3) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 75, 40)];
                label.text=@"地图全除";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
            if (i==4) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 75, 40)];
                label.text=@"全图除树";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
            if (i==5) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 75, 40)];
                label.text=@"强行建造";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
            if (i==6) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 75, 40)];
                label.text=@"游艇飞天";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
            if (i==7) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 75, 40)];
                label.text=@"游艇加速";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
            if (i==8) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 75, 40)];
                label.text=@"战车加速";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
            if (i==9) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(110, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [滚动视图[1] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(10, i*42+3, 75, 40)];
                label.text=@"单车加速";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [滚动视图[1] addSubview:label];
            }
        }
        for (int i=0; i<6; i++) {
            if (i==0) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(120, i*42+5, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [视图[5] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(30, i*42+3, 75, 40)];
                label.text=@"人物遁地";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [视图[5] addSubview:label];
            }
            if (i==1) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(120, i*40, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [视图[5] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(30, i*40, 75, 40)];
                label.text=@"男角假死";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [视图[5] addSubview:label];
            }
            if (i==2) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(120, i*40, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [视图[5] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(30, i*40, 75, 40)];
                label.text=@"女角假死";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [视图[5] addSubview:label];
            }
            if (i==3) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(120, i*40, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [视图[5] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(30, i*40, 75, 40)];
                label.text=@"人物高跳";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [视图[5] addSubview:label];
            }
            if (i==4) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(120, i*40, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [视图[5] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(30, i*40, 75, 40)];
                label.text=@"人物路遁";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [视图[5] addSubview:label];
            }
            if (i==5) {
                UISwitch*开关 = [[UISwitch alloc] init];
                开关.frame=CGRectMake(120, i*40, 80, 40);
                开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
                开关.layer.cornerRadius = 12.f;
                [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
                [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
                [开关 setTintColor:[UIColor redColor]];
                开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
                [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
                [视图[5] addSubview:开关];
                
                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(30, i*40, 75, 40)];
                label.text=@"角色防死";
                label.textColor=[UIColor blackColor];
                label.numberOfLines = 2;
                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
                label.textAlignment = NSTextAlignmentRight;
                label.textColor=[UIColor orangeColor];
                [视图[5] addSubview:label];
            }
        }
    });
}

-(void)菜单3
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        菜单[3]=[[UIView alloc] initWithFrame:CGRectMake(130, 60, 420, 240)];
        菜单[3].hidden=YES;
        菜单[3].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0];
        菜单[3].layer.cornerRadius=10;
        菜单[3].layer.borderWidth = 0.1;
        菜单[3].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] CGColor];
    [主视图 addSubview:菜单[3]];
      
        UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(-10, 0, 100, 40)];
        label.text=@"暗黑模式";
        label.textColor=[UIColor blueColor];
        label.numberOfLines = 2;
        label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor=[UIColor orangeColor];
        [菜单[3] addSubview:label];
        
        
        
        NSArray *array = [NSArray arrayWithObjects:@"NO",@"OFF",nil];
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:array];
        segment.userInteractionEnabled=YES;
        segment.frame = CGRectMake(30, 30, 160, 30);
        segment.backgroundColor = [UIColor blueColor];
        segment.selectedSegmentIndex = 0;
        segment.apportionsSegmentWidthsByContent = NO;
        segment.layer.cornerRadius = 20.00;
        //绑定点击事件
        [segment addTarget:self action:@selector(暗黑模式:) forControlEvents:UIControlEventValueChanged];
        [菜单[3] addSubview:segment];
        
        UISwitch*开关 = [[UISwitch alloc] init];
        开关.frame=CGRectMake(120, 60, 80, 40);
        开关.on=过直播开关;//设置开关状态
        开关.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
        开关.layer.cornerRadius = 12.f;
        [开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
        [开关 setThumbTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1]];
        [开关 setTintColor:[UIColor redColor]];
        开关.transform= CGAffineTransformMakeScale(0.8, 0.8);
        [开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
        [菜单[3] addSubview:开关];
        
        UILabel*label1=[[UILabel alloc] initWithFrame:CGRectMake(0, 60, 75, 40)];
        label1.text=@"过直播";
        label1.textColor=[UIColor blackColor];
        label1.numberOfLines = 2;
        label1.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
        label1.textAlignment = NSTextAlignmentRight;
        label1.textColor=[UIColor orangeColor];
        [菜单[3] addSubview:label1];
        
    });
}
//
//- (void)基础选择框:(UISegmentedControl *)sender{
//    if (sender.selectedSegmentIndex==0) {
//        [self 基础1];
//        菜单[1].hidden = NO;
//        菜单[2].hidden = YES;
//    }
//    if (sender.selectedSegmentIndex==1) {
//        [self 基础2];
//        菜单[1].hidden = YES;
//        菜单[2].hidden = NO;
//    }
//}
//-(void)基础1{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//            菜单[1]=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 210)];
//        菜单[1].backgroundColor=[UIColor colorWithRed:1 green:2 blue:3 alpha:0];
//        菜单[1].layer.cornerRadius=10;
//        菜单[1].layer.borderWidth = 0.1;
//        菜单[1].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0] CGColor];
//            [视图[0] addSubview:菜单[1]];
//        for (int i=0; i<5; i++) {
//
//            if (i==0) {
//                UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
//
//                CGRect checkboxRect = CGRectMake(130,10,25,25);
//                [checkbox setFrame:checkboxRect];
//
//                [checkbox setImage:[UIImage imageNamed:@"checkbox_on.png"] forState:UIControlStateNormal];
//                [checkbox setImage:[UIImage imageNamed:@"checkbox_off.png"] forState:UIControlStateSelected];
//                [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
//                [菜单[1] addSubview:checkbox];
//                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(-30, 5, 80, 40)];
//                label.text=@"范围";
//                label.textColor=[UIColor blueColor];
//                label.numberOfLines = 2;//行数
//                //设置文字字体大小
//                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
//                label.textAlignment = NSTextAlignmentRight;//居中
//                //设置文字颜色
//                label.textColor=[UIColor orangeColor];
//                [菜单[1] addSubview:label]; //将label 显示在屏幕上''
//
//            }
//
//            if (i==2) {
//                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(120, 50, 40, 28)];//这个 x y 宽度 搞定
//                btn.layer.borderWidth = 0.0f;
//                btn.layer.cornerRadius = 10.0f;
//                btn.backgroundColor = [UIColor colorWithRed:34/255.0 green:181/255.0 blue:115/250.0 alpha:1];
//                btn.layer.borderColor = [[UIColor whiteColor] CGColor];//边框颜色
//                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//p1颜色
//                btn.layer.borderWidth = 1.95f;//边框大小
//                btn.clipsToBounds = YES;
//                [btn setTitle:@"▶️" forState:UIControlStateNormal];
//                [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
//                [btn addTarget:self action:@selector(BBS) forControlEvents:UIControlEventTouchUpInside];
//                [菜单[1] addSubview:btn];
//                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(-30, 50, 80, 40)];
//                label.text=@"天线";
//                label.textColor=[UIColor blueColor];
//                label.numberOfLines = 2;//行数
//                //设置文字字体大小
//                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
//                label.textAlignment = NSTextAlignmentRight;//居中
//                //设置文字颜色
//                label.textColor=[UIColor orangeColor];
//                [菜单[1] addSubview:label]; //将label 显示在屏幕上''
//
//            }
//
//            if (i==3) {
//                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(120, 90, 40, 28)];//这个 x y 宽度 搞定
//                btn.layer.borderWidth = 0.0f;
//                btn.layer.cornerRadius = 10.0f;
//                btn.backgroundColor = [UIColor colorWithRed:34/255.0 green:181/255.0 blue:115/250.0 alpha:1];
//                btn.layer.borderColor = [[UIColor whiteColor] CGColor];//边框颜色
//                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//p1颜色
//                btn.layer.borderWidth = 1.95f;//边框大小
//                btn.clipsToBounds = YES;
//                [btn setTitle:@"▶️" forState:UIControlStateNormal];
//                [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
//                [btn addTarget:self action:@selector(BBS) forControlEvents:UIControlEventTouchUpInside];
//                [菜单[1] addSubview:btn];
//                UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(-30, 90, 80, 40)];
//                label.text=@"无后";
//                label.textColor=[UIColor blueColor];
//                label.numberOfLines = 2;//行数
//                //设置文字字体大小
//                label.font = [UIFont fontWithName:@"AlNile-Bold" size:17];
//                label.textAlignment = NSTextAlignmentRight;//居中
//                //设置文字颜色
//                label.textColor=[UIColor orangeColor];
//                [菜单[1] addSubview:label]; //将label 显示在屏幕上''
//
//            }
//
//        }
//
//    });
//}
//
//-(void)基础2{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        菜单[2]=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 210)];
//        菜单[2].backgroundColor=[UIColor colorWithRed:3 green:2 blue:1 alpha:0.5];
//        菜单[2].layer.cornerRadius=10;
//        菜单[2].layer.borderWidth = 0.1;
//        菜单[2].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0] CGColor];
//            [视图[0] addSubview:菜单[2]];
//
//
//    });
//}

- (void)暗黑模式:(UISegmentedControl *)sender{
    //判断选项卡按钮 :sender.selectedSegmentIndex
    if (sender.selectedSegmentIndex==0) {
        主视图.backgroundColor =  [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        标题[0].textColor = [UIColor whiteColor];
        标题[1].textColor = [UIColor whiteColor];
        标题[2].textColor = [UIColor whiteColor];
        标题[3].textColor = [UIColor whiteColor];
        [Name setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    if (sender.selectedSegmentIndex==1) {
        主视图.backgroundColor =  [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        标题[0].textColor = [UIColor blackColor];
        标题[1].textColor = [UIColor blackColor];
        标题[2].textColor = [UIColor blackColor];
        标题[3].textColor = [UIColor blackColor];
        [Name setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
   
}

static UIView *范围Menu[9];

-(void)checkboxClick:(UIButton *)btn
{

    if(btn.selected)
        {
            NSLog(@"开");
            范围Menu[0].hidden = YES;
        }
        else
        {
            NSLog(@"关");
            范围Menu[0].hidden = NO;
        }
    
    btn.selected = !btn.selected;

    
}

-(void)范围{

        范围Menu[0]=[[UIView alloc] initWithFrame:CGRectMake(195, 0, 210, 230)];
        范围Menu[0].hidden = YES;
        范围Menu[0].backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        范围Menu[0].layer.cornerRadius=10;
        范围Menu[0].layer.borderWidth = 0.1;
        范围Menu[0].layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0] CGColor];
            [视图[0] addSubview:范围Menu[0]];

    NSArray *array = [NSArray arrayWithObjects:@"2.0",@"0.8",@"头2.0",nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:array];
    segment.userInteractionEnabled=YES;
    segment.frame = CGRectMake(25, 25, 160, 35);
    segment.backgroundColor = [UIColor blueColor];
    segment.selectedSegmentIndex = 0;//默认选项卡
    segment.apportionsSegmentWidthsByContent = NO;
    segment.layer.cornerRadius = 20.00;//圆角
    //绑定点击事件
    [segment addTarget:self action:@selector(范围选择框:) forControlEvents:UIControlEventValueChanged];
    [范围Menu[0] addSubview:segment];
    
    UISwitch*范围开关 = [[UISwitch alloc] init];
    范围开关.frame=CGRectMake(100, 83, 80, 40);//这个 x y 宽度 搞定 是基于上面的View视图中的
    //设置开启状态的风格颜
    [范围开关 setOnTintColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:1]];
    //设置开关圆按钮的风格颜色
    [范围开关 setThumbTintColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:1]];
    //设置整体风格颜色,按钮的白色是整个父布局的背景颜色
    [范围开关 setTintColor:[UIColor redColor]];
    //p3:事件响应时的事件类型UIControlEventValueChanged状态发生变化时触发函数
    [范围开关 addTarget:self action:@selector(过直播开关调用:) forControlEvents:UIControlEventValueChanged];
    [范围Menu[0] addSubview:范围开关];//添加到视图上显示
    //方框文字
    UILabel*范围标题=[[UILabel alloc] initWithFrame:CGRectMake(20, 80, 40, 40)];
    范围标题.text=@"范围开启";
    范围标题.textColor=[UIColor blackColor];
    范围标题.numberOfLines = 2;//行数
    //设置文字字体大小
    范围标题.font = [UIFont fontWithName:@"Helvetica-bold" size:17];
    范围标题.textAlignment = NSTextAlignmentRight;//居中
    //设置文字颜色
    范围标题.textColor=[UIColor blackColor];
    [范围Menu[0] addSubview:范围标题]; //将label 显示在屏幕上''

}

#pragma mark - 菜单调用相关=========
- (void)点击关闭菜单
{
    显示隐藏=!显示隐藏;
    主视图.hidden=YES;
    隐私视图.hidden=YES;
    隐私视图.userInteractionEnabled=NO;
}




- (void)显示隐藏菜单
{
    显示隐藏=!显示隐藏;
    if (显示隐藏) {
        主视图.hidden=NO;
        隐私视图.userInteractionEnabled=YES;
    }else{
        主视图.hidden=YES;
        隐私视图.userInteractionEnabled=NO;
    }
}
- (void)过直播开关调用:(UISwitch*)sw{
    过直播开关 =sw.on;
    if (过直播开关) {
        [self bofang:@"过直播已开启"];
    }
    [[NSUserDefaults standardUserDefaults] setBool:sw.on forKey:@"过直播开关"];
}
- (void)语音开关调用:(UISwitch*)sw{
    语音开关 =sw.on;
    if (语音开关) {
        [self bofang:@"语音提示已开启"];
    }
    [[NSUserDefaults standardUserDefaults] setBool:sw.on forKey:@"语音开关"];
}


//文字转语言
- (void)bofang:(NSString*)str{
    
    if (!语音开关) {
        return;
    }
    
    AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//汉语
    AVSpeechUtterance *txt = [[AVSpeechUtterance alloc] initWithString:str];
    txt.pitchMultiplier = 1.0;
    txt.volume = 1.0;//音量
    txt.rate = 0.5;
    txt.voice = voice;
    [synth speakUtterance:txt];
    [synth continueSpeaking];
    //读取语音条长度
    
    
}



#pragma mark - 触摸手势相关 设置视图可以拖动 并且超出屏幕会自动回弹=========
//当开始触摸屏幕的时候调用
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
//触摸时开始移动时调用(移动时会持续调用)
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //做UIView拖拽
    UITouch *touch = [touches anyObject];
    //求偏移量 = 手指当前点的X - 手指上一个点的X
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    NSLog(@"curP====%@",NSStringFromCGPoint(curP));
    NSLog(@"preP====%@",NSStringFromCGPoint(preP));

    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;

    //平移
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);

}

//当手指离开屏幕时调用
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     NSLog(@"%s",__func__);
    float x=主视图.frame.origin.x;
    float y=主视图.frame.origin.y;
    float w=主视图.frame.size.width;
    float h=主视图.frame.size.height;
    //横屏状态
    if (宽度>高度) {
        //横屏
        //超出左边
        if (x<0) {
            x=0;
        }
        //上面
        if (y<0) {
            y=0;
        }
        //超出右边
        if (x+w>宽度) {
            x=宽度-w;
        }
        if (y+h>高度) {
            y=高度-h;
        }
    }

    //更新视图
    主视图.frame=CGRectMake(x, y, w, h);
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    //判断点击菜单的次数
    if (touch.tapCount == 1) {}else if(touch.tapCount == 2){}}

//当发生系统事件时就会调用该方法(电话打入,自动关机)自动隐藏菜单
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    显示隐藏=!显示隐藏;
    主视图.hidden=YES;
    隐私视图.hidden=YES;
    隐私视图.userInteractionEnabled=NO;
}
//将菜单视图设置成第一响应视图 响应手势操作
-(BOOL)canBecomeFirstResponse
{
    return YES;
}
@end

