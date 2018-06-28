//
//  JackPercentView.m
//  percentCircleView
//
//  Created by 中投德利 on 2018/6/4.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JackPercentView.h"

@interface JackPercentView ()
//背景
@property (nonatomic, strong) CAShapeLayer *backgroundShaper;
@end

@implementation JackPercentView



-(void)awakeFromNib
{
    [super awakeFromNib];
    [self.layer addSublayer:self.backgroundShaper];
    
}


#pragma mark - 懒加载
-(CAShapeLayer *)backgroundShaper
{
    if (!_backgroundShaper) {
        _backgroundShaper = [CAShapeLayer new];
        _backgroundShaper.frame = self.bounds;
        _backgroundShaper.lineWidth = _lineWidth?:20.0f;
        _backgroundShaper.strokeColor = [UIColor whiteColor].CGColor;
        _backgroundShaper.fillColor = [UIColor clearColor].CGColor;
        CGFloat radius = (self.bounds.size.width - _lineWidth?:10.0f) /2;
        //按照顺时针方向
        BOOL clockWise = true;
        //初始化一个路径
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:radius startAngle:(0*M_PI) endAngle:2*M_PI clockwise:clockWise];
        _backgroundShaper.path = [path CGPath];
        
    }
    return _backgroundShaper;
}


#pragma mark - setter
- (void)setCircleArray:(NSArray *)circleArray
{
    _circleArray = circleArray;
    [self drawCircle];
}


- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    self.backgroundShaper.strokeColor = [UIColor grayColor].CGColor;
    [self layoutSubviews];
}

#pragma mark - 画圆
- (void)drawCircle
{
    __block float startAngele = -0.5*M_PI;
    [self.circleArray enumerateObjectsUsingBlock:^(NSDictionary  *obj,NSUInteger idx, BOOL *_Nonnull stop) {
        if ([obj[@"precent"] floatValue] == 0) {
            return;
        }
        //创建出CAShapeLayer
        CAShapeLayer *newshaper = [CAShapeLayer new];
        newshaper.frame =CGRectMake(0,0, self.bounds.size.width,self.bounds.size.height);//设置shapeLayer的尺寸和位置
        newshaper.lineWidth = self.lineWidth?:20;
        //圆环的颜色
        newshaper.strokeColor = obj[@"strokeColor"]?[obj[@"strokeColor"]CGColor]:[UIColor orangeColor].CGColor;
        //背景填充色
        newshaper.fillColor = [UIColor clearColor].CGColor;
        //设置半径为10
        CGFloat radius = (self.bounds.size.width - self.lineWidth?:20)/2;
        
        //按照顺时针方向
        BOOL clockWise = true;
        //end angle
        float endAnle = [obj[@"precent"] floatValue] * M_PI * 2 + startAngele - 0.02;
        //初始化一个路径
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:radius startAngle:startAngele endAngle:endAnle clockwise:clockWise];
        
        newshaper.path = [path CGPath];
        //添加并显示
        [self.layer addSublayer:newshaper];
        //动画显示
        CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        basic.fromValue = @(0);
        basic.toValue = @(1);
        basic.duration = 0.5;
        basic.fillMode = kCAFillModeForwards;
        [newshaper addAnimation:basic forKey:@"basic"];
        
        startAngele = [obj[@"precent"]floatValue] *2*M_PI + startAngele;
        
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
