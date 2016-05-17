//
//  ExclusionPathVC.m
//  ExclusionPath
//
//  Created by Weixu on 16/5/16.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ExclusionPathVC.h"

@interface ExclusionPathVC ()
@property (nonatomic, assign) CGPoint gestureStartingPoint;
@property (nonatomic, assign) CGPoint gestureStartingCenter;

@end

@implementation ExclusionPathVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //创建一个平移手势对象，该对象可以调用imagePanned：方法
     NSString *textViewString = @"我上学的座驾是一辆凤凰，黑色28脚动，买了2年零4个月，5000公里了。总的来讲，除了做工粗糙了点，的确能算一部好车！我曾经在机动车道上把一台奥迪A6.3.2超的竖大拇指。我的磨合期是跑得不错的，10公里内没超过8；20公里内没超过10；30公里内没超过12。30公里后，拉过一次高速，到了极限21公里/62转（再加就要进医院了）。后来行车都保持20转换挡，15转行车。偶尔也1、2、3挡提到45转。所以的我的脚动波显得特别的灵敏，提速比较快。（可能是脚蹬子已经习惯了我的驾驶习惯吧！）提速慢、起步肉，一直是针 对28大车的敏感话题。个人认为应该是驾驶习惯造成的。都说飞鸽、GIANT的提速快，凤凰、永久的提速肉。可是应该考虑到车子的类型不同。这几款车我都开过，FG、GIANT在正常情况下提速的确不错，不需要把转速提得很高就能提供不错的动力，但过了承重40kg以后动力就显得不够充分了。而凤凰28呢，不信你把承重提到45-50kg起步试试，看看哪辆车能超过你。大凤凰车系都是高转速发动机，需要把转速提起来才能显示其充沛的动力。我试过下坡起步，从未遇见过对手。有一次遇到一辆永久，咬上了，我硬是连续3个红绿灯超它半个车身。都是原地使劲，起步时后轮原地空转，轮胎和地面磨得青烟直冒。凤凰还是胜了。特别值得一提的是凤凰在16-18码时还有推臀感，这点在28排量的车系中是难能可贵的，这也正是高转速发动机的特点所在啊！但让我最为骄傲的，还是一次弯道超车。当时在上学路上，我被一辆奥迪A6，3.2超车。当时路况极好，车多人多，红绿灯多，于是乎童心大起，想和他玩玩。奥迪保持18的速度前进，我没去超车，就是也以18的速度隔0.2米跟着他。刚开始他还没在意，后来他发现了我。大家都是开车的，应该都知道在行车时有一辆车老是跟在后面不是很爽。奥迪开始加速了，想甩掉我。19，我跟了上去，还是保持0.2米的距离。这样跑了1分钟。奥迪又减速到18，我也减，始终保持0.2米的距离。就这样20、18、21持续了大约2分钟。在一个右转路口，我一个单脚擦地右转，超越了奥迪。奥迪减速了，打右转向灯靠边停车。车窗里一只手，伸出了大拇指朝我喊，挖掘机到底哪家强？针 对28大车的敏感话题。个人认为应该是驾驶习惯造成的。都说飞鸽、GIANT的提速快，凤凰、永久的提速肉。可是应该考虑到车子的类型不同。这几款车我都开过，FG、GIANT在正常情况下提速的确不错，不需要把转速提得很高就能提供不错的动力，但过了承重40kg以后动力就显得不够充分了。而凤凰28呢，不信你把承重提到45-50kg起步试试，看看哪辆车能超过你。大凤凰车系都是高转速发动机，需要把转速提起来才能显示其充沛的动力。我试过下坡起步，从未遇见过对手。有一次遇到一辆永久，咬上了，我硬是连续3个红绿灯超它半个车身。都是原地使劲，起步时后轮原地空转，轮胎和地面磨得青烟直冒。凤凰还是胜了。特别值得一提的是凤凰在16-18码时还有推臀感，这点在28排量的车系中是难能可贵的，这也正是高转速发动机的特点所在啊！但让我最为骄傲的，还是一次弯道超车。当时在上学路上，我被一辆奥迪A6，3.2超车。当时路况极好，车多人多，红绿灯多，于是乎童心大起，想和他玩玩。奥迪保持18的速度前进，我没去超车，就是也以18的速度隔0.2米跟着他。刚开始他还没在意，后来他发现了我。大家都是开车的，应该都知道在行车时有一辆车老是跟在后面不是很爽。奥迪开始加速了，想甩掉我。19，我跟了上去，还是保持0.2米的距离。这样跑了1分钟。奥迪又减速到18，我也减，始终保持0.2米的距离。就这样20、18、21持续了大约2分钟。在一个右转路口，我一个单脚擦地右转，超越了奥迪。奥迪减速了，打右转向灯靠边停车。车窗里一只手，伸出了大拇指朝我喊，挖掘机到底哪家强？针 对28大车的敏感话题。个人认为应该是驾驶习惯造成的。都说飞鸽、GIANT的提速快，凤凰、永久的提速肉。可是应该考虑到车子的类型不同。这几款车我都开过，FG、GIANT在正常情况下提速的确不错，不需要把转速提得很高就能提供不错的动力，但过了承重40kg以后动力就显得不够充分了。而凤凰28呢，不信你把承重提到45-50kg起步试试，看看哪辆车能超过你。大凤凰车系都是高转速发动机，需要把转速提起来才能显示其充沛的动力。我试过下坡起步，从未遇见过对手。有一次遇到一辆永久，咬上了，我硬是连续3个红绿灯超它半个车身。都是原地使劲，起步时后轮原地空转，轮胎和地面磨得青烟直冒。凤凰还是胜了。特别值得一提的是凤凰在16-18码时还有推臀感，这点在28排量的车系中是难能可贵的，这也正是高转速发动机的特点所在啊！但让我最为骄傲的，还是一次弯道超车。当时在上学路上，我被一辆奥迪A6，3.2超车。当时路况极好，车多人多，红绿灯多，于是乎童心大起，想和他玩玩。奥迪保持18的速度前进，我没去超车，就是也以18的速度隔0.2米跟着他。刚开始他还没在意，后来他发现了我。大家都是开车的，应该都知道在行车时有一辆车老是跟在后面不是很爽。奥迪开始加速了，想甩掉我。19，我跟了上去，还是保持0.2米的距离。这样跑了1分钟。奥迪又减速到18，我也减，始终保持0.2米的距离。就这样20、18、21持续了大约2分钟。在一个右转路口，我一个单脚擦地右转，超越了奥迪。奥迪减速了，打右转向灯靠边停车。车窗里一只手，伸出了大拇指朝我喊，挖掘机到底哪家强？针 对28大车的敏感话题。个人认为应该是驾驶习惯造成的。都说飞鸽、GIANT的提速快，凤凰、永久的提速肉。可是应该考虑到车子的类型不同。这几款车我都开过，FG、GIANT在正常情况下提速的确不错，不需要把转速提得很高就能提供不错的动力，但过了承重40kg以后动力就显得不够充分了。而凤凰28呢，不信你把承重提到45-50kg起步试试，看看哪辆车能超过你。大凤凰车系都是高转速发动机，需要把转速提起来才能显示其充沛的动力。我试过下坡起步，从未遇见过对手。有一次遇到一辆永久，咬上了，我硬是连续3个红绿灯超它半个车身。都是原地使劲，起步时后轮原地空转，轮胎和地面磨得青烟直冒。凤凰还是胜";
    NSDictionary *attributesForContent = @{
                                           NSForegroundColorAttributeName:[UIColor blackColor],
                                           NSFontAttributeName:[UIFont systemFontOfSize:14.0f]
                                           };
    self.textView.attributedText = [[NSAttributedString alloc] initWithString:textViewString attributes:attributesForContent];
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(imagePanned:)];
    [self.imageView addGestureRecognizer:panGes];
    
        [self.textView addSubview:self.imageView];
    
    self.textView.textContainer.exclusionPaths = @[[self translatedBezierPath]];

}

- (UIBezierPath *)translatedBezierPath
{
    CGRect imageRect = [self.textView convertRect:self.imageView.frame fromView:self.textView];
    UIBezierPath *imagePath = [UIBezierPath bezierPathWithRect:imageRect];
    
    return imagePath;
}

- (void)imagePanned:(id)sender
{
    if ([sender isKindOfClass:[UIPanGestureRecognizer class]])
    {
        UIPanGestureRecognizer *localSender = sender;
        
        if (localSender.state == UIGestureRecognizerStateBegan)
        {
            self.gestureStartingPoint = [localSender translationInView:self.textView];
            self.gestureStartingCenter = self.imageView.center;
        }
        else if (localSender.state == UIGestureRecognizerStateChanged)
        {
            CGPoint currentPoint = [localSender translationInView:self.textView];
            
            CGFloat distanceX = currentPoint.x - self.gestureStartingPoint.x;
            CGFloat distanceY = currentPoint.y - self.gestureStartingPoint.y;
            
            CGPoint newCenter = self.gestureStartingCenter;
            
            newCenter.x += distanceX;
            newCenter.y += distanceY;
            
            self.imageView.center = newCenter;
            self.textView.textContainer.exclusionPaths = @[[self translatedBezierPath]];  //路径排除
        }
        else if (localSender.state == UIGestureRecognizerStateEnded)
        {
            self.gestureStartingPoint = CGPointZero;
            self.gestureStartingCenter = CGPointZero;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
