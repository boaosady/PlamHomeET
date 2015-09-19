//
//  indexView.m
//  PlamHome
//
//  Created by Evan on 15/9/18.
//  Copyright © 2015年 Evan. All rights reserved.
//

#import "HomeindexView.h"


#define pageControllWidth               10.0
#define pageControllHeight              10.0

#define btnWidth                        100.0
#define btnHeight                       40.0

@interface HomeindexView()
@property (nonatomic,strong) UIScrollView* scrollView;
@property (nonatomic,strong) UIPageControl* pageControl;
@property (nonatomic,strong) UIButton* btnEnterApp;
@property (nonatomic,strong) NSArray* guideImageAry;
@property (nonatomic,assign) CGRect rcWindow;


- (void)btnEnterAppClicked:(UIButton*)button;
@end

@implementation HomeindexView{
    NSArray *arrayList;
    NSString *btnBackImage;
}
@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize btnEnterApp = _btnEnterApp;
@synthesize guideImageAry = _guideImageAry;
@synthesize rcWindow = _rcWindow;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置引导页图片
        arrayList = [[NSArray alloc]initWithObjects: @"1.png",@"2.png",@"3.png",@"4.png", nil];
        //设置按钮图片
        btnBackImage = @"b.png";
        
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.scrollView];
        [self.pageControl setNumberOfPages:[self.guideImageAry count]];
        [self.scrollView addSubview:self.btnEnterApp];
    }
    return self;
}

- (UIScrollView*)scrollView
{
    if(_scrollView == nil){
        CGRect rcWindow = [[[UIApplication sharedApplication] keyWindow] bounds];
        _scrollView = [[UIScrollView alloc] initWithFrame:rcWindow];
        [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * [self.guideImageAry count], _scrollView.frame.size.height)];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setBounces:NO];
        [_scrollView setDelegate:self];
        
        for(id view in self.guideImageAry){
            if([view isKindOfClass:[UIImageView class]]){
                [_scrollView addSubview:view];
            }
        }
    }
    return _scrollView;
}

- (UIPageControl*)pageControl
{
    if(_pageControl == nil){
        _pageControl = [[UIPageControl alloc] initWithFrame:
                        CGRectMake((self.frame.size.width - pageControllWidth) / 2,
                                   self.frame.size.height - pageControllHeight * 4,
                                   pageControllWidth, pageControllHeight)];
        [_pageControl setPageIndicatorTintColor:[UIColor grayColor]];
        [_pageControl setCurrentPageIndicatorTintColor:COLOR_MAIN];
        [self addSubview:_pageControl];
    }
    return _pageControl;
}

- (UIButton*)btnEnterApp
{
    if(_btnEnterApp == nil){
        _btnEnterApp = [UIButton buttonWithType:UIButtonTypeCustom];
        
        UIImage* image = [UIImage imageNamed:btnBackImage];
        
        CGRect frame = CGRectMake(self.bounds.size.width * 3 +
                                  (self.bounds.size.width - image.size.width) / 2,
                                  self.bounds.size.height - image.size.height-60,
                                  image.size.width,
                                  image.size.height);
        [_btnEnterApp setFrame:frame];
        [_btnEnterApp setBackgroundImage:image forState:UIControlStateNormal];
        [_btnEnterApp addTarget:self
                         action:@selector(btnEnterAppClicked:)
               forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnEnterApp;
}


- (NSArray*)guideImageAry
{
    if (!_guideImageAry) {
        CGRect frame = self.bounds;
        CGFloat width = CGRectGetWidth(frame);
        
        
        NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
        for (int i =0; i<arrayList.count; i++) {
            NSString *strImage = arrayList[i];
            if (i != 0) {
                frame.origin.x += width;
            }
            
            UIImage* image1 = [UIImage imageNamed:strImage];
            UIImageView* imageView1 = [[UIImageView alloc] initWithImage:image1];
            [imageView1 setFrame:frame];
            [mutableArray addObject:imageView1];
        }
        _guideImageAry = mutableArray;//@[imageView1,imageView2,imageView3,imageView4];
    }
    return _guideImageAry;
}


- (CGRect)rcWindow
{
    return [[[UIApplication sharedApplication] keyWindow] bounds];
}

- (void)btnEnterAppClicked:(UIButton*)button
{
    if ([self.delegate respondsToSelector:@selector(appGuiderWillClose)]) {
        [self.delegate appGuiderWillClose];
    }
    CGAffineTransform transform = self.transform;
    [UIView animateWithDuration:1.0
                     animations:
     ^{
         [self setTransform:CGAffineTransformScale(transform, 1.4, 1.4)];
         [self setAlpha:0.0];
         
     }
                     completion:
     ^(BOOL finished){
         [self setTransform:transform];
         [self setAlpha:1.0];
         [self removeFromSuperview];
         //         [FlagManager setDiskFlag:@NO forKey:IS_First_Open_App];
         
         if ([self.delegate respondsToSelector:@selector(appGuiderDidClose)]) {
             [self.delegate appGuiderDidClose];
         }
     }];
}

- (int)calculatePageNo:(UIScrollView*)scrollView
{
    float offsetX = scrollView.contentOffset.x;
    //计算当前页码
    int index = (int)offsetX / (int)scrollView.frame.size.width;
    return index;
}

- (void)nextView:(UIScrollView*)scrollView
{
    int index = [self calculatePageNo:scrollView];
    [self.pageControl setCurrentPage:index];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(!decelerate){
        [self nextView:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self nextView:scrollView];
}
@end
