//
//  TabBarViewController.m
//  WidgetDemo
//
//  Created by 代亮 on 2019/9/19.
//  Copyright © 2019 ceshi. All rights reserved.
//

#import "TabBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpAllControllers];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)setUpAllControllers{
    OneViewController *oneVc = [[OneViewController alloc] init];
    [self setUpOneChildVC:oneVc image:[UIImage imageNamed:@"tab_setting"] selImage:[UIImage imageNamed:@"tab_setting_select"] title:@"今天"];
    
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    [self setUpOneChildVC:twoVC image:[UIImage imageNamed:@"tab_setting"] selImage:[UIImage imageNamed:@"tab_setting_select"] title:@"设置"];
    

}

- (void) setUpOneChildVC:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [self.items addObject:vc.tabBarItem];
}
@end
