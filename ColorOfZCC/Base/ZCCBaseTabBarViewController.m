//
//  ZCCBaseTabBarViewController.m
//  ColorOfZCC
//
//  Created by For_Minho on 2017/1/13.
//  Copyright © 2017年 For_Minho. All rights reserved.
//

#import "ZCCCommonDefine.h"
#import "ZCCBaseTabBarViewController.h"
#import "ZCCBaseNavigationViewController.h"
#import "ZCCEditPhotoViewController.h"
#import "ZCCMineViewController.h"

@interface ZCCBaseTabBarViewController ()

@end

@implementation ZCCBaseTabBarViewController
+(ZCCBaseTabBarViewController *)ZCCBaseTabBarViewController
{
    static dispatch_once_t once;
    static ZCCBaseTabBarViewController *baseTabBarViewController = nil;
    dispatch_once(&once, ^{
        baseTabBarViewController = [[ZCCBaseTabBarViewController alloc] init];
    });
    return baseTabBarViewController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromRGB(0xFFFFFF);
    self.tabBar.barTintColor = UIColorFromRGB(0xFFB5C5);
    [self createNavigationViewControllers];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- createNavigationController
- (void)createNavigationViewControllers
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSArray *tabSetArray = @[@{@"class":@"ZCCEditPhotoViewController",
                               @"title":@"主页",
                               @"defaultImage":@"tab_daily_collocation",
                               @"selectImage":@"tab_daily_collocation_select"},
                             @{@"class":@"ZCCMineViewController",
                               @"title":@"我",
                               @"defaultImage":@"tab_personal_center",
                               @"selectImage":@"tab_personal_center_select"}
                             ];
    NSMutableArray *tabBarItemArr = [NSMutableArray array];
    
    for (NSDictionary *tmpDic in tabSetArray) {
        ZCCBaseNavigationViewController *baseCon = [self createBaseNavigationControllerWithItem:tmpDic];
        [tabBarItemArr addObject:baseCon];
    }
    self.viewControllers = [NSArray arrayWithArray:tabBarItemArr];
}
- (ZCCBaseNavigationViewController *)createBaseNavigationControllerWithItem:(NSDictionary *)itemDic
{
    
    UIViewController *viewController = [[NSClassFromString(itemDic[@"class"]) alloc] init];
    ZCCBaseNavigationViewController *navigationController = [ZCCBaseNavigationViewController ZCCBaseNavigationViewControllerWithRootViewController:viewController];
    UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:itemDic[@"title"] image:ASSETSIMAGE(itemDic[@"defaultImage"]) selectedImage:ASSETSIMAGE(itemDic[@"selectImage"])];
    [tabItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    navigationController.tabBarItem = tabItem;
    
    return navigationController;
}
@end
