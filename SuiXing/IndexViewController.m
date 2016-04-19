//
//  IndexViewController.m
//  SuiXing
//
//  Created by yangyang on 16/3/14.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "IndexViewController.h"
#import "SXScrollCell.h"
#import "NewRoadCell.h"
#import "SXIndexHeaderView.h"
#import "TopicRoadCell.h"

@interface IndexViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) UIView *bgView;

@end

@implementation IndexViewController

#pragma mark - life cycle

- (instancetype)init{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat offset = scrollView.contentOffset.y;
    if (offset < -50) {
        scrollView.contentOffset = CGPointMake(0, -50);
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 2) {
        return self.imageArray.count;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        SXIndexHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        if (indexPath.section == 1) {
            headerView.titleLabel.text = @"最新路线";
            headerView.rightLabel.text = @"查看更多 >";
            
        }else if (indexPath.section == 2) {
            headerView.titleLabel.text = @"主题路线";
        }
        reusableView = headerView;
    }
    
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *cellIde = @"SXScrollCell";
        SXScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIde forIndexPath:indexPath];
        return cell;
    }else if(indexPath.section == 1){
        static NSString *cellIde = @"NewRoadCell";
        NewRoadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIde forIndexPath:indexPath];
        return cell;
    }else{
        static NSString *cellIde = @"TopicRoadCell";
        TopicRoadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIde forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
        cell.imageNameLabel.text = [NSString stringWithFormat:@"随行图片%ld",indexPath.item];
        return cell;
    }

}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(SX_SCREEN_WIDTH, 260);
    }else if (indexPath.section == 1){
        return CGSizeMake(SX_SCREEN_WIDTH, 100);
    }
    return CGSizeMake(SX_SCREEN_WIDTH, 200);

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0 || section == 1) {
        return UIEdgeInsetsZero;
    }else{
        return UIEdgeInsetsMake(10, 0, 0, 0);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeZero;
    }else if(section == 1){
        return CGSizeMake(SX_SCREEN_WIDTH, 30);
    }else
        return CGSizeMake(SX_SCREEN_WIDTH, 50);
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        NSLog(@"click item : %ld", indexPath.row);
    }
}

#pragma mark - Property

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [_flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, SX_SCREEN_HEIGHT - 49) collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[SXScrollCell class] forCellWithReuseIdentifier:@"SXScrollCell"];
        [_collectionView registerClass:[NewRoadCell class] forCellWithReuseIdentifier:@"NewRoadCell"];
        [_collectionView registerClass:[SXIndexHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        [_collectionView registerClass:[TopicRoadCell class] forCellWithReuseIdentifier:@"TopicRoadCell"];

    }
    return _collectionView;
}


- (NSArray *)imageArray{
    _imageArray = @[@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg"];
    return _imageArray;
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.frame = CGRectMake(0, 0, SX_SCREEN_WIDTH, 50);
        _bgView.backgroundColor = UIColorFromRGB(0xf3f3f3);
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _bgView.frame.size.width, _bgView.frame.size.height)];
        label.text = @"随行，伴您旅行";
        label.font = [UIFont fontWithName:@"zapfino" size:18];
        label.textColor = UIColorFromRGB(0x666666);
        label.textAlignment = NSTextAlignmentCenter;
        [_bgView addSubview:label];
        
    }
    return _bgView;
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
