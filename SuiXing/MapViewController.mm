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
#import <BaiduMapAPI_Search/BMKGeocodeSearch.h>

#define KScreenWidth ([UIScreen mainScreen].bounds.size.width > [UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)

#define KScreenHeight ([UIScreen mainScreen].bounds.size.width > [UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)

@interface MapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>
{
    BMKLocationService* _locService;
    BMKGeoCodeSearch *_geoCodeSearch;
    NSInteger cityIndex;
}
@property (nonatomic,strong)BMKMapView *mapView;;
@property (nonatomic,strong)UIButton *dismissBtn;;
@property (nonatomic,strong)NSMutableArray *coordinateArray;;

@end

@implementation MapViewController

 -(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.cityArray = [[NSArray alloc]init];
        cityIndex = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.dismissBtn];
    
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    [_locService startUserLocationService];
    _geoCodeSearch =[[BMKGeoCodeSearch alloc]init];
    _geoCodeSearch.delegate = self;
    
    [self dealGeoCodeSearchWithKey:[self.cityArray objectAtIndex:cityIndex]];

}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [self.mapView viewWillAppear];
    self.mapView.delegate = self;
    _locService.delegate = self;
    _geoCodeSearch.delegate = self;

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
    _geoCodeSearch.delegate = nil;

}
#pragma mark - Setup
//- (void)setCityArray:(NSArray *)cityArray
//{
//    _cityArray = cityArray;
//    [self.coordinateArray removeAllObjects];
//    for (NSInteger i=0; i<cityArray.count; i++) {
//        [self dealGeoCodeSearchWithKey:[cityArray objectAtIndex:i]];
//    }
//}

#pragma mark - Property
- (NSMutableArray *)coordinateArray
{
    if (!_coordinateArray) {
        _coordinateArray = [[NSMutableArray alloc]init];
    }
    return _coordinateArray;
}
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
        _mapView.showsUserLocation = NO;//显示定位图层
        _mapView.zoomLevel = 7;
        _mapView.delegate = self;
    }
    return _mapView;
}

#pragma mark - Action
- (void)dealDisMiss
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addLine
{
    
    CLLocationCoordinate2D commuterLotCoords[[self.coordinateArray count]];
    for (int i=0; i<[self.coordinateArray count]; i++)
    {
        commuterLotCoords[i]=[[self.coordinateArray objectAtIndex:i] coordinate];
    }
    
    //构建分段颜色索引数组
    NSArray *colorIndexs = [NSArray arrayWithObjects:
                            [NSNumber numberWithInt:2],
                            [NSNumber numberWithInt:0],
                            [NSNumber numberWithInt:1],
                            [NSNumber numberWithInt:2], nil];
    
    //构建BMKPolyline,使用分段颜色索引，其对应的BMKPolylineView必须设置colors属性
    BMKPolyline *colorfulPolyline = [BMKPolyline polylineWithCoordinates:commuterLotCoords count:5 textureIndex:colorIndexs];
    [_mapView addOverlay:colorfulPolyline];
    
}
#pragma mark - MapViewDelegate
//geo检索
-(void)dealGeoCodeSearchWithKey:(NSString *)key
{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
        geoCodeSearchOption.city= @"全国";
        geoCodeSearchOption.address = key;
        BOOL flag = [_geoCodeSearch geoCode:geoCodeSearchOption];
        if(flag)
        {
            NSLog(@"geo检索发送成功");
        }
        else
        {
            NSLog(@"geo检索发送失败");
        }

    });
}
- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    if (error == BMK_SEARCH_NO_ERROR) {
        //在此处理正常结果
        CLLocation *location = [[CLLocation alloc]initWithLatitude:result.location.latitude longitude:result.location.longitude];
        [self.coordinateArray addObject:location];

        cityIndex ++;
        if (cityIndex == self.cityArray.count) {
            [self addLine];
        }else{
            [self dealGeoCodeSearchWithKey:[self.cityArray objectAtIndex:cityIndex]];
        }
        
    }
    else {
        NSLog(@"抱歉，未找到结果");
    }
    
}
//根据overlay生成对应的View
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay
{
    if ([overlay isKindOfClass:[BMKPolyline class]]) {
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay];
        polylineView.lineWidth = 2;
        /// 使用分段颜色绘制时，必须设置（内容必须为UIColor）
        polylineView.colors = [NSArray arrayWithObjects:[UIColor greenColor], nil];
        return polylineView;
    }
    
    return nil;
}

@end
