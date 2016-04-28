//
//  SXTabBarController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/28.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXTabBarController.h"
#import "IndexViewController.h"
#import "InformationViewController.h"
#import "DynamicViewController.h"
#import "MineViewController.h"
#import "CYLTabBarController.h"


@interface SXBaseNavigationController : UINavigationController
@end
@implementation SXBaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end

@interface SXTabBarController ()


@end

@implementation SXTabBarController

- (SXTabBarController *)tabBarController{
    if (!_tabBarController) {
        NSArray *vcName = @[@"IndexViewController",@"InformationViewController",@"DynamicViewController",@"MineViewController"];
        NSMutableArray *controllers = [NSMutableArray new];
        for (int i = 0; i < vcName.count; i++) {
            
            Class class = NSClassFromString(vcName[i]);
            UIViewController *vc = [[class alloc]init];
            SXBaseNavigationController *nav = [[SXBaseNavigationController alloc]initWithRootViewController:vc];
            [controllers addObject:nav];
        }
        CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
        [self setUpTabBarItemsAttributesForController:tabBarController];
        [tabBarController setViewControllers:controllers];
        // 更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;

    }
    return _tabBarController;
}

- (void)setUpTabBarItemsAttributesForController:(CYLTabBarController *)tabBarController {
    

    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"tab_home_unselected",
                            CYLTabBarItemSelectedImage : @"tab_home_selected",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"资讯",
                            CYLTabBarItemImage : @"tab_money_unselected",
                            CYLTabBarItemSelectedImage : @"tab_money_selected",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"动态",
                            CYLTabBarItemImage : @"tab_baoxiang_unselected",
                            CYLTabBarItemSelectedImage : @"tab_baoxiang_selected",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"tab_person_unselected",
                            CYLTabBarItemSelectedImage : @"tab_person_selected"
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3,
                                       dict4
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
#warning CUSTOMIZE YOUR TABBAR APPEARANCE
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = UIColorFromRGB(0x666666);
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = UIColorFromRGB(0xfe5e3e);
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    //    [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight， remove the comment '//'
    //如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    //    [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    //     UITabBar *tabBarAppearance = [UITabBar appearance];
    //     [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
    
    //remove the bar system shadow image
    //去除 TabBar 自带的顶部阴影
    //    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}



@end
