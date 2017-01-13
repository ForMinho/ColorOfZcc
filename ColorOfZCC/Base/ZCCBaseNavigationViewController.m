//
//  ZCCBaseNavigationViewController.m
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/13.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import "ZCCBaseNavigationViewController.h"

#import "ZCCCommonDefine.h"
@interface ZCCBaseNavigationViewController ()

@end

@implementation ZCCBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barTintColor = UIColorFromRGB(0xFFB5C5);;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+ (ZCCBaseNavigationViewController *)ZCCBaseNavigationViewControllerWithRootViewController:(UIViewController *)rootViewController
{
    ZCCBaseNavigationViewController *baseNavigationViewController = [[ZCCBaseNavigationViewController alloc] initWithRootViewController:rootViewController];
    return baseNavigationViewController;
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
