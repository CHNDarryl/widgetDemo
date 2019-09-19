//
//  AppDelegate.m
//  WidgetDemo
//
//  Created by 代亮 on 2019/9/19.
//  Copyright © 2019 ceshi. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    TabBarViewController *tabVC = [[TabBarViewController alloc] init];
    self.window.rootViewController = tabVC;
    [self.window makeKeyWindow];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    [self appCallbackWithOpenUrl:url];
    return YES;
}

- (void)appCallbackWithOpenUrl:(NSURL *)url{
    // 针对url进行不同的操作
    NSString *URLString = [NSString stringWithFormat:@"%@",url];
    NSArray *array = [URLString componentsSeparatedByString:@"://"];
    NSString *vcString = @"";
    //这里最好进行判断URL的开头是不是设置的schemes，如果用到其他的第三方SDK，有可能是他们的URL
    if (array.count >= 2) {
        vcString = array[1];
    }
   //这里可以先判断是否登录或者其他逻辑在进行下面的操作
        
    if ([vcString isEqualToString:@"OneViewController"]) {
        UINavigationController *nav = ((UITabBarController*)self.window.rootViewController).selectedViewController;
        UIViewController *VC = [[NSClassFromString(vcString) alloc] init];
        [nav pushViewController:VC animated:YES];
    }else if ([vcString isEqualToString:@"ViewController"]){
        UINavigationController *nav = ((UITabBarController*)self.window.rootViewController).selectedViewController;
        UIViewController *VC = [[NSClassFromString(vcString) alloc] init];
        [nav pushViewController:VC animated:YES];
    }else if ([vcString isEqualToString:@"TwoViewController"]){
        UITabBarController *tabBarVC = (UITabBarController *)self.window.rootViewController;
        tabBarVC.selectedIndex = 1;
    }
}
@end
