//
//  SetRoadViewController.m
//  SuiXing
//
//  Created by 关静 on 16/4/21.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SetRoadViewController.h"
#import "SetRoadCell.h"
#import "RoadModel.h"
#import "ZHPickView.h"
#import "SelectHotelViewController.h"

#define Cell_Name @[@"人数",@"选择起点",@"选择下一站",@"选择出行方式",@"出发时间",@"选择入住时间",@"选择离店时间",@"选择酒店"]
#define Key @[@"number",@"startPoint",@"endPoint",@"tripType",@"startTime",@"startLiveTime",@"endLiveTime",@"hotel"]

@interface SetRoadViewController () <UITableViewDelegate,UITableViewDataSource,ZHPickViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) ZHPickView *pickview;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;

@end

@implementation SetRoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置路线";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    if (self.startPoint) {
        self.model.startPoint = self.startPoint;
        [self.tableView reloadData];
    }
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateHotelName:) name:SXHotelNotification object:nil];

    // Do any additional setup after loading the view.
    
}

#pragma mark - Private methods
- (void)rightBarButtonItemClick{
    
    for (int i = 0; i < Key.count; i++) {
        NSString *value = [self.model valueForKey:Key[i]];
        if (value) {
            continue;
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"不允许为空" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }
    }
    
    [[NSNotificationCenter defaultCenter]postNotificationName:SXRoadNotification object:self.model];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateHotelName:(NSNotification *)notification{
    SetRoadCell *cell = [self.tableView cellForRowAtIndexPath:_currentIndexPath];
    cell.rightLabel.text = notification.object;
    self.model.hotel = notification.object;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIde = @"cell";
    SetRoadCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if (!cell) {
        cell = [[SetRoadCell alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.leftLabel.text = Cell_Name[indexPath.row];
    
    switch (indexPath.row) {
        case 0:
        {
            cell.rightLabel.text = self.model.number;
        }
            break;
        case 1:
        {
            cell.rightLabel.text = self.model.startPoint;
        }
            break;
        case 2:
        {
            cell.rightLabel.text = self.model.endPoint;
        }
            break;
        case 3:
        {
            cell.rightLabel.text = self.model.tripType;
        }
            break;
        case 4:
        {
            cell.rightLabel.text = self.model.startTime;
        }
            break;
        case 5:
        {
            cell.rightLabel.text = self.model.startLiveTime;
        }
            break;
        case 6:
        {
            cell.rightLabel.text = self.model.endLiveTime;
        }
            break;
        case 7:
        {
            cell.rightLabel.text = self.model.hotel;
        }
            break;
            
        default:
            break;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _currentIndexPath = indexPath;
    switch (indexPath.row) {
        case 0:
        {
            NSArray *array=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"];
            _pickview=[[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
            _pickview.delegate=self;
            [_pickview show];
        }
            break;
        case 1:
        {
             _pickview=[[ZHPickView alloc] initPickviewWithPlistName:@"city" isHaveNavControler:NO];
            _pickview.delegate=self;
            [_pickview show];
        }
            break;
        case 2:
        {
            _pickview=[[ZHPickView alloc] initPickviewWithPlistName:@"city" isHaveNavControler:NO];
            _pickview.delegate=self;
            [_pickview show];
        }
            
            break;
        case 3:
        {
            NSArray *array=@[@"飞机",@"火车",@"汽车",@"游轮",@"其他"];
            _pickview=[[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
            _pickview.delegate=self;
            [_pickview show];
        }
            break;
        case 4:
        {
            NSDate *date=[NSDate dateWithTimeIntervalSinceNow:0];
            _pickview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
            _pickview.delegate=self;
            [_pickview show];
        }
            break;
        case 5:
        {
            NSDate *date=[NSDate dateWithTimeIntervalSinceNow:0];
            _pickview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
            _pickview.delegate=self;
            [_pickview show];
        }
            break;
        case 6:
        {
            NSDate *date=[NSDate dateWithTimeIntervalSinceNow:0];
            _pickview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
            _pickview.delegate=self;
            [_pickview show];
        }
            break;
        case 7:
        {
            SelectHotelViewController *vc = [[SelectHotelViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - ZHPickViewDelegate

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    SetRoadCell *cell = [self.tableView cellForRowAtIndexPath:_currentIndexPath];
    switch (_currentIndexPath.row) {
        case 0:
        {
            cell.rightLabel.text = [NSString stringWithFormat:@"%@人",resultString];
            self.model.number = resultString;
        }
            break;
        case 1:
        {
            cell.rightLabel.text = resultString;
            self.model.startPoint = resultString;
        }
            break;
        case 2:
        {
            cell.rightLabel.text = resultString;
            self.model.endPoint = resultString;
        }
            break;
        case 3:
        {
            cell.rightLabel.text = resultString;
            self.model.tripType = resultString;
        }
            break;
        case 4:
        {
            cell.rightLabel.text = resultString;
            self.model.startTime = resultString;
        }
            break;
        case 5:
        {
            cell.rightLabel.text = resultString;
            self.model.startLiveTime = resultString;
        }
            break;
        case 6:
        {
            cell.rightLabel.text = resultString;
            self.model.endLiveTime = resultString;
        }
            break;
            
        default:
            break;
    }
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

- (RoadModel *)model{
    if (!_model) {
        _model = [[RoadModel alloc]init];
    }
    return _model;
}

@end
