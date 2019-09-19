//
//  UIButton+ImageTitleSpacing.h
//  C10
//
//  Created by 代亮 on 2017/9/12.
//  Copyright © 2017年 Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,ALButtonEdgeInsetsStyle){
    ALButtonEdgeInsetsStyleTop       = 0,   // image在上，label在下
    ALButtonEdgeInsetsStyleLeft      = 1,   // image在左，label在右
    ALButtonEdgeInsetsStyleBottom    = 2,   // image在下，label在上
    ALButtonEdgeInsetsStyleRight     = 3    // image在右，label在左
};
@interface UIButton (ImageTitleSpacing)
/**
 * 设置button的titleLabel和imageView的布局样式，及间距
 *
 * @param style titleLabel和imageView的布局样式
 * @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(ALButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end
