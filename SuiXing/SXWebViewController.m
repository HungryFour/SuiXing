//
//  SXWebViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/5/4.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXWebViewController.h"

@interface SXWebViewController ()

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation SXWebViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
        
    }
    return _webView;
}

@end
