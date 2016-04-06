//
//  IndexViewController.m
//  SuiXing
//
//  Created by yangyang on 16/3/14.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation IndexViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    [self.view addSubview:self.scrollView];
    // Do any additional setup after loading the view.
}

#pragma mark - UIScrollViewDelegate


#pragma mark - Property

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, SX_SCREEN_HEIGHT)];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = UIColorFromRGB(0xffffff);
    }
    return _scrollView;
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
