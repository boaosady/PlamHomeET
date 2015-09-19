//
//  BaseTabBarViewController.m
//  PlamHome
//
//  Created by Evan on 15/9/18.
//  Copyright © 2015年 Evan. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNavigationViewController.h"

#import "HomePageViewController.h"
#import "HomePage2ViewController.h"
#import "HomePage3ViewController.h"
#import "HomePage4ViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置tabbar的背景图片
    UIImage* backImage = [UIImage imageNamed:@"bgcolor.png"];
    backImage = [backImage stretchableImageWithLeftCapWidth:backImage.size.width/2 topCapHeight:backImage.size.height/2];
    [self.tabBar setBackgroundImage:backImage];
    
    self.tabBar.translucent = NO;
    
    self.viewControllers = [self barItemViews];
    
    //设置选中的背景图片
    
    UIImage *bgClickImage;
    if (IS_IPHONE_6) {
        bgClickImage = [UIImage imageNamed:@"bottom_tx_ip6.png"];
    }else if(IS_IPHONE_6PLUS){
        bgClickImage = [UIImage imageNamed:@"bottom_tx_ip6p.png"];
    }
    else{
        bgClickImage = [UIImage imageNamed:@"bottom_tx.png"];
    }
    self.tabBar.selectionIndicatorImage =bgClickImage;
    self.tabBar.barTintColor = [UIColor whiteColor];
    
    NSArray *array =self.tabBar.items;
    for (int i =0; i<[array count]; i++) {
        UITabBarItem *item = array[i];
        UIImage *bg = [[UIImage alloc]init];
        switch (i) {
            case 0:
                bg =[[UIImage imageNamed:@"bottom_h.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
                break;
            case 1:
                bg =[[UIImage imageNamed:@"bottom_d.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
                break;
            case 2:
                bg =[[UIImage imageNamed:@"bottom_s.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
                break;
            case 3:
                bg =[[UIImage imageNamed:@"bottom_m.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
                break;
                
            default:
                break;
        }
        
        item.image =bg;
        [item setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];
        [item setTitle:nil];
    }
    
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
}


#pragma mark - 初始化当前TabBar集合

-(NSArray*)barItemViews{
    NSArray *arrayItem = [[NSArray alloc]init];
    HomePageViewController *homePage1 = [[HomePageViewController alloc]init];
    homePage1.view.backgroundColor = COLOR_BACKGROUND;
    BaseNavigationViewController *baseNavi1 = [[BaseNavigationViewController alloc]initWithRootViewController:homePage1];
    
    HomePage2ViewController *homePage2 = [[HomePage2ViewController alloc]init];
    homePage2.view.backgroundColor = COLOR_BACKGROUND;
    BaseNavigationViewController *baseNavi2 = [[BaseNavigationViewController alloc]initWithRootViewController:homePage2];
    
    HomePage3ViewController *homePage3 = [[HomePage3ViewController alloc]init];
    homePage3.view.backgroundColor = COLOR_BACKGROUND;
    BaseNavigationViewController *baseNavi3 = [[BaseNavigationViewController alloc]initWithRootViewController:homePage3];
    
    HomePage4ViewController *homePage4 = [[HomePage4ViewController alloc]init];
    homePage4.view.backgroundColor = COLOR_BACKGROUND;
    BaseNavigationViewController *baseNavi4 = [[BaseNavigationViewController alloc]initWithRootViewController:homePage4];
    
    arrayItem = @[baseNavi1,baseNavi2,baseNavi3,baseNavi4];
    return arrayItem;
}

@end
