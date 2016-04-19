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
    CGFloat edge = 10;
    CGFloat topEdge = 5;
    CGFloat width = self.bounds.size.height - 2 * topEdge;
    self.scrollView.contentSize = CGSizeMake(width * _imageArray.count + (_imageArray.count + 1) * edge, self.bounds.size.height);
    for (int i = 0; i < _imageArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(edge + (edge + width) * i , topEdge, width, width)];
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
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.showsHorizontalScrollIndicator = NO;
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
