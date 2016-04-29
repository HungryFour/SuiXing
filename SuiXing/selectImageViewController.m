//
//  selectImageViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/28.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "selectImageViewController.h"
#import "MLSelectPhotoAssets.h"
#import "MLSelectPhotoPickerAssetsViewController.h"
#import "MLSelectPhotoBrowserViewController.h"


@interface selectImageViewController () <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *assets;

@end

@implementation selectImageViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"selectPhotos" style:UIBarButtonItemStyleDone target:self action:@selector(selectPhotos)];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Methods

- (void)selectPhotos{
    //创建控制器
    MLSelectPhotoPickerViewController *pickerVC = [[MLSelectPhotoPickerViewController alloc]init];
    //默认显示相册里面的内容savePhotos
    pickerVC.status = PickerViewShowStatusCameraRoll;
    [pickerVC show];
    __weak typeof (self) weakSelf = self;
    pickerVC.callBack = ^(NSArray *assets){
        [weakSelf.assets addObjectsFromArray:assets];
        [weakSelf.tableView reloadData];
    };
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.assets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIde = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIde];
    }
    //判断类型来获取Image
    MLSelectPhotoAssets *asset = self.assets[indexPath.row];
    cell.imageView.image = [MLSelectPhotoPickerViewController getImageWithImageObj:asset];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MLSelectPhotoBrowserViewController *browserVc = [[MLSelectPhotoBrowserViewController alloc] init];
    browserVc.currentPage = indexPath.row;
    browserVc.photos = self.assets;
    [self.navigationController pushViewController:browserVc animated:YES];
}


#pragma mark - Getter and Setter

- (NSMutableArray *)assets{
    if (!_assets) {
        _assets = [NSMutableArray array];
    }
    return _assets;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _tableView;
}


@end
