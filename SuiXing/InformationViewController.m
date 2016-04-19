//
//  InformationViewController.m
//  SuiXing
//
//  Created by yangyang on 16/3/14.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "InformationViewController.h"
#import "InfoHeaderCell.h"
#import "SXIndexHeaderView.h"
#import "TopicRoadCell.h"

#define recomment_title @[@"单人",@"组团",@"家庭",@"情侣"]

@interface InformationViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) NSArray *recommentArray;

@end

@implementation InformationViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资讯";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 1) {
        return self.recommentArray.count;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        SXIndexHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        if (indexPath.section == 1) {
            headerView.titleLabel.text = @"个性推荐";
        }
        reusableView = headerView;
    }
    
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *cellIde = @"InfoHeaderCell";
        InfoHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIde forIndexPath:indexPath];
        return cell;
    }else if(indexPath.section == 1){
        static NSString *cellIde = @"TopicRoadCell";
        TopicRoadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIde forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:self.recommentArray[indexPath.row]];
        cell.imageNameLabel.text = recomment_title[indexPath.row];
        return cell;
    }
    return nil;
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(SX_SCREEN_WIDTH, 100);
    }
    return CGSizeMake(SX_SCREEN_WIDTH, 150);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeZero;
    }else{
        return CGSizeMake(SX_SCREEN_WIDTH, 50);
    }
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
        [_collectionView registerClass:[InfoHeaderCell class] forCellWithReuseIdentifier:@"InfoHeaderCell"];
        [_collectionView registerClass:[SXIndexHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        [_collectionView registerClass:[TopicRoadCell class] forCellWithReuseIdentifier:@"TopicRoadCell"];
        
    }
    return _collectionView;
}

- (NSArray *)recommentArray{
    return @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
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
