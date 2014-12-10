//
//  StorageView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/21.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyControl.h"
#import "LabelView.h"

@interface StorageView : UIView
@property (strong, nonatomic) LabelView *labelView;
@property (assign, nonatomic) NSInteger rentCount;
@property (assign, nonatomic) NSInteger rentMoney;
@property (assign, nonatomic) float currentCash;
@property (assign, nonatomic) float currentDeposit;
@property (strong, nonatomic) FuctionalButton *confirmButton;
- (void)updateView;
@end
