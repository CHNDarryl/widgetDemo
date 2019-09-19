//
//  ViewController.m
//  WidgetDemo
//
//  Created by 代亮 on 2019/9/19.
//  Copyright © 2019 ceshi. All rights reserved.
//

#import "ViewController.h"
#import "ConstColor.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    NSUserDefaults *sharedData = [[NSUserDefaults alloc] initWithSuiteName:GroupID];
    [sharedData setValue:@"测试存储" forKey:Name];
    [sharedData synchronize];
}

// NSFileManager 存储数据
- (void)saveFile {
    NSError *error = nil;
    NSURL *containUrl = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:GroupID];
   containUrl = [containUrl URLByAppendingPathComponent:Data];
    NSString *text = @"NSFileManager 存储数据";
    BOOL result = [text writeToURL:containUrl atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (result){
        NSLog(@"save success");
    }else {
        NSLog(@"error:%@", error);
    }
}
@end
