//
//  TodayViewController.m
//  widget
//
//  Created by 代亮 on 2019/9/19.
//  Copyright © 2019 ceshi. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "ConstColor.h"
#import "UIButton+ImageTitleSpacing.h"
#import <Masonry.h>
#import <AFNetworking.h>
@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self setupStaticUI];
    [self setUpDynamicUI];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}
// 展开／折叠监听
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{
    
}

- (void)setUpDynamicUI{
    CGFloat width = kScreenWidth;
    //NCWidgetDisplayModeCompact   不需要折叠样式，整个完整显示
    //NCWidgetDisplayModeExpanded  有折叠按钮，点击可以显示更多
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeCompact;
    self.preferredContentSize = CGSizeMake(width, 150);
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@20);
    }];
    // 和主应用的数据共享，获取主应用里的数据
    NSUserDefaults *sharedData = [[NSUserDefaults alloc] initWithSuiteName:GroupID];
    NSString *name = [sharedData objectForKey:Name];
    titleLabel.text = name;
    titleLabel.textColor = [UIColor redColor];
    AFHTTPSessionManager * mgr = [AFHTTPSessionManager manager];
    [mgr GET:@"https:www.baidu.com" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


// NSFileManager 读取数据
- (NSString *)readByFileManager {
    NSError *error = nil;
    NSURL *containUrl = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:GroupID];
    containUrl = [containUrl URLByAppendingPathComponent:Data];
    NSString *text = [NSString stringWithContentsOfURL:containUrl encoding:NSUTF8StringEncoding error:&error];
    return text;
}

- (void)setupStaticUI{
    CGFloat width = kScreenWidth;
    //NCWidgetDisplayModeCompact   不需要折叠样式，整个完整显示
    //NCWidgetDisplayModeExpanded  有折叠按钮，点击可以显示更多
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeCompact;
    self.preferredContentSize = CGSizeMake(width, 150);
    NSArray *titleArray = @[
                            @"扫一扫",
                            @"扫一扫",
                            @"扫一扫",
                            @"扫一扫",
                            ];
    NSArray *imageArray = @[
                            @"widget_scan",
                            @"widget_scan",
                            @"widget_scan",
                            @"widget_scan",
                            ];
    CGFloat btnWidth = 60;
    CGFloat btnHeight = 60;
    CGFloat margin = (width - titleArray.count * btnWidth) / (titleArray.count + 1);
    CGFloat y = 20;
    for (NSInteger i = 0; i < titleArray.count; i ++) {
        CGFloat x = margin + i * (btnWidth + margin);
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(x, y, btnWidth, btnHeight);
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        //自定义的分类，用来调整按钮的图片和label的位置
//        [btn layoutButtonWithEdgeInsetsStyle:ALButtonEdgeInsetsStyleTop imageTitleSpace:1];
        [self.view addSubview:btn];
    }
}

- (void)btnDidClick:(UIButton *)btn{
    NSInteger index = btn.tag;
    NSString *vcString = @"";
    if (index == 0) {
        vcString = @"OneViewController";
    }else if (index == 1){
        vcString = @"OneViewController";
    }else if (index == 2){
        vcString = @"ViewController";
    }else if (index == 3){
        vcString = @"TwoViewController";
    }
    [self.extensionContext openURL:[NSURL URLWithString:[NSString stringWithFormat:@"com.widgetDemo://%@",vcString]] completionHandler:nil];
}
@end
