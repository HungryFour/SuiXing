//
//  SelectRoadViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/15.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SelectRoadViewController.h"

@interface SelectRoadViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation SelectRoadViewController


- (instancetype)init{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择路线";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [SXPresentTransition transitionWithTransitionType:SXPresentTransitionPresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
     return [SXPresentTransition transitionWithTransitionType:SXPresentTransitionDismiss];
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
