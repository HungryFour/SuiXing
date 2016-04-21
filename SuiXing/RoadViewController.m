//
//  SelectRoadViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/15.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "RoadViewController.h"
#import "PersonCell.h"
#import "RoadCell.h"
#import "SXIndexHeaderView.h"
#import "RoadFooterView.h"
#import "RoadModel.h"
#import "SetRoadViewController.h"
#import "CommitOrderViewController.h"

@interface RoadViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) NSMutableArray *roadArray;

@end

@implementation RoadViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自由行";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    
    RoadModel *model = [[RoadModel alloc]init];
    NSDictionary *dict= [NSDictionary dictionaryWithObjectsAndKeys:@"2",@"number",@"北京",@"startPoint",@"上海",@"endPoint",@"飞机",@"tripType",@"2016-1-1",@"startTime",@"2016-1-2",@"startLiveTime",@"2016-1-3",@"endLiveTime",@"如家",@"hotel", nil];
    [model setValuesForKeysWithDictionary:dict];
    [self.roadArray addObject:model];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadData:) name:@"SXUpdateRoadsNotification" object:nil];

    // Do any additional setup after loading the view.
}


#pragma mark - Private Methods

- (void)addNewRoadClick{
    SetRoadViewController *vc = [[SetRoadViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)commitOrderClick{
    CommitOrderViewController *vc = [[CommitOrderViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)reloadData:(NSNotification *)notification{
    
    NSLog(@"object = %@",notification.object);
    RoadModel *model = notification.object;
    [self.roadArray addObject:model];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.roadArray.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        RoadModel *model = self.roadArray[indexPath.section];
        SXIndexHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        headerView.bgColor = [UIColor lightGrayColor];
        headerView.titleLabel.text = [NSString stringWithFormat:@"路线%ld",(indexPath.section + 1)];
        if (model) {
            headerView.rightLabel.text = [NSString stringWithFormat:@"%@----%@",model.startPoint,model.endPoint];
        }else{
            headerView.rightLabel.text = @"";

        }
        reusableView = headerView;
    }else if (kind == UICollectionElementKindSectionFooter){
        RoadFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"RoadFooterView" forIndexPath:indexPath];
        [footerView.addRoadButton addTarget:self action:@selector(addNewRoadClick) forControlEvents:UIControlEventTouchUpInside];
        [footerView.commitButton addTarget:self action:@selector(commitOrderClick) forControlEvents:UIControlEventTouchUpInside];
        reusableView = footerView;
    }
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    RoadModel *model = self.roadArray[indexPath.section];
    static NSString *cellIde = @"RoadCell";
    RoadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIde forIndexPath:indexPath];
    cell.model = model;
    return cell;
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SX_SCREEN_WIDTH, 200);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SX_SCREEN_WIDTH, 30);
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == self.roadArray.count - 1) {
        return CGSizeMake(SX_SCREEN_WIDTH, 100);
    }
    return CGSizeZero;
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
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
