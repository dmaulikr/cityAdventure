//
//  SellBuyView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/6.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "SellBuyView.h"


@interface SellBuyView ()
@property (strong, nonatomic) HintLabel *numberLabel;
@property (strong, nonatomic) HintLabel *priceLabel;
@end

@implementation SellBuyView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *array = [[NSArray alloc]initWithObjects:@"买入", @"卖出", nil];
        self.sellOrBuy = [[UISegmentedControl alloc]initWithItems:array];
        self.sellOrBuy.frame = CGRectMake(15, 20, 210, 30);
        self.sellOrBuy.selectedSegmentIndex = 0;
        [self.sellOrBuy addTarget:self action:@selector(changeTradeType) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.sellOrBuy];
        
        self.numberLabel = [[HintLabel alloc]initWithFrame:CGRectMake(20, 80, 40, 20)];
        self.numberLabel.text = @"数量：";
        [self addSubview:self.numberLabel];
        self.numberField = [[MainLabel alloc]initWithFrame:CGRectMake(55, 80, 30, 20)];
        [self addSubview:self.numberField];
        self.numberSlider = [[UISlider alloc]initWithFrame:CGRectMake(90, 80, 120, 20)];
        self.numberSlider.minimumValue = 0;
        [self.numberSlider addTarget:self action:@selector(changeTradeNumber) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.numberSlider];
        
        self.priceLabel = [[HintLabel alloc]initWithFrame:CGRectMake(20, 120, 40, 20)];
        self.priceLabel.text = @"总价：";
        [self addSubview:self.priceLabel];
        self.priceField = [[MoneyLabel alloc]initWithFrame:CGRectMake(45, 120, 150, 20)];
        [self addSubview:self.priceField];
        
        self.confirmButton = [[FuctionalButton alloc]initWithFrame:CGRectMake(20, 170, 200, 40)];
        [self.confirmButton setTitle:@"确    定" forState:UIControlStateNormal];
        [self.confirmButton addTarget:self action:@selector(confirmTrade) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.confirmButton];
        self.singlePrice = 0;
        self.backgroundColor = [UIColor colorWithRed:0xf4/255.0 green:0xf4/255.0 blue:0xf4/255.0 alpha:1];
        self.layer.shadowColor = [[UIColor grayColor]CGColor];
        self.layer.shadowOpacity = 0.9;
        self.layer.shadowOffset = CGSizeMake(1, 1);
    }
    return self;
}
- (void)changeTradeType
{
    if (self.sellOrBuy.selectedSegmentIndex == 0) {
        self.numberSlider.maximumValue = self.maxBuyNumber;
        self.numberSlider.value = self.maxBuyNumber;
    } else {
        self.numberSlider.maximumValue = self.maxSellNumber;
        self.numberSlider.value = self.maxSellNumber;
    }
    [self updateView];
}

- (void)updateView
{
    self.numberField.text = [NSString stringWithFormat:@"%ld", (long)self.numberSlider.value];
    [self.priceField setMoney:(long)self.numberSlider.value * self.singlePrice];
    if ((NSInteger)self.numberSlider.value == 0) {
        [self.confirmButton disableButton];
    }
    else
    {
        [self.confirmButton enableButton];
    }
}

- (void)confirmTrade
{
    [self.confirmButton setBackgroundColor:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1]];
    [self.delegate confirmToTrade:self.currentItem withNumber:(NSInteger)self.numberSlider.value];
}

- (void)changeTradeNumber
{
    [self updateView];
}
@end
