//
//  AppDelegate.m
//  SuiXing
//
//  Created by yangyang on 16/3/14.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

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
            //初始化tabbar
            [self initTabBarController];
        }else{
            LoginViewController *login = [[LoginViewController alloc]init];
            self.window.rootViewController = login;
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
    TabBarViewController *tabBar = [[TabBarViewController alloc]init];
    self.window.rootViewController = tabBar;
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

    //添加启动页
    [self addStartPageImagView];
    //设置导航条样式
    [self initNavigationBarInterface];
    //注册Bmob
    [self registerBmob];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
