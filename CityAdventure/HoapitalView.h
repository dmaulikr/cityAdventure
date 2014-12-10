//
//  HoapitalView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/21.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyControl.h"
#import "LabelView.h"

@interface HoapitalView : UIView
@property (strong, nonatomic) LabelView *labelView;
@property (strong, nonatomic) UISegmentedControl *segControl;
@property (strong, nonatomic) MoneyLabel *moneyLabel;
@property (strong, nonatomic) FuctionalButton *confirmButton;
@property (assign, nonatomic) NSInteger needHealth;
@property (assign, nonatomic) NSInteger healthMoney;
@property (assign, nonatomic) float currentCash;
@property (assign, nonatomic) float currentDeposit;
@property (assign, nonatomic) BOOL isLastDay;
- (void)updateView;
@end
