//
//  ZCCImageView.m
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/17.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import "ZCCImageView.h"
#import "ZCCCommonDefine.h"
#import "ZCCEditBackGroundView.h"
#import "Masonry.h"
@interface ZCCImageView()
{
    CGPoint beganPoint;
}
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) ZCCEditBackGroundView *lineView;
@end

@implementation ZCCImageView

+ (ZCCImageView *)ZCCImageViewWithPhoto:(NSString *)photoName withSize:(CGSize)size
{
    ZCCImageView *imageView = [[ZCCImageView alloc] initWithImage:IMAGE(photoName) andSize:size];
    imageView.userInteractionEnabled = YES;
    return imageView;
}
- (instancetype)initWithImage:(UIImage *)image andSize:(CGSize)size
{
    self = [super init];
    if (self) {
//        self.backgroundColor = [UIColor grayColor];
        self.frame = CGRectMake(0, 0, size.width, size.height);
        self.isSelected = NO;
        [self createZCCImageViewWithImage:image];
        [self createEditAndLineView];
    }
    return self;
}
- (void)createZCCImageViewWithImage:(UIImage *)image
{
    _imageView = [[UIImageView alloc] initWithImage:image];
    [self addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.width.and.height.mas_equalTo(CGSizeMake(CGRectGetWidth(self.frame) - 50, CGRectGetHeight(self.frame) - 50));
         make.top.and.left.mas_equalTo(25);
     }];
//    [self bringSubviewToFront:_imageView];
}
- (void)imageViewGestrueRecognizer
{
    NSLog(@"%@__%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    self.isSelected  = YES;
    self.lineView.hidden = NO;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ZCCPanGestureRecognizer:)];
    [self addGestureRecognizer:panGesture];
}
-(void)dismissSelected
{
    self.isSelected = NO;
    self.lineView.hidden = YES;
}

-(void)createEditAndLineView
{
    _lineView = [[ZCCEditBackGroundView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    [_lineView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.and.left.mas_equalTo(0);
        make.width.and.height.mas_equalTo(self.frame.size);
    }];
    _lineView.hidden = YES;
}

#pragma mark -- private
- (void)ZCCPanGestureRecognizer:(UIPanGestureRecognizer *)panGesture
{
    if (self.isSelected) {
        [self.delegate hanlePanGestureRecognize:panGesture];
    }
    
}

#pragma mark --
-(void)ZCCUpdateConstraints:(CGSize)size
{
 
}
@end
