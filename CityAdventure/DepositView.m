//
//  depositView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "DepositView.h"

@interface DepositView ()<UITextFieldDelegate>
@property (strong, nonatomic) HintLabel *hintLabel;
@property (strong, nonatomic) MyTextView *describeView;
@end
@implementation DepositView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelView = [[LabelView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 36)];
        self.labelView.label.text = @"余X宝";
        [self addSubview:self.labelView];
        NSArray *arr = [NSArray arrayWithObjects:@"转入", @"转出", nil];
        self.segControl = [[UISegmentedControl alloc]initWithItems:arr];
        self.hintLabel = [[HintLabel alloc]init];
        self.inputField = [[UITextField alloc]init];
        self.confirmButton = [[FuctionalButton alloc]init];
        NSString *str = @"现金存到余X宝后每天会获得-5% ~ +10%的收益。现金不够支付时，系统自动使用余X宝中的金钱。";
        self.describeView = [[MyTextView alloc]initWithFrame:CGRectMake(15, 160, self.frame.size.width - 30, 120) andString:str];
        self.alertLabel = [[UILabel alloc]init];
        self.segControl.frame = CGRectMake(15, 50, self.frame.size.width - 30, 30);
        self.segControl.selectedSegmentIndex = 0;
        [self.segControl addTarget:self action:@selector(segSelectionChange) forControlEvents:UIControlEventValueChanged];
        self.hintLabel.frame = CGRectMake(15, 100, 50, 30);
        self.hintLabel.text = @"金额：";
        self.inputField.frame = CGRectMake(55, 100, self.frame.size.width - 70, 30);
        self.inputField.keyboardType = UIKeyboardTypeDecimalPad;
        self.inputField.borderStyle = UITextBorderStyleRoundedRect;
        self.inputField.backgroundColor = [UIColor whiteColor];
        self.inputField.clearButtonMode = UITextFieldViewModeAlways;
        [self.inputField addTarget:self action:@selector(beginEdit) forControlEvents:UIControlEventEditingDidBegin];
        [self.inputField addTarget:self action:@selector(editTransferMoney) forControlEvents:UIControlEventEditingChanged];
        self.inputField.delegate = self;
        self.alertLabel.frame = CGRectMake(55, 135, 100, 20);
        self.alertLabel.font = [UIFont systemFontOfSize:10];
        self.alertLabel.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        self.alertLabel.text = @"转入金额超限！";
        self.alertLabel.hidden = YES;
        self.confirmButton.frame = CGRectMake(15, 280, self.frame.size.width - 30, 40);
        [self.confirmButton setTitle:@"确定转入" forState:UIControlStateNormal];
        [self.confirmButton disableButton];
        [self.confirmButton addTarget:self action:@selector(confirmTrade) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.segControl];
        [self addSubview:self.hintLabel];
        [self addSubview:self.inputField];
        [self addSubview:self.confirmButton];
        [self addSubview:self.describeView];
        [self addSubview:self.alertLabel];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)confirmTrade
{
    self.transferMoney = [self.inputField.text floatValue];
    if ([self.inputField isFirstResponder]) {
        [self.inputField resignFirstResponder];
        [UIView animateWithDuration:0.4f animations:^{
            CGRect currentFrame = self.frame;
            currentFrame.origin.y += 150;
            self.frame = currentFrame;
        }];
    }
    [self.delegate operateDeposit];
    self.inputField.text = @"";
    [self.confirmButton disableButton];
}

- (void)segSelectionChange
{
    NSInteger selectIndex = self.segControl.selectedSegmentIndex;
    self.inputField.text = @"";
    if ([self.inputField isFirstResponder]) {
        [UIView animateWithDuration:0.4f animations:^{
            CGRect currentFrame = self.frame;
            currentFrame.origin.y += 150;
            self.frame = currentFrame;
        }];
        [self.inputField resignFirstResponder];
    }
    self.alertLabel.hidden = YES;
    if (selectIndex == 0) {
        [self.confirmButton setTitle:@"确定转入" forState:UIControlStateNormal];
    } else {
        [self.confirmButton setTitle:@"确定转出" forState:UIControlStateNormal];
    }
    [self.confirmButton disableButton];
}

#pragma edit
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSInteger pos = 0;
    if ([string  isEqual: @"."]) {
        if ([self.inputField.text containsString:@"."] || self.inputField.text.length == 0) {
            return NO;
        }
        pos = range.location;
    }
    if ([self.inputField.text containsString:@"."]) {
        if ([string isEqualToString:@""]) {
            return YES;
        }
        if ([self.inputField.text substringFromIndex:pos].length == 3) {
            return NO;
        }
    }
    return YES;
}

- (void)editTransferMoney
{
    float cash = [self.inputField.text floatValue];
    if (self.segControl.selectedSegmentIndex == 0) {
        if (cash > self.currentCash) {
            self.alertLabel.hidden = NO;
            self.alertLabel.text = @"转入金额超限！";
            [self.confirmButton disableButton];
        }
        else
        {
            self.alertLabel.hidden = YES;
            if (cash == 0) {
                [self.confirmButton disableButton];
            }
            else
            {
                [self.confirmButton enableButton];
            }
        }
    }
    else
    {
        if (cash > self.currentDeposit) {
            self.alertLabel.text = @"转出金额超限！";
            self.alertLabel.hidden = NO;
            [self.confirmButton disableButton];
        }
        else
        {
            self.alertLabel.hidden = YES;
            if (cash == 0) {
                [self.confirmButton disableButton];
            }
            else
            {
                [self.confirmButton enableButton];
            }
        }
    }
}
- (void)beginEdit
{
    [UIView animateWithDuration:0.4f animations:^{
        CGRect currentFrame = self.frame;
        currentFrame.origin.y -= 150;
        self.frame = currentFrame;
    }];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.inputField isFirstResponder]) {
        [self.inputField resignFirstResponder];
        [UIView animateWithDuration:0.4f animations:^{
            CGRect currentFrame = self.frame;
            currentFrame.origin.y += 150;
            self.frame = currentFrame;
        }];
    }
}
@end
