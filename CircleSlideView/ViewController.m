//
//  ViewController.m
//  CircleSlideView
//
//  Created by jianghao on 2017/3/6.
//  Copyright © 2017年 Beijing  BiYond Network Tech Co.,Ltd. All rights reserved.
//

#import "ViewController.h"
#import "CricleSlideView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    CricleSlideView *testView = [[CricleSlideView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    testView.center = self.view.center;
    testView.trackColor = [UIColor colorWithRed:123/255.0f green:123/255.0f blue:123/255.0f alpha:1];
    testView.progressColor = [UIColor yellowColor];
    testView.progress = 0.4;
//    testView.lineWidth = 10;
    [self.view addSubview:testView];
    */
    
    CricleSlideView *testView1 = [[CricleSlideView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    testView1.center = self.view.center;
    testView1.trackColor = [UIColor colorWithRed:123/255.0f green:123/255.0f blue:123/255.0f alpha:1];
    testView1.progressColor = [UIColor blueColor];
    testView1.progress = 0.8;
    testView1.lineWidth = 10;
    [self.view addSubview:testView1];
 
     
    
//    [self testCircle];
    
}


-(void)test{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGPoint startPoint = CGPointMake(self.view.center.x, 200);
    CGPoint endPoint = CGPointMake(self.view.center.x, 200);
    CGPoint controlPoint1 = CGPointMake(self.view.center.x+50, 200+50);
    CGPoint controlPoint2 = CGPointMake(self.view.center.x, 200+100);
    CGPoint controlPoint3 = CGPointMake(self.view.center.x-50, 200+50);
    [path moveToPoint:startPoint];
    [path addCurveToPoint:controlPoint3 controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    [path addCurveToPoint:endPoint controlPoint1:controlPoint3 controlPoint2:controlPoint3];
    
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor colorWithRed:123/255.0f green:123/255.0f blue:123/255.0f alpha:1].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    //add it to our view
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0);
    animation.toValue = @(2);
    animation.duration = 5;
    [shapeLayer addAnimation:animation forKey:@""];
    
}


-(void)testCircle
{
    CALayer *redLayer = [CALayer layer];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.frame = CGRectMake(150, 0, 100, 100);
    redLayer.cornerRadius = 50;
    [self.view.layer addSublayer:redLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 3.f;
    animation.repeatCount = MAXFLOAT;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 0, 100, 200));
    
    animation.path = path;
    [redLayer addAnimation:animation forKey:nil];
    
    CGPathRelease(path);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
