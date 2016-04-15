//
//  TabBarViewController.m
//  SuiXing
//
//  Created by yangyang on 16/3/14.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "TabBarViewController.h"
#import "IndexViewController.h"
#import "InformationViewController.h"
#import "DynamicViewController.h"
#import "MineViewController.h"

@interface TabBarViewController () <UITabBarControllerDelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = UIColorFromRGB(0xff6600);
    self.delegate = self;
    
    [self initController];
    // Do any additional setup after loading the view.
}

//初始化底部TabBar
- (void)initController{
    NSArray *vcName = @[@"IndexViewController",@"InformationViewController",@"DynamicViewController",@"MineViewController"];
    NSArray *image =  @[@"tab_home_unselected",@"tab_money_unselected",@"tab_baoxiang_unselected",@"tab_person_unselected"];
    NSArray *selectedImage = @[@"tab_home_selected",@"tab_money_selected",@"tab_baoxiang_selected",@"tab_person_selected"];
    NSArray *name = @[@"首页",@"资讯",@"动态",@"我的"];
    
    NSMutableArray *controllers = [NSMutableArray new];
    for (int i = 0; i < vcName.count; i++) {

        Class class = NSClassFromString(vcName[i]);
        UIViewController *vc = [[class alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:name[i] image:[UIImage imageNamed:image[i]] selectedImage:[UIImage imageNamed:selectedImage[i]]];
        
        [controllers addObject:nav];
    }
    self.viewControllers = controllers;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
