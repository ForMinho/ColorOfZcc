//
//  ZCCImageView.h
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/17.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCEditBaseView.h"
//#import "ZCCEditPhotoViewController.h"
@protocol ZCCImageViewDegelate
- (void)hanlePanGestureRecognize:(UIPanGestureRecognizer *)panGesture;
@end

@interface ZCCImageView : ZCCEditBaseView

@property (nonatomic, weak) id<ZCCImageViewDegelate> delegate;
+ (ZCCImageView *)ZCCImageViewWithPhoto:(NSString *)photoName withSize:(CGSize)size;
- (void)imageViewGestrueRecognizer;
-(void)ZCCUpdateConstraints:(CGSize)size;
@end
