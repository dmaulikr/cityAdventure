//
//  depositView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyControl.h"
#import "CommonDelegate.h"
#import "LabelView.h"

@interface DepositView : UIView
@property (strong, nonatomic) UISegmentedControl *segControl;
@property (strong, nonatomic) UITextField *inputField;
@property (strong, nonatomic) FuctionalButton *confirmButton;
@property (assign, nonatomic) float currentCash;
@property (assign, nonatomic) float currentDeposit;
@property (assign, nonatomic) float transferMoney;
@property (strong, nonatomic) UILabel *alertLabel;
@property (strong, nonatomic) LabelView *labelView;
@property (assign, nonatomic) NSObject<FuctionDelegate> *delegate;
@end
