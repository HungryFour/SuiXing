//
//  IndexViewController.h
//  SuiXing
//
//  Created by yangyang on 16/3/14.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexViewController : UIViewController

//记录当前点击的indexPath
@property (strong, nonatomic) NSIndexPath *currentIndexPath;
@property (strong, nonatomic) UICollectionView *collectionView;

@end
