//
//  DottedLineView.h
//  CircleSlideView
//
//  Created by jianghao on 2017/3/7.
//  Copyright © 2017年 Beijing  BiYond Network Tech Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DottedLineView : UIView

@property(nonatomic,strong)UIColor *strokeColor;//线的颜色
@property(nonatomic,assign)CGFloat lineWidth;//线的宽度
@property(nonatomic,strong)NSArray *lineDashPattern;//虚线的间隔

@end
