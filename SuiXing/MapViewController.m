//
//  MapViewController.m
//  SuiXing
//
//  Created by 武建明 on 16/5/4.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "MapViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

#define KScreenWidth ([UIScreen mainScreen].bounds.size.width > [UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)

#define KScreenHeight ([UIScreen mainScreen].bounds.size.width > [UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)

@interface MapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKLocationService* _locService;

}
@property (nonatomic,strong)BMKMapView *mapView;;
@property (nonatomic,strong)UIButton *dismissBtn;;

@end

@implementation MapViewController

 -(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.dismissBtn];
    
    _locService = [[BMKLocationService alloc]init];
    [_locService startUserLocationService];

    
}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [self.mapView viewWillAppear];
    self.mapView.delegate = self;
    _locService.delegate = self;

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil;
    _locService.delegate = nil;

}

#pragma mark - Property
- (UIButton *)dismissBtn
{
    if (!_dismissBtn) {
        _dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _dismissBtn.frame = CGRectMake(20, 20, 44, 44);
        _dismissBtn.backgroundColor = [UIColor greenColor];
        [_dismissBtn addTarget:self action:@selector(dealDisMiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dismissBtn;
}
-(BMKMapView *)mapView
{
    if (!_mapView) {
        _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
        _mapView.showsUserLocation = YES;//显示定位图层
        _mapView.zoomLevel = 18;
        _mapView.backgroundColor = [UIColor redColor];
//        BMKLocationViewDisplayParam *displayParam = [[BMKLocationViewDisplayParam alloc]init];
//        displayParam.isAccuracyCircleShow = false;//精度圈是否显示
//        [_mapView updateLocationViewWithParam:displayParam];
        
    }
    return _mapView;
}

#pragma mark - Action
- (void)dealDisMiss
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
