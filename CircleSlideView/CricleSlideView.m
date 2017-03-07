//
//  CricleSlideView.m
//  CircleSlideView
//
//  Created by jianghao on 2017/3/6.
//  Copyright © 2017年 Beijing  BiYond Network Tech Co.,Ltd. All rights reserved.
//

#import "CricleSlideView.h"

@interface CricleSlideView ()
{
    UIBezierPath *_trackPath;
    CAShapeLayer *_trackLayer;
    UIBezierPath *_progressPath;
    CAShapeLayer *_progressLayer;
    CGFloat expectValue;
}
@property (nonatomic,strong) NSTimer *timer;//计时器
@end

@implementation CricleSlideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self commonInit];
        
    }
    return self;
}

- (void)commonInit {
    
    self.trackColor = [UIColor lightGrayColor];
    self.progressColor = [UIColor whiteColor];
    self.clockwise = YES;
    
    self.backgroundColor = [UIColor yellowColor];
    
    [self createTrackLayer];
    
    [self createProgressLayer];
    
    [self createProgressLabel];
    
    self.lineWidth = 5;
    
}


-(void)createTrackLayer
{
    //背景
    _trackLayer = [CAShapeLayer new];
    [self.layer addSublayer:_trackLayer];
    
    _trackLayer.frame = self.bounds;
    _trackLayer.fillColor = [UIColor clearColor].CGColor;
    _trackLayer.lineJoin = kCALineJoinRound;
    _trackLayer.lineCap = kCALineCapRound;
}

-(void)createProgressLayer
{
    //进度
    _progressLayer = [CAShapeLayer new];
    [self.layer addSublayer:_progressLayer];
    
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.lineJoin = kCALineJoinRound;
    _progressLayer.lineCap = kCALineCapRound;
}

-(void)createProgressLabel
{
    self.progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width*0.7, self.bounds.size.height / 3)];
    self.progressLabel.center = self.center;
    _progressLabel.textColor = self.trackColor;
    _progressLabel.font = [UIFont systemFontOfSize:15];
    _progressLabel.backgroundColor = [UIColor clearColor];
    _progressLabel.textAlignment = NSTextAlignmentCenter;
    _progressLabel.text = @"0.0%";
    [self addSubview:self.progressLabel];
}


-(void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    _trackLayer.lineWidth = _lineWidth - 1;
    _progressLayer.lineWidth = _lineWidth;
    
}

- (void)createTrackPath
{
    _trackPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:(self.bounds.size.width - _lineWidth * 4)/ 2 startAngle:0 endAngle:M_PI * 2 clockwise:self.clockwise];;
    _trackLayer.path = _trackPath.CGPath;
}

- (void)createProgressPath
{
    _progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:(self.bounds.size.width - _lineWidth * 4)/ 2 startAngle:- M_PI_2 endAngle:(M_PI * 2) * _progress - M_PI_2 clockwise:self.clockwise];
    _progressLayer.path = _progressPath.CGPath;
}


-(void)setTrackColor:(UIColor *)trackColor
{
    _trackColor = trackColor;
    _trackLayer.strokeColor = _trackColor.CGColor;
}

-(void)setProgressColor:(UIColor *)progressColor
{
    _progressColor = progressColor;
    _progressLayer.strokeColor = _progressColor.CGColor;
}


-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    expectValue = 0;
    
    [self createTrackPath];
    [self createProgressPath];
    
    [self progressLayerAnimation];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.15/_progress target:self selector:@selector(countdownTime) userInfo:nil repeats:YES];
    
    
}

-(void)progressLayerAnimation
{
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 1.5f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    [_progressLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
}



-(void)countdownTime
{
    if (expectValue >= _progress) {
        [self stopTimer];
        expectValue = 0;
        _progressLabel.text = [NSString stringWithFormat:@"%.1f%%",_progress * 100];
    }else{
        NSLog(@"%.f",expectValue);
        expectValue += 0.1;
        _progressLabel.text = [NSString stringWithFormat:@"%.1f%%",expectValue * 100];
    }
    
}

-(void)stopTimer
{
    [_timer invalidate];
    _timer = nil;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
