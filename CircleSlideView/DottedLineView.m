//
//  DottedLineView.m
//  CircleSlideView
//
//  Created by jianghao on 2017/3/7.
//  Copyright © 2017年 Beijing  BiYond Network Tech Co.,Ltd. All rights reserved.
//

#import "DottedLineView.h"

@interface DottedLineView ()
{
    CAShapeLayer *shapeLayer;
}
@end

@implementation DottedLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self commonInit];
        
    }
    return self;
}

- (void)commonInit {
    
    self.backgroundColor = [UIColor yellowColor];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, self.bounds.size.height / 2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height / 2)];
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineCap = kCALineCapButt;
    shapeLayer.path = path.CGPath;
    [self.layer addSublayer:shapeLayer];
    
}

-(void)setStrokeColor:(UIColor *)strokeColor
{
    _strokeColor = strokeColor;
    shapeLayer.strokeColor = _strokeColor.CGColor;
}

-(void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    shapeLayer.lineWidth = _lineWidth;
}

-(void)setLineDashPattern:(NSArray *)lineDashPattern
{
    _lineDashPattern = lineDashPattern;
    shapeLayer.lineDashPattern = _lineDashPattern;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
