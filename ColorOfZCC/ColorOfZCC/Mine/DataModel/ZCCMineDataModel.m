//
//  ZCCMineDataModel.m
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/19.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import "ZCCMineDataModel.h"
@interface ZCCMineDataModel()
@property (nonatomic,strong) NSArray *myData;
@end
@implementation ZCCMineDataModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.myData = @[@"Albert",@"Bill",@"Chuck",@"Dave",@"Ethan",@"Franny",@"George",@"Holly",@"Inez"];
    }
    return self;
}
- (NSString *)getNameAtIndex:(NSInteger)index
{
    if (index >= [self getRowCount]) {
        return nil;
    }
    return self.myData[index];
}
- (NSInteger)getRowCount
{
    return [self.myData count];
}
@end
