//
//  selectImageViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/28.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "selectImageViewController.h"
#import "UIImage+ZLPhotoLib.h"
#import "ZLPhoto.h"
#import "UIButton+WebCache.h"


@interface selectImageViewController () <ZLPhotoPickerBrowserViewControllerDelegate,UITextViewDelegate>

@property (nonatomic , strong) NSMutableArray *assets;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIView *navView;
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIButton *pushButton;
@property (strong, nonatomic) UITextView *textView;

@property (strong, nonatomic) UILabel *placeHolderLabel;


@property (strong, nonatomic) NSMutableArray *imageArray;
@end

@implementation selectImageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(0xf3f3f3);
    // 这个属性不能少
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 九宫格创建ScrollView
    [self reloadScrollView];
    //创建顶部导航栏
    [self.view addSubview:self.navView];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.scrollView];
}

- (void)reloadScrollView{
    // 先移除，后添加
    [[self.scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 加一是为了有个添加button
    NSUInteger assetCount = self.assets.count + 1;
    
    
    for (NSInteger i = 0; i < assetCount; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        btn.frame = CGRectMake(80 * i, 10, 80, 80);
        
        
        if (i == self.assets.count){
            // 最后一个Button
            [btn setImage:[UIImage ml_imageFromBundleNamed:@"iconfont-tianjia"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(photoSelectet) forControlEvents:UIControlEventTouchUpInside];
        }else{
            // 如果是本地ZLPhotoAssets就从本地取，否则从网络取
            if ([[self.assets objectAtIndex:i] isKindOfClass:[ZLPhotoAssets class]]) {
                [btn setImage:[self.assets[i] thumbImage] forState:UIControlStateNormal];
            }else if ([[self.assets objectAtIndex:i] isKindOfClass:[ZLCamera class]]){
                [btn setImage:[self.assets[i] thumbImage] forState:UIControlStateNormal];
            }else if ([[self.assets objectAtIndex:i] isKindOfClass:[NSString class]]){
                [btn sd_setImageWithURL:[NSURL URLWithString:self.assets[i]] forState:UIControlStateNormal];
            }
            btn.tag = i;

        }
        [self.scrollView addSubview:btn];
    }
    

    self.scrollView.contentSize = CGSizeMake(80 * (self.assets.count + 1), 100);
}

#pragma mark - 选择图片
- (void)photoSelectet{
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    // MaxCount, Default = 9
    pickerVc.maxCount = 9;
    // Jump AssetsVc
    pickerVc.status = PickerViewShowStatusCameraRoll;
    // Filter: PickerPhotoStatusAllVideoAndPhotos, PickerPhotoStatusVideos, PickerPhotoStatusPhotos.
    pickerVc.photoStatus = PickerPhotoStatusPhotos;
    // Recoder Select Assets
    pickerVc.selectPickers = self.assets;
    // Desc Show Photos, And Suppor Camera
    pickerVc.topShowPhotoPicker = YES;
    pickerVc.isShowCamera = YES;
    // CallBack
    pickerVc.callBack = ^(NSArray<ZLPhotoAssets *> *status){
        self.assets = status.mutableCopy;
        [self reloadScrollView];
    };
    [pickerVc showPickerVc:self];
}


- (void)backClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)pushClick{
    [SVProgressHUD showWithStatus:@"上传中"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showSuccessWithStatus:@"发布成功"];
        [self dismissViewControllerAnimated:YES completion:nil];
    });
//    NSString *sandboxPath = NSHomeDirectory();
//    NSString *documentPath = [sandboxPath stringByAppendingPathComponent:@"Documents"];
//    NSString *fileName = [documentPath stringByAppendingPathComponent:@"mytravels"];
//    
//    NSArray *array = self.
//    NSDictionary *travelDict =
//
//    NSJSONSerialization *json = [NSJSONSerialization dataWithJSONObject:<#(nonnull id)#> options:<#(NSJSONWritingOptions)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>]
//    NSLog(@"发送");
}

#pragma mark - UITextViewDelegate

-(void)textViewDidChange:(UITextView *)textView{
    if (![textView.text isEqualToString:@""]) {
        for (UIView * view in self.textView.subviews) {
            if ([view isKindOfClass:[UILabel class]]) {
                UILabel * label = (UILabel *)view;
                [label removeFromSuperview];
                label = nil;
            }
        }
    }else{
        [textView addSubview:self.placeHolderLabel];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textView resignFirstResponder];
}

#pragma mark - Property

- (UIButton *)backButton{
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    [_backButton setFrame:CGRectMake(10, 20, 50, 44)];
    _backButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    _backButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [_backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    return _backButton;
}

- (UIButton *)pushButton{
    _pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_pushButton setTitle:@"发送" forState:UIControlStateNormal];
    [_pushButton setFrame:CGRectMake(SX_SCREEN_WIDTH - 50 - 10, 20, 50, 44)];
    _pushButton.titleLabel.textAlignment = NSTextAlignmentRight;
    _pushButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [_pushButton addTarget:self action:@selector(pushClick) forControlEvents:UIControlEventTouchUpInside];
    return _pushButton;
}

- (UIView *)navView{
    if (!_navView) {
        _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, 64)];
        _navView.backgroundColor = UIColorFromRGB(0x118AD2);
        [_navView addSubview:self.backButton];
        [_navView addSubview:self.pushButton];
    }
    return _navView;
}

- (NSMutableArray *)assets{
    if (!_assets) {
        _assets = [NSMutableArray array];
    }
    return _assets;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.frame = CGRectMake(0, CGRectGetMaxY(self.textView.frame)+ 10, self.view.frame.size.width, 100);
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(10,74,SX_SCREEN_WIDTH-10*2,150)];
        _textView.delegate = self;
        [_textView becomeFirstResponder];
        _textView.font = [UIFont systemFontOfSize:15];
        _textView.textColor = UIColorFromRGB(0x666666);
        _textView.backgroundColor = [UIColor whiteColor];
        
        [_textView addSubview:self.placeHolderLabel];
        
    }
    return _textView;
}

- (UILabel *)placeHolderLabel{
    if (!_placeHolderLabel) {
        _placeHolderLabel = [[UILabel alloc ]initWithFrame:CGRectMake(10, 10 , SX_SCREEN_WIDTH, 20)];
        _placeHolderLabel.text = @"这一刻的想法...";
        _placeHolderLabel.textColor = [UIColor lightGrayColor];
    }
    return _placeHolderLabel;
}


@end
