//
//  SXScrollView.m
//  SuiXing
//
//  Created by 王阳 on 16/4/13.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXScrollCell.h"
#import "SXScrollView.h"
#import "SXScrollModel.h"

@interface SXScrollCell () <SXScrollViewDelegate,SXSrollViewDataSource>

@property (strong, nonatomic) SXScrollView *scrollView;
@property (strong, nonatomic) SXScrollModel *scrollModel;
@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) NSArray *imageArray;

@end

@implementation SXScrollCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _imageArray = [self.scrollModel getImageArray];
        [self addSubview:self.scrollView];
        [self.scrollView reloadData];
        [self addSubview:self.bottomView];

    }
    return self;
}

#pragma mark - SXScrollViewDataSource

-(NSInteger)numberOfPagesInScrollView:(SXScrollView *)scrollView{
    return _imageArray.count;
}

-(UIView *)scrollView:(SXScrollView *)scrollView pageAtIndex:(NSInteger)index{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.scrollView.frame];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.image = [UIImage imageNamed:_imageArray[index]];
    return imageView;
}

#pragma mark - SXScrollViewDelegate

- (void)scrollView:(SXScrollView *)scrollView didClickPageAtIndex:(NSInteger)index{
    NSLog(@"click page number = %ld",index);
}


#pragma mark - Private method

- (void)setOutClick:(UIButton *)button{
    NSLog(@"Go Go Go");
}

#pragma mark - Property

- (SXScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[SXScrollView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, CGRectGetHeight(self.frame))];
        _scrollView.sx_delegate = self;
        _scrollView.sx_dataSource = self;
        
    }
    return _scrollView;
}

- (SXScrollModel *)scrollModel{
    if (!_scrollModel) {
        _scrollModel = [[SXScrollModel alloc]init];
    }
    return _scrollModel;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 30, SX_SCREEN_WIDTH, 30)];
        _bottomView.backgroundColor = [UIColor clearColor];
        
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, 30)];
        bgView.backgroundColor = [UIColor lightGrayColor];
        bgView.alpha = 0.4;
        [_bottomView addSubview:bgView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:bgView.frame];
        [button setTitle:@"即刻出发" forState:UIControlStateNormal];
        button.titleLabel.textColor = [UIColor whiteColor];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(setOutClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:button];
    }
    return _bottomView;
}

@end
