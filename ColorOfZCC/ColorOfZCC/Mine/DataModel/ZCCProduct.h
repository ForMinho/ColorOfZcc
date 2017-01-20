//
//  ZCCProduct.h
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/20.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCCProduct : NSObject
@property (nonatomic, assign) int ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *manufacturer;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, assign) float price;
@property (nonatomic, assign) int quantity;
@property (nonatomic, strong) NSString *countryOfOrigin;
@property (nonatomic, strong) NSString *image;
@end
