//
//  CricleSlideView.h
//  CircleSlideView
//
//  Created by jianghao on 2017/3/6.
//  Copyright © 2017年 Beijing  BiYond Network Tech Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CricleSlideView : UIView

/** 头部的image 需要时才设置*/
@property (strong, nonatomic) UIImage *headerImage;
/** 设置或者获取当前进度 */
@property (assign, nonatomic) CGFloat progress;
/** 进度条的宽度 默认为10 */
@property (assign, nonatomic) CGFloat lineWidth;
/** 进度条的背景颜色 默认为灰色 */
@property (strong, nonatomic) UIColor *trackColor;
/** 进度条的颜色 默认为蓝色 */
@property (strong, nonatomic) UIColor *progressColor;
/** 是否是顺时针 默认为YES*/
@property (assign, nonatomic) BOOL clockwise;

/** 显示进度的label, 可设置他的相关属性, hidden, textColor... */
@property (strong, nonatomic) UILabel *progressLabel;

@end
