//
//  SetRoadViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/21.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SetRoadViewController.h"
#import "SetRoadCell.h"
#import "RoadModel.h"
#import "ZHPickView.h"

#define Cell_Name @[@"选择起点",@"选择下一站",@"选择出行方式",@"出发时间",@"选择入住时间",@"选择离店时间",@"选择酒店"]
#define Key @[@"number",@"startPoint",@"endPoint",@"tripType",@"startTime",@"startLiveTime",@"endLiveTime",@"hotel"]
@interface SetRoadViewController () <UITableViewDelegate,UITableViewDataSource,ZHPickViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) RoadModel *model;
@property (strong, nonatomic) ZHPickView *pickview;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;

@end

@implementation SetRoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置路线";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    // Do any additional setup after loading the view.
    
}

#pragma mark - Private methods
- (void)rightBarButtonItemClick{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"SXUpdateRoadsNotification" object:self.model];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIde = @"cell";
    SetRoadCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if (!cell) {
        cell = [[SetRoadCell alloc]init];
    }
    cell.leftLabel.text = Cell_Name[indexPath.row];
    
    switch (indexPath.row) {
        case 0:
        {
            cell.rightLabel.text = self.model.startPoint;
        }
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
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
             _pickview=[[ZHPickView alloc] initPickviewWithPlistName:@"city" isHaveNavControler:NO];
        }
            break;
        case 1:
        {
            _pickview=[[ZHPickView alloc] initPickviewWithPlistName:@"city" isHaveNavControler:NO];
        }
            
            break;
        case 2:
            
            break;
        case 3:
        {
            NSDate *date=[NSDate dateWithTimeIntervalSinceNow:9000000];
            _pickview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
        }
            break;
        case 4:
        {
            NSDate *date=[NSDate dateWithTimeIntervalSinceNow:9000000];
            _pickview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
        }
            break;
        case 5:
        {
            NSDate *date=[NSDate dateWithTimeIntervalSinceNow:9000000];
            _pickview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
        }
            break;
        case 6:
            
            break;
            
        default:
            break;
    }
    
    _pickview.delegate=self;
    [_pickview show];
    
}

#pragma mark - ZHPickViewDelegate

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    SetRoadCell *cell = [self.tableView cellForRowAtIndexPath:_currentIndexPath];
    switch (_currentIndexPath.row) {
        case 0:
        {
            cell.rightLabel.text = resultString;
            self.model.startPoint = resultString;
        }
            break;
        case 1:
        {
            cell.rightLabel.text = resultString;
            self.model.endPoint = resultString;
        }
            break;
        case 2:
        {
            cell.rightLabel.text = resultString;
            self.model.tripType = resultString;
        }
            break;
        case 3:
        {
            cell.rightLabel.text = resultString;
            self.model.startTime = resultString;
        }
            break;
        case 4:
        {
            cell.rightLabel.text = resultString;
            self.model.startLiveTime = resultString;
        }
            break;
        case 5:
        {
            cell.rightLabel.text = resultString;
            self.model.endLiveTime = resultString;
        }
            break;
        case 6:
        {
            cell.rightLabel.text = resultString;
            self.model.hotel = resultString;
        }
            break;
            
        default:
            break;
    }}

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
