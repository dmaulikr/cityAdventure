//
//  BankView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/21.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonDelegate.h"
#import "MyControl.h"
#import "LabelView.h"
@interface BankView : UIView
@property (assign, nonatomic) float currentDebt;
@property (assign, nonatomic) float currentCash;
@property (assign, nonatomic) float currentDeposit;
@property (strong, nonatomic) MoneyLabel *moneyLabel;
@property (strong, nonatomic) LabelView *labelView;
@property (assign, nonatomic) NSObject<FuctionDelegate> *delegate;
- (void)updateView;
@end
