//
//  BankView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/21.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "BankView.h"
#import "MyControl.h"

@interface BankView ()<UIAlertViewDelegate>
@property (strong, nonatomic) HintLabel *hintLabel;
@property (strong, nonatomic) FuctionalButton *confirmButton;
@property (strong, nonatomic) MyTextView *describeView;
@end
@implementation BankView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelView = [[LabelView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 36)];
        self.labelView.label.text = @"银行";
        [self addSubview:self.labelView];
        self.hintLabel = [[HintLabel alloc]init];
        self.confirmButton = [[FuctionalButton alloc]init];
        NSString *str = @"贷款日息10%，价廉物美，童叟无欺，请及时归还，否则，嘿嘿...";
        self.describeView = [[MyTextView alloc]initWithFrame:CGRectMake(15, 40, frame.size.width - 30, 60) andString:str];
        self.moneyLabel = [[MoneyLabel alloc]initWithFrame:CGRectMake(65, 110, 150, 20)];
        self.hintLabel.frame = CGRectMake(15, 110, 80, 20);
        self.hintLabel.text = @"当前欠款：";
        self.confirmButton.frame = CGRectMake(15, 240, self.frame.size.width - 30, 40);
        [self.confirmButton setTitle:@"全额还款" forState:UIControlStateNormal];
        [self.confirmButton addTarget:self action:@selector(payDebt) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.describeView];
        [self addSubview:self.hintLabel];
        [self addSubview:self.moneyLabel];
        [self addSubview:self.confirmButton];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}
- (void)updateView
{
    if (self.currentDebt > self.currentDeposit + self.currentCash || self.currentDebt == 0) {
        [self.confirmButton disableButton];
    }
    else
    {
        [self.confirmButton enableButton];
    }
    [self.moneyLabel setMoney:self.currentDebt];
}
- (void)payDebt
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"确定要还清所有欠款吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self.delegate payDebt];
    }
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
}
@end
