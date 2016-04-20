//
//  SelectRoadViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/15.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SelectRoadViewController.h"
#import "PersonCell.h"
#import "RoadCell.h"
#import "SXIndexHeaderView.h"
#import "RoadFooterView.h"
#import "RoadModel.h"

@interface SelectRoadViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) NSMutableArray *roadArray;

@end

@implementation SelectRoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自由行";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    
    
    NSString *road1 = @"1";
    [self.roadArray addObject:road1];
    // Do any additional setup after loading the view.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.roadArray.count + 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        SXIndexHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        headerView.bgColor = [UIColor lightGrayColor];
        if (indexPath.section == 0) {
            headerView.titleLabel.text = @"人数";
        }else{
            headerView.titleLabel.text = [NSString stringWithFormat:@"路线%ld",(indexPath.section)];
        }
        reusableView = headerView;
    }else if (kind == UICollectionElementKindSectionFooter){
        RoadFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"RoadFooterView" forIndexPath:indexPath];
        [footerView.addRoadButton addTarget:self action:@selector(addNewRoadClick) forControlEvents:UIControlEventTouchUpInside];
        reusableView = footerView;
    }
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *cellIde = @"PersonCell";
        PersonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIde forIndexPath:indexPath];
        return cell;
    }else {
        static NSString *cellIde = @"RoadCell";
        RoadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIde forIndexPath:indexPath];
        return cell;
    }
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(SX_SCREEN_WIDTH, 50);
    }else{
        return CGSizeMake(SX_SCREEN_WIDTH, 100);
    }

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
        return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(SX_SCREEN_WIDTH, 30);
    }else{
        return CGSizeMake(SX_SCREEN_WIDTH, 30);
    }
   
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == self.roadArray.count) {
        return CGSizeMake(SX_SCREEN_WIDTH, 50);
    }
    return CGSizeZero;
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}


#pragma mark - Private Methods

- (void)addNewRoadClick{
    RoadModel *model = [[RoadModel alloc]init];
    [self.roadArray addObject:model];
    [self.collectionView reloadData];
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
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, SX_SCREEN_HEIGHT) collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[PersonCell class] forCellWithReuseIdentifier:@"PersonCell"];
        [_collectionView registerClass:[RoadCell class] forCellWithReuseIdentifier:@"RoadCell"];
        [_collectionView registerClass:[SXIndexHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        [_collectionView registerClass:[RoadFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"RoadFooterView"];

//        [_collectionView registerClass:[TopicRoadCell class] forCellWithReuseIdentifier:@"TopicRoadCell"];
        
    }
    return _collectionView;
}

- (NSMutableArray *)roadArray{
    if (!_roadArray) {
        _roadArray = [NSMutableArray array];
    }
    return _roadArray;
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
