//
//  PageViewController.m
//  ExclusionPath
//
//  Created by Weixu on 16/5/17.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()
@property(nonatomic,strong) NSLayoutManager *textLayout;

@property(nonatomic,strong) UITextView *textView;

@property(nonatomic,strong) NSString *aText;
@property(nonatomic,strong) NSMutableArray *pageArray;
@property (weak, nonatomic) IBOutlet UILabel *currentPageLabel;

@property (weak, nonatomic) IBOutlet UILabel *countPageLabel;
@property (nonatomic ,assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger countPages;

@property (nonatomic,strong) UIActivityIndicatorView *indicatorView;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pageArray = [[NSMutableArray alloc] init];
    
    //如果是使用gbk编码的文档，要使用gbk解码
    //       NSString *path1 = [[NSBundle mainBundle] pathForResource:@"越女剑" ofType:@"txt"];
    //    NSStringEncoding gbk = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //    NSString *content = [[NSString alloc] initWithContentsOfFile:path1 encoding:gbk error:nil];
    
    self.currentPage = 1;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"测试" ofType:@"txt"];
    
    _aText = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%d",_aText.length);
    
    
    CGRect mainFrame = [UIScreen mainScreen].bounds;
    
    
    

    //加载文本，打印长度
    
    NSAttributedString *textString =  [[NSAttributedString alloc] initWithString:_aText attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]                                                                                                                                 }];
    
    //设置文本属性，这里只改变一下字体大小
    CGFloat width = mainFrame.size.width - 10;
    CGFloat height = mainFrame.size.height-54;
    
    CGRect rect = [textString boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    NSLog(@"%f",rect.size.height);

    //使用 NSString的方法计算文本高度，这里做个对比
    
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:textString];
    
    //将文本存入textStorage
    
    _textLayout = [[NSLayoutManager alloc] init];
    
    [textStorage addLayoutManager:_textLayout];
    
    
    //为textStorage添加一个NSLayoutManager
    
    //接下来计算分页数
    
    NSTextContainer *atextContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(width, MAXFLOAT)];
    
    [_textLayout addTextContainer:atextContainer];
    
    //上面代码先创建一个文本容器，宽度为310，高度为最大单精度浮点数，然后将它添加到textLayout，不添加的话，是无法计算下一步的矩形框高度
    
    float textViewHeight1 = [_textLayout boundingRectForGlyphRange:NSMakeRange(0, _aText.length) inTextContainer:atextContainer].size.height;
    
    [_textLayout removeTextContainerAtIndex:0];
    
    //以上计算整个本文长度的字形在所给的文本容器中，所占据的矩形框的高度，然后将该文本容器移除
    
    NSLog(@"%f",textViewHeight1);
    
    textViewHeight1 = ceilf(textViewHeight1);
    
    NSLog(@"%f",textViewHeight1);
    
    //总高度向上取整，可选，不知道会不会对性能造成影响
    
    NSTextContainer *atextContainer1 = [[NSTextContainer alloc] initWithSize:CGSizeMake(width, height)];
    
    [_textLayout addTextContainer:atextContainer1];
    
    //重复刚才的工作，这次创建一个供单个页面使用的文本容器，然后添加到textLayout
    
    float textViewHeight2 = [_textLayout boundingRectForGlyphRange:NSMakeRange(0, _aText.length) inTextContainer:atextContainer1].size.height;
    
    [_textLayout removeTextContainerAtIndex:0];
    
    //以上计算整个本文长度的字形在所给的单页文本容器中，所占据的矩形框的高度，注意需要把文本容器填满，你可以设置一个较大的数值，或者直接使用整个文本的长度，然后将该文本容器移除
    
    NSLog(@"%f",textViewHeight2);
    
    textViewHeight2=floorf(textViewHeight2);
    
    NSLog(@"%f",textViewHeight2);
    
    //单页高度向下取整，可选，但不要向上取整，不然偏差会很多，特别是分页数较多时
    
    int count = textViewHeight1/textViewHeight2+1;
    self.countPages = count;
    
    //计算分页数，加1补全可能缺失的最后一页，也可以不取整时，直接除后加一
    
    NSLog(@"%d",count);
    
    
    int i=0;
    
    while (i<count) {
        
        NSTextContainer *atextContainer3 = [[NSTextContainer alloc] initWithSize:CGSizeMake(width , textViewHeight2)];
        
        [_textLayout addTextContainer:atextContainer3];
        
        i++;
        
        //这里还有一个方法用于保存分页结果
        
        NSString *ran = NSStringFromRange([_textLayout glyphRangeForTextContainer:atextContainer3]);
        
        [_pageArray addObject:ran];
        
        //我们把结果存储到一个数组中，最后写入文件，第二次加载时就不用再次分页了
        
        
        
    }
    
    [self.currentPageLabel setText:[NSString stringWithFormat:@"%lu",(unsigned long)self.currentPage]];
    [self.countPageLabel setText:[NSString stringWithFormat:@"%d",count]];
    
    // 注意现在textLayout的textContainers 数组为空，我们添加count个文本容器，每次添加，可以想象成在整个文本所占据的矩形框上，以单页的高度为单位不断下移
    
    NSTextContainer *atextContainer3 = [_textLayout.textContainers objectAtIndex:0];
    
    //获取处理后的textLayout.textContainers中的最后一个文本容器，看看是否分页成功
    CGRect frame = [self getTextViewFrame];
    
    _textView = [[UITextView alloc] initWithFrame:frame textContainer:atextContainer3];
    
    
    
    [self.view addSubview:_textView];
    
    [_textView setBackgroundColor:[UIColor redColor]];
    self.textView.editable = NO;
    
    NSLog(@"%@",_textView.textContainer);


}

- (void)createActivityIndicatorView{
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    
    
}

- (void)beginActivityIndicatorView{
    [self.indicatorView startAnimating];
    [self.view addSubview:self.indicatorView];
}

- (void)setPageFormOtherThread{
    
}


- (IBAction)upPageButtonPress:(id)sender {
    

    self.currentPage -=1;
    if (self.currentPage <=0) {
        self.currentPage = 0;
        return;
    }
        [self.textView removeFromSuperview];
     NSTextContainer *atextContainer3 = [_textLayout.textContainers objectAtIndex:self.currentPage-1];
    CGRect frame = [self getTextViewFrame];
  
    _textView = [[UITextView alloc] initWithFrame:frame textContainer:atextContainer3];
    
    
    
    [self.view addSubview:_textView];
    
    [_textView setBackgroundColor:[UIColor redColor]];
     self.textView.editable = NO;
}

- (CGRect)getTextViewFrame{
    CGRect mainFrame = [UIScreen mainScreen].bounds;

    CGFloat width = mainFrame.size.width;
    CGFloat height = mainFrame.size.height-54;
     CGRect frame = CGRectMake(0, 0, width, height);
    return frame;
}

- (IBAction)downPageButtonPress:(id)sender {

    self.currentPage +=1;
    if (self.currentPage >=self.countPages) {
        self.currentPage = self.countPages;
        return;
    }
        [self.textView removeFromSuperview];
    
    NSTextContainer *atextContainer3 = [_textLayout.textContainers objectAtIndex:self.currentPage];
    CGRect frame = [self getTextViewFrame];
    
    _textView = [[UITextView alloc] initWithFrame:frame textContainer:atextContainer3];
    
    
    
    [self.view addSubview:_textView];
    
    [_textView setBackgroundColor:[UIColor redColor]];
     self.textView.editable = NO;
    
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
