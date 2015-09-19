//
//  BaseTabBarViewController.m
//  PlamHome
//
//  Created by Evan on 15/9/18.
//  Copyright © 2015年 Evan. All rights reserved.
//

#import "BaseTabBarViewController.h"
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
    
    
    HomePageViewController *homePage1 = [[HomePageViewController alloc]init];
    homePage1.view.backgroundColor = [UIColor redColor];
    
    HomePage2ViewController *homePage2 = [[HomePage2ViewController alloc]init];
    homePage2.view.backgroundColor = [UIColor grayColor];
    
    HomePage3ViewController *homePage3 = [[HomePage3ViewController alloc]init];
    homePage3.view.backgroundColor = [UIColor greenColor];
    
    HomePage4ViewController *homePage4 = [[HomePage4ViewController alloc]init];
    homePage4.view.backgroundColor = [UIColor blueColor];
    
    self.viewControllers = @[homePage1,homePage2,homePage3,homePage4];
    
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
        
        //        UIImage *img = [self scaleImage:bg toScale:0.6];
        item.image =bg;
        [item setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];
    }
    
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
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
