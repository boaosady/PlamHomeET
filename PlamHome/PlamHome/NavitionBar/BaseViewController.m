//
//  BaseViewController.m
//  PlamHome
//
//  Created by Evan on 15/9/19.
//  Copyright © 2015年 Evan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = COLOR_BACKGROUND;
    
    //设置左侧后退按钮
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navi_default_back"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonClick:)];
    leftButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
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

-(void)leftBarButtonClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
