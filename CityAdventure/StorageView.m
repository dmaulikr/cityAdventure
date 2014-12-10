//
//  StorageView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/21.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "StorageView.h"

@interface StorageView ()
@property (strong, nonatomic) HintLabel *hintLabel;
@property (strong, nonatomic) MyTextView *describeView;
@property (strong, nonatomic) UILabel *alertLabel;
@property (strong, nonatomic) MoneyLabel *moneyLabel;
@end

@implementation StorageView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelView = [[LabelView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 36)];
        self.labelView.label.text = @"房产购买";
        [self addSubview:self.labelView];
        self.hintLabel = [[HintLabel alloc]init];
        self.confirmButton = [[FuctionalButton alloc]init];
        NSString *str = @"每购买一处房产， 可增加10个仓库空间，用来存放货品。随着购买次数的增加，花费的金钱也越多。房产的数量会影响游戏的结果。";
        self.describeView = [[MyTextView alloc]initWithFrame:CGRectMake(15, 40, frame.size.width - 30, 100) andString:str];
        self.moneyLabel = [[MoneyLabel alloc]initWithFrame:CGRectMake(40, 180, 250, 20)];
        self.alertLabel = [[UILabel alloc]init];
        self.alertLabel.frame = CGRectMake(15, 150, 120, 20);
        self.hintLabel.frame = CGRectMake(15, 180, 50, 20);
        self.hintLabel.text = @"费用：";
        self.confirmButton.frame = CGRectMake(15, 240, self.frame.size.width - 30, 40);
        [self.confirmButton setTitle:@"确定购买" forState:UIControlStateNormal];
        [self addSubview:self.describeView];
        [self addSubview:self.hintLabel];
        [self addSubview:self.moneyLabel];
        [self addSubview:self.confirmButton];
        [self addSubview:self.alertLabel];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)updateView
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"当前第%ld次购买", (long)self.rentCount + 1]];
    NSString *countStr = [NSString stringWithFormat:@"%ld", (long)self.rentCount];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1] range:NSMakeRange(0, 3)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1] range:NSMakeRange(3, countStr.length)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1] range:NSMakeRange(3 + countStr.length, 3)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:NSMakeRange(0, 3)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(3, countStr.length)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:NSMakeRange(3 + countStr.length, 3)];
     self.alertLabel.attributedText = str;
    if(self.rentCount < 7)
    {
        self.rentMoney = 100000 * powf(2, self.rentCount);
    }
    else
    {
        self.rentMoney = 10000000 + 5000000 * (self.rentCount - 7);
    }
    [self.moneyLabel setMoney:self.rentMoney];
    if (self.rentMoney > self.currentCash + self.currentDeposit) {
        [self.confirmButton disableButton];
    }
    else
    {
        [self.confirmButton enableButton];
    }
}
@end
