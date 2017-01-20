//
//  ZCCEditBaseView.h
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/17.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCCommonDefine.h"
@interface ZCCEditBaseView : UIView
@property (nonatomic , assign) BOOL isSelected;
-(void)dismissSelected;
-(void)deletePhotoViewFromWindow;
@end
