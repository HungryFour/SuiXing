//
//  NewRoadCell.m
//  SuiXing
//
//  Created by 王阳 on 16/4/13.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "NewRoadCell.h"
#import "NewRoadModel.h"

@interface NewRoadCell () <UIScrollViewDelegate>

@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) NewRoadModel *scrollModel;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation NewRoadCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _imageArray = [self.scrollModel getImageArray];
        [self addSubview:self.scrollView];
        [self initGui];
    }
    return self;
}


- (void)initGui{
    CGFloat edge = 20;
    CGFloat width = (SX_SCREEN_WIDTH - 20*3) / 2;
    CGFloat height = self.bounds.size.height - 2 * 20;
    for (int i = 0; i < _imageArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(edge + (edge + width) * i , edge, width, height)];
        [button setBackgroundImage:[UIImage imageNamed:_imageArray[i]] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blueColor]];
        button.tag = i;
        [button addTarget:self action:@selector(newRoadClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
    }
    
}

- (void)newRoadClick:(UIButton *)button{
    NSInteger tag = button.tag;
    NSLog(@"click %ld",tag);
}

#pragma mark - Property

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.contentSize = CGSizeMake((self.bounds.size.width / 2) * _imageArray.count, self.bounds.size.height);
        _scrollView.delegate =self;
    }
    return _scrollView;
}

- (NewRoadModel *)scrollModel{
    if (!_scrollModel) {
        _scrollModel = [[NewRoadModel alloc]init];
    }
    return _scrollModel;
}

@end
