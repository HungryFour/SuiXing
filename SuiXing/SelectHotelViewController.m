//
//  SelectHotelViewController.m
//  SuiXing
//
//  Created by 关静 on 16/4/21.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SelectHotelViewController.h"
#import "hotelModel.h"
#import "HotelCell.h"

@interface SelectHotelViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation SelectHotelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择酒店";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self initData];
    // Do any additional setup after loading the view.
    
}

- (void)initData{
    hotelModel *model1 = [[hotelModel alloc]init];
    NSDictionary *dict1= [NSDictionary dictionaryWithObjectsAndKeys:@"北京颐和安缦酒店",@"hotelName",@"hotel1.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥1888元",@"hotelPrice",@"豪华型",@"hotelType", nil];
    [model1 setValuesForKeysWithDictionary:dict1];
    
    hotelModel *model2 = [[hotelModel alloc]init];
    NSDictionary *dict2= [NSDictionary dictionaryWithObjectsAndKeys:@"北京王府井希尔顿酒店",@"hotelName",@"hotel2.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥2888元",@"hotelPrice",@"豪华型",@"hotelType", nil];
    [model2 setValuesForKeysWithDictionary:dict2];
    
    hotelModel *model3 = [[hotelModel alloc]init];
    NSDictionary *dict3= [NSDictionary dictionaryWithObjectsAndKeys:@"北京怡亨酒店",@"hotelName",@"hotel3.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥3888元",@"hotelPrice",@"豪华型",@"hotelType", nil];
    [model3 setValuesForKeysWithDictionary:dict3];
    
    hotelModel *model4 = [[hotelModel alloc]init];
    NSDictionary *dict4= [NSDictionary dictionaryWithObjectsAndKeys:@"北京国贸大酒店",@"hotelName",@"hotel4.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥4888元",@"hotelPrice",@"豪华型",@"hotelType", nil];
    [model4 setValuesForKeysWithDictionary:dict4];
    
    hotelModel *model5 = [[hotelModel alloc]init];
    NSDictionary *dict5= [NSDictionary dictionaryWithObjectsAndKeys:@"北京千禧大酒店",@"hotelName",@"hotel5.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥5888元",@"hotelPrice",@"舒适型",@"hotelType", nil];
    [model5 setValuesForKeysWithDictionary:dict5];
    
    hotelModel *model6 = [[hotelModel alloc]init];
    NSDictionary *dict6= [NSDictionary dictionaryWithObjectsAndKeys:@"北京金融街洲际酒店",@"hotelName",@"hotel6.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥6888元",@"hotelPrice",@"舒适型",@"hotelType", nil];
    [model6 setValuesForKeysWithDictionary:dict6];
    
    hotelModel *model7 = [[hotelModel alloc]init];
    NSDictionary *dict7= [NSDictionary dictionaryWithObjectsAndKeys:@"北京长安街W酒店",@"hotelName",@"hotel7.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥7888元",@"hotelPrice",@"豪华型",@"hotelType", nil];
    [model7 setValuesForKeysWithDictionary:dict7];
    
    hotelModel *model8 = [[hotelModel alloc]init];
    NSDictionary *dict8= [NSDictionary dictionaryWithObjectsAndKeys:@"北京中国大饭店",@"hotelName",@"hotel8.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥8888元",@"hotelPrice",@"豪华型",@"hotelType", nil];
    [model8 setValuesForKeysWithDictionary:dict8];
    
    hotelModel *model9 = [[hotelModel alloc]init];
    NSDictionary *dict9= [NSDictionary dictionaryWithObjectsAndKeys:@"北京香格里拉饭店",@"hotelName",@"hotel9.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥9888元",@"hotelPrice",@"豪华型",@"hotelType", nil];
    [model9 setValuesForKeysWithDictionary:dict9];
    
    hotelModel *model10 = [[hotelModel alloc]init];
    NSDictionary *dict10= [NSDictionary dictionaryWithObjectsAndKeys:@"北京四季酒店",@"hotelName",@"hotel10.JPG",@"hotelImageName",@"10分钟前有人预定",@"hotelMessage",@"距离您0.9公里",@"hotelLocation",@"￥888元",@"hotelPrice",@"豪华型",@"hotelType", nil];
    [model10 setValuesForKeysWithDictionary:dict10];
    
    [self.dataArray addObjectsFromArray:@[model1,model2,model3,model4,model5,model6,model7,model8,model9,model10]];
}

#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //static NSString *cellIde = @"HotelCell";
//    HotelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"HotelCell" owner:self options:nil]firstObject];
//    }
    
    HotelCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"HotelCell" owner:self options:nil]firstObject];
    
    hotelModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    hotelModel *model = self.dataArray[indexPath.row];
    [[NSNotificationCenter defaultCenter]postNotificationName:SXHotelNotification object:model.hotelName];
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark - Property

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, SX_SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = UIColorFromRGB(0xffffff);
    }
    return _tableView;
}

- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
