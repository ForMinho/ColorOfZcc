//
//  ZCCDBAccess.h
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/20.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface ZCCDBAccess : NSObject

- (NSArray *)getAllProducts;
- (void)closeDatabase;
- (void)initializeDatabase;
@end
