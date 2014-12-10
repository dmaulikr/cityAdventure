//
//  StatusViewController.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/3.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyControl.h"

@interface StatusView : UIView
@property (strong, nonatomic) MainLabel *cashLabel;
@property (strong, nonatomic) MainLabel *depositLabel;
@property (strong, nonatomic) MainLabel *debtLabel;
@property (strong, nonatomic) MainLabel *storageLabel;
@property (strong, nonatomic) UILabel *reputationLabel;
@property (strong, nonatomic) UILabel *healthLabel;
@property (strong, nonatomic) UILabel *powerLabel;
@property (strong, nonatomic) MainLabel *userNameLabel;
//更新状态栏数据
- (void)setStatusControlValue;
@end
