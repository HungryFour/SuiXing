//
//  TopicRoadViewController.m
//  SuiXing
//
//  Created by 关静 on 16/4/22.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "TopicRoadViewController.h"

@interface TopicRoadViewController () <YSLTransitionAnimatorDataSource>

@property (strong, nonatomic) UIImageView *headerImageView;

@end

@implementation TopicRoadViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [self ysl_removeTransitionDelegate];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self ysl_addTransitionDelegate:self];
    [self ysl_popTransitionAnimationWithCurrentScrollView:nil
                                    cancelAnimationPointY:0
                                        animationDuration:0.3
                                  isInteractiveTransition:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.headerImageView];

    
    CGRect rect = [UIScreen mainScreen].bounds;
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    // header
    // If you're using a xib and storyboard. Be sure to specify the frame
    self.headerImageView.frame = CGRectMake(0, statusHeight + navigationHeight, rect.size.width, 250);

    // custom navigation left item
    __weak TopicRoadViewController *weakself = self;
    [self ysl_setUpReturnBtnWithColor:[UIColor lightGrayColor]
                      callBackHandler:^{
                          [weakself.navigationController popViewControllerAnimated:YES];
                      }];
    self.title = @"主题路线";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark -- YSLTransitionAnimatorDataSource
- (UIImageView *)popTransitionImageView
{
    return self.headerImageView;
}

- (UIImageView *)pushTransitionImageView
{
    return nil;
}

- (UIImageView *)headerImageView{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc]init];
        
    }
    return _headerImageView;
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
