//
//  SXScrollView.m
//  SuiXing
//
//  Created by 王阳 on 16/4/13.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXScrollView.h"

@interface SXScrollView () <UIScrollViewDelegate>

@property (assign, nonatomic) NSInteger totalPage;
@property (assign, nonatomic) NSInteger currentPage;
@property (strong, nonatomic) NSMutableArray *viewArray;
@property (strong, nonatomic) UIView *currentView;
@property (strong, nonatomic) NSTimer *timer;

@property (assign, nonatomic) BOOL isTransform;
@property (strong, nonatomic) UIPageControl *pageControl;

@end

@implementation SXScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _currentPage = 0;
        _totalPage = 0;
        _isTransform = NO;
        
        self.delegate = self;
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(self.bounds.size.width * 3, self.bounds.size.height);
        self.showsHorizontalScrollIndicator = NO;
        self.contentOffset = CGPointMake(self.bounds.size.width, 0);
        
        [self.timer setFireDate:[NSDate distantPast]];
        [self.superview addSubview:self.pageControl];

    }
    return self;
}


- (void)reloadData{
    
    _totalPage = [_sx_dataSource numberOfPagesInScrollView:self];
    
    if (_totalPage == 0) {
        [self.timer pauseTimer];
        return;
    }
    self.pageControl.numberOfPages = _totalPage;
    [self loadData];
}

#pragma mark - UIScollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int x = self.contentOffset.x;
    if (x >= (2 * self.bounds.size.width)) {
        _isTransform = NO;
        _currentPage = [self validPageValue:(_currentPage + 1)];
        [self loadData];
    }else if (x <= 0){
        _isTransform = NO;
        _currentPage = [self validPageValue:(_currentPage - 1)];
        [self loadData];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.contentOffset = CGPointMake(self.bounds.size.width, 0);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer pauseTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.timer resumeTimerAfterTimeInterval:3.0f];
}

#pragma mark - Private Method

- (void)loadData{
    
    self.pageControl.currentPage = _currentPage;
    
    NSArray *subViews = [self subviews];
    if (subViews.count != 0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    [self displayViewWithCurrentPage:_currentPage];
    
    for (int i = 0; i < 3; i++) {
        UIView *view = (UIView *)[self.viewArray objectAtIndex:i];
        view.frame = CGRectOffset(view.frame, view.frame.size.width * i, 0);
        view.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *oneClick = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneTapClick:)];
        oneClick.numberOfTapsRequired = 1;
        [view addGestureRecognizer:oneClick];
        
        UITapGestureRecognizer *doubleClick = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapClick:)];
        doubleClick.numberOfTapsRequired = 2;
        [view addGestureRecognizer:doubleClick];
        
        if (i == 0) {
            self.currentView = view;
        }
        [self addSubview:view];
    }
    self.contentOffset = CGPointMake(self.bounds.size.width, 0);
}

- (void)displayViewWithCurrentPage:(NSInteger)page{
    
    [self removeArrayData];
    
    NSInteger pre = [self validPageValue:(_currentPage - 1)];
    NSInteger last = [self validPageValue:(_currentPage + 1)];
    
    [self.viewArray addObject:[_sx_dataSource scrollView:self pageAtIndex:pre]];
    [self.viewArray addObject:[_sx_dataSource scrollView:self pageAtIndex:page]];
    [self.viewArray addObject:[_sx_dataSource scrollView:self pageAtIndex:last]];

}

- (void)removeArrayData{
    if (self.viewArray.count) {
        [self.viewArray removeAllObjects];
    }
}

- (NSInteger)validPageValue:(NSInteger)page{
    
    if (page < 0) {
        return (_totalPage - 1);
    }else if (page > (_totalPage - 1)){
        return 0;
    }else{
        return page;
    }
}

- (void)pageNext{
    CGPoint newOffset = CGPointMake(self.contentOffset.x + self.bounds.size.width, self.contentOffset.y);
    [self setContentOffset:newOffset animated:YES];
}

- (void)oneTapClick:(UITapGestureRecognizer *)gesture{
    if ([self.sx_delegate respondsToSelector:@selector(scrollView:didClickPageAtIndex:)]) {
        [self.sx_delegate scrollView:self didClickPageAtIndex:_currentPage];
    }
}

- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}


- (void)doubleTapClick:(UITapGestureRecognizer *)gesture{
//    
//    UIViewController *vc = [self getCurrentVC];
//    
//    if (!_isTransform) {
//        _isTransform = YES;
//        //[self.timer pauseTimer];
//        [UIView animateWithDuration:1.0f animations:^{
//            self.currentView.frame = CGRectMake(vc.view.frame.origin.x, 260, SX_SCREEN_WIDTH, 260);
//            //[vc.view addSubview:self.currentView];
//        }];
//    }else{
//        _isTransform = NO;
//        //[self.timer resumeTimer];
//        [UIView animateWithDuration:1.0f animations:^{
//            self.currentView.frame = CGRectMake(vc.view.frame.origin.x, 0, SX_SCREEN_WIDTH, 260);
//        }completion:^(BOOL finished) {
//            [vc.view willRemoveSubview:self.currentView];
//        }];
//    }
}

#pragma mark - Setter and Getter

- (void)setDataSource:(id<SXSrollViewDataSource>)sx_dataSource{
    _sx_dataSource = sx_dataSource;
    [self reloadData];
}

- (NSMutableArray *)viewArray{
    if (!_viewArray) {
        _viewArray = [NSMutableArray arrayWithCapacity:3];
    }
    return _viewArray;
}

- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(pageNext) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0,CGRectGetHeight(self.superview.bounds) - 30, SX_SCREEN_WIDTH, 30)];
        _pageControl.userInteractionEnabled = NO;
        _pageControl.hidesForSinglePage = YES;
        _pageControl.backgroundColor = [UIColor redColor];
    }
    return _pageControl;
}

@end
