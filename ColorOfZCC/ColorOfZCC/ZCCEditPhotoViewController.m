//
//  ZCCEditPhotoViewController.m
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/13.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import "ZCCEditPhotoViewController.h"
#import "ZCCImageView.h"
#import "ZCCCommonDefine.h"
#import "Masonry.h"

#define ZCCEditPhotoView_BasePhoto_Tag 1000
@interface ZCCEditPhotoViewController ()<ZCCImageViewDegelate>
{
//    CGPoint beginPoint;
}
@property (nonatomic, strong) NSMutableSet *photoSet;
@property (nonatomic, strong) ZCCEditBaseView *touchView;

@end

@implementation ZCCEditPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑";
    [self createNavigationButton];
}

-(void)createNavigationButton
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(addPhotoOnView)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- click
- (void)addPhotoOnView
{
    ZCCImageView *photoView = [ZCCImageView ZCCImageViewWithPhoto:@"IMG_1195.JPG" withSize:CGSizeMake(150, 150)];
    [self.view addSubview:photoView];
    [photoView mas_makeConstraints:^(MASConstraintMaker *maker)
    {
        maker.size.mas_equalTo(CGSizeMake(150, 150));
        maker.top.mas_equalTo(100);
        maker.left.mas_equalTo(50);
    }];
    photoView.tag = ZCCEditPhotoView_BasePhoto_Tag + self.photoSet.count;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectPhotoView:)];
    [photoView addGestureRecognizer:tapGesture];
    photoView.delegate = self;
    [self.photoSet addObject:photoView];
}
- (void)selectPhotoView:(UITapGestureRecognizer *)gesture
{
    ZCCImageView *imageView = (ZCCImageView *)gesture.view;
    [imageView imageViewGestrueRecognizer];
    _touchView = imageView;
}
#pragma mark --
- (NSMutableSet *)photoSet
{
    if (_photoSet == nil) {
        _photoSet = [[NSMutableSet alloc] init];
    }
    return _photoSet;
}
#pragma mark --
- (void)hanlePanGestureRecognize:(UIPanGestureRecognizer *)panGesture{
    CGPoint point = [panGesture translationInView:self.view];
    panGesture.view.center = CGPointMake(panGesture.view.center.x + point.x, panGesture.view.center.y + point.y);
    [panGesture setTranslation:CGPointMake(0, 0) inView:self.view];
    
}

#pragma mark --
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint beginPoint = [touch locationInView:self.view];
    beginPoint = [_touchView convertPoint:beginPoint fromView:self.view ];
    if (_touchView && ![_touchView pointInside:beginPoint withEvent:nil]) {
        [_touchView dismissSelected];
        _touchView = nil;
    }
    
}
- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
}

@end
