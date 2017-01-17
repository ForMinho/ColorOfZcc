//
//  ZCCEditBackGroundView.m
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/17.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import "ZCCEditBackGroundView.h"
@interface ZCCEditBackGroundView()
@property (nonatomic, strong) UIButton *rateBtn;
@end
@implementation ZCCEditBackGroundView

- (instancetype)init
{
    self = [super init ];
    if (self) {
        
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    //矩形，并填弃颜色
    CGContextSetLineWidth(context, 1);//线的宽度
    UIColor *aColor = [UIColor colorWithRed:1.0 green:0.0 blue:0 alpha:1.0];
    CGContextSetStrokeColorWithColor(context, aColor.CGColor);//线框颜色
    aColor = [UIColor clearColor];
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    CGContextAddRect(context,self.frame);//画方框
    CGContextDrawPath(context, kCGPathFillStroke);//绘画路径
}
- (UIButton *)rateBtn
{
    if (_rateBtn == nil) {
        _rateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_rateBtn];
    }
    return _rateBtn;
}

@end
