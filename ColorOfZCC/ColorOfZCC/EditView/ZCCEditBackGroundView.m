//
//  ZCCEditBackGroundView.m
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/17.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import "ZCCEditBackGroundView.h"
#import "masonry.h"
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
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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
    CGRect drawRect = self.frame;
    drawRect.origin.x = 24;
    drawRect.origin.y = 24;
    drawRect.size.height -= 48;
    drawRect.size.width -= 48;
    CGContextAddRect(context,drawRect);//画方框
    CGContextDrawPath(context, kCGPathFillStroke);//绘画路径
    [self.rateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
- (UIButton *)rateBtn
{
    if (_rateBtn == nil) {
        _rateBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_rateBtn];
        [_rateBtn mas_makeConstraints:^(MASConstraintMaker *make){
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
        }];
        [_rateBtn setTitle:@"X" forState:UIControlStateNormal];
        [_rateBtn setBackgroundColor:UIColorFromRGB(0xFF6A6A)];
        [_rateBtn addTarget:self action:@selector(deletePhotoViewFromWindow) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rateBtn;
}

@end
