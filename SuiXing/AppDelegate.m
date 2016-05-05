//
//  AppDelegate.m
//  SuiXing
//
//  Created by yangyang on 16/3/14.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "AppDelegate.h"
#import "SXTabBarController.h"
#import "LoginViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface AppDelegate ()
{
    BMKMapManager *_mapManager;
}
@end

@implementation AppDelegate

#pragma mark - Create Method

//添加启动页
- (void)addStartPageImagView{
    
    NSArray *imageArray = @[@"desk1.jpeg",@"desk2.jpg",@"desk3.jpg",@"desk4.jpg"];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, SX_SCREEN_HEIGHT)];
    image.image = [UIImage imageNamed:imageArray[(random() % (imageArray.count - 1))]];
    [self.window addSubview:image];
    [UIView animateKeyframesWithDuration:1.5 delay:1.5 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        image.alpha = 0.6;
        image.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        if (LoginStatus) {

        }else{
            LoginViewController *login = [[LoginViewController alloc]init];
            [self.window.rootViewController presentViewController:login animated:YES completion:nil];
        }
        [image removeFromSuperview];
        
    }];

}

//注册Bmob
- (void)registerBmob{
    [Bmob registerWithAppKey:@"94622e03bb28e43d8e394e24df017411"];
}

//初始化tabBar
- (void)initTabBarController{
    SXTabBarController *tabBar = [[SXTabBarController alloc]init];
    self.window.rootViewController = (UIViewController *)tabBar.tabBarController;
}

- (void)initNavigationBarInterface{
    //导航条title属性设置
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColorFromRGB(0xffffff)}];
    //tintColor设置
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x118AD2)];
    [[UINavigationBar appearance] setTintColor:UIColorFromRGB(0xffffff)];
    [[UINavigationBar appearance] setBackgroundColor:UIColorFromRGB(0x118AD2)];
    //背景图片设置
    //[[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //底部是否有阴影
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}

#pragma mark - Application Delegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //初始化window
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc]init];

    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"Ad83BEqyNIglvFIPUU9Cnw301Cuu5gc0"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }else{
        NSLog(@"manager start success!");
    }
    //初始化tabbar
    [self initTabBarController];
    
    //添加启动页
    [self addStartPageImagView];
    //设置导航条样式
    [self initNavigationBarInterface];
    //注册Bmob
    [self registerBmob];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [BMKMapView willBackGround];//当应用即将后台时调用，停止一切调用opengl相关的操作

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [BMKMapView didForeGround];//当应用恢复前台状态时调用，回复地图的渲染和opengl相关的操作

}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
