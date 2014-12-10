//
//  SellBuyView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/6.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonDelegate.h"
#import "MyControl.h"

@interface SellBuyView : UIView
@property (strong, nonatomic) UISegmentedControl *sellOrBuy;
@property (strong, nonatomic) UISlider *numberSlider;
@property (strong, nonatomic) MainLabel *numberField;
@property (strong, nonatomic) MoneyLabel *priceField;
@property (assign, nonatomic) NSInteger singlePrice;
@property (strong, nonatomic) FuctionalButton *confirmButton;
@property (assign, nonatomic) NSInteger currentItem;
@property (assign, nonatomic) NSInteger maxBuyNumber;
@property (assign, nonatomic) NSInteger maxSellNumber;
@property (assign, nonatomic) NSObject<TradeDelegate> *delegate;
- (void)updateView;
@end
