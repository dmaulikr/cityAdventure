//
//  HoapitalView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/21.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "HoapitalView.h"

@interface HoapitalView ()
@property (strong, nonatomic) HintLabel *hintLabel;
@property (strong, nonatomic) MyTextView *describeView;
@property (strong, nonatomic) UILabel *moneyIcon;
@end
@implementation HoapitalView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelView = [[LabelView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 36)];
        self.labelView.label.text = @"医院";
        [self addSubview:self.labelView];
        self.hintLabel = [[HintLabel alloc]init];
        self.confirmButton = [[FuctionalButton alloc]init];
        NSString *str = @"普通治疗，需要住院一天，在30天无法使用此功能。";
        self.describeView = [[MyTextView alloc]initWithFrame:CGRectMake(15, 110, self.frame.size.width - 30, 80) andString:str];
        self.moneyLabel = [[MoneyLabel alloc]initWithFrame:CGRectMake(40, 90, 200, 20)];
        self.moneyIcon = [[UILabel alloc]init];
        NSArray *arr = [NSArray arrayWithObjects:@"普通治疗", @"快速治疗", nil];
        self.segControl = [[UISegmentedControl alloc]initWithItems:arr];
        self.segControl.frame = CGRectMake(15, 50, self.frame.size.width - 30, 30);
        self.segControl.selectedSegmentIndex = 0;
        [self.segControl addTarget:self action:@selector(segSelectionChange) forControlEvents:UIControlEventValueChanged];
        self.hintLabel.frame = CGRectMake(15, 90, 50, 20);
        self.hintLabel.text = @"总价：";
        self.confirmButton.frame = CGRectMake(15, 240, self.frame.size.width - 30, 40);
        [self.confirmButton setTitle:@"确    定" forState:UIControlStateNormal];
        [self addSubview:self.segControl];
        [self addSubview:self.describeView];
        [self addSubview:self.hintLabel];
        [self addSubview:self.moneyIcon];
        [self addSubview:self.moneyLabel];
        [self addSubview:self.confirmButton];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}
- (void)updateView
{
    if (self.segControl.selectedSegmentIndex == 0) {
        self.describeView.text = @"普通治疗，需要住院一天，在30天无法使用此功能。";
    } else {
        self.describeView.text = @"无需住院一天，但费用较贵。";
    }
    if ((self.currentCash + self.currentDeposit) < self.healthMoney || self.needHealth == 0 || (self.isLastDay && self.segControl.selectedSegmentIndex == 0)) {
        [self.confirmButton disableButton];
    }
    else
    {
        [self.confirmButton enableButton];
    }
    [self.moneyLabel setMoney:self.healthMoney];
}

- (void)segSelectionChange
{
    if (self.segControl.selectedSegmentIndex == 0) {
        self.healthMoney = self.needHealth * 2000;
    } else {
        self.healthMoney = self.needHealth * 5000;
    }
    [self updateView];
}
@end
