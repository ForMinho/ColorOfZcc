//
//  ZCCDBAccess.m
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/20.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import "ZCCDBAccess.h"
#import "ZCCProduct.h"
@interface ZCCDBAccess()
{
    sqlite3 *database;
}
@end
@implementation ZCCDBAccess

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeDatabase];
    }
    return self;
}
- (NSArray *)getAllProducts
{
    NSMutableArray *products = [[NSMutableArray alloc] init];
    const char *sql = "SELECT Product.ProductID,Product.Name,Manufacturer.Name,Product.details,Product.price,Product.QuantityOnHand,Country.Country,Product.Image FROM Product,Manufacturer,Country WHERE Manufacturer.ManufacturerID=Product.ManufactureID and Product.CountryOfForiginid=Country.CountryID";
    
    sqlite3_stmt *statement;
    int sqlResult = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
    if (sqlResult == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            ZCCProduct *product = [[ZCCProduct alloc] init];
            char *name = (char *)sqlite3_column_text(statement, 1);
            char *manufactrurer = (char *)sqlite3_column_text(statement, 2);
            char *details = (char *)sqlite3_column_text(statement, 3);
            char *countryOfOrigin = (char *)sqlite3_column_text(statement, 6);
            char *image = (char *)sqlite3_column_text(statement, 7);
            
            product.ID = sqlite3_column_int(statement, 0);
            product.name = [self stringWithUTF8String:name];
            product.manufacturer = [self stringWithUTF8String:manufactrurer];
            product.details = [self stringWithUTF8String:details];
            product.price = sqlite3_column_double(statement, 4);
            product.quantity = sqlite3_column_int(statement, 5);
            product.countryOfOrigin = [self stringWithUTF8String:countryOfOrigin];
            product.image = [self stringWithUTF8String:image];
            [products addObject:product];
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"problem with the database");
        NSLog(@"%d",sqlResult);
    }
    return products;
}
- (void)openDataBase:(NSString *)path
{
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        NSLog(@"Opening Database");
    }
    else
    {
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database:'%s'.", sqlite3_errmsg(database));
    }
}
- (void)closeDatabase
{
    if (sqlite3_close(database) != SQLITE_OK) {
        NSAssert1(0, @"Error : failed to close database:'%s'.", sqlite3_errmsg(database));
    }
}
- (void)initializeDatabase
{
    
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    NSString *writeDB = [documentDir stringByAppendingPathComponent:@"main.sqlite"];
    success = [fileManager fileExistsAtPath:writeDB];
    if (success ) {
        [self openDataBase:writeDB];
        return;
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"sqlite"];
    success = [fileManager copyItemAtPath:path toPath:writeDB error:&error];
    if (!success) {
        NSAssert1(0, @"failed to create write database file :'%@'.", [error localizedDescription]);
    }else
    {
        [self initializeDatabase];
    }
    [self openDataBase:writeDB];
}

#pragma mark --
- (NSString *)stringWithUTF8String:(char *)charName
{
    return charName? [NSString stringWithUTF8String:charName] :@"";
}
@end
