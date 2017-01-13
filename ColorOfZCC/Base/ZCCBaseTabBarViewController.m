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
        [baseTabBarViewController createNavigationViewControllers];
        
    });
    return baseTabBarViewController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromRGB(0xFFFFFF);
//    self.tabBar.barTintColor = UIColorFromRGB(0xFFFFFF);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- createNavigationController
- (void)createNavigationViewControllers
{
    ZCCBaseNavigationViewController *editPhotoNaviCon = [ZCCBaseNavigationViewController ZCCBaseNavigationViewControllerWithRootViewController:[[ZCCEditPhotoViewController alloc]init]];
    ZCCBaseNavigationViewController *mineNaviCon = [ZCCBaseNavigationViewController ZCCBaseNavigationViewControllerWithRootViewController:[[ZCCMineViewController alloc] init]];
    
    [self setViewControllers:@[editPhotoNaviCon,mineNaviCon]];
    
    NSArray *tabSetArray = @[@{@"title":@"主页",
                               @"defaultImage":@"tab_daily_collocation",
                               @"selectImage":@"tab_daily_collocation_select"},
                             @{@"title":@"我",
                               @"defaultImage":@"tab_personal_center",
                               @"selectImage":@"tab_personal_center_select"},
                             @{@"title":@"主页",
                               @"defaultImage":@"tab_daily_collocation",
                               @"selectImage":@"tab_daily_collocation_select"},
                             @{@"title":@"主页",
                               @"defaultImage":@"tab_daily_collocation",
                               @"selectImage":@"tab_daily_collocation_select"}
                            
                             ];
    UITabBar *tabBar = self.tabBar;
    [tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *tabBarItem,NSUInteger index,BOOL *stop){
        NSDictionary *tempInfoDic = tabSetArray[index];
        tabBarItem.title = tempInfoDic[@"title"];
//        tabBarItem.image = IMAGE(tempInfoDic[@"defaultImage"]);
//        tabBarItem.selectedImage = IMAGE(tempInfoDic[@"selectImage"]);
        [tabBarItem setImage:tempInfoDic[@"defaultImage"]];
//        tabBarItem setSelectedImage:<#(UIImage * _Nullable)#>
    }];
  
}

@end
