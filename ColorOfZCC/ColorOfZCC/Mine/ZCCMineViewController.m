//
//  ZCCMineViewController.m
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/13.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import "ZCCMineViewController.h"
#import "ZCCMineDataModel.h"
#import "ZCCProduct.h"
#import "ZCCCommonDefine.h"
#import "ZCCDBAccess.h"
@interface ZCCMineViewController ()<UITableViewDelegate,UITableViewDataSource>
//@property (nonatomic, strong) ZCCMineDataModel *myDataModel;
@property (nonatomic, strong) NSMutableArray *products;
@end

@implementation ZCCMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    ZCCDBAccess *dbAccess = [[ZCCDBAccess alloc] init];
    self.products = [NSMutableArray arrayWithArray:[dbAccess getAllProducts]];
    [dbAccess closeDatabase];
    
//    self.myDataModel = [[ZCCMineDataModel alloc] init];
    // Do any additional setup after loading the view.
}
- (void)loadView
{
    UITableView *myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT ) style:UITableViewStylePlain];
    myTable.delegate = self;
    myTable.dataSource = self;
    self.view = myTable;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.products count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myDataModel"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"myDataModel"];
    }
    ZCCProduct *model = (ZCCProduct *)self.products[indexPath.row];
    [cell.textLabel setText:model.name];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
