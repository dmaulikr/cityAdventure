//
//  AchieveView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/23.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "AchieveView.h"
#import "AppDelegate.h"

@interface AchieveView ()
@property (strong, nonatomic) UIImageView *backgroundImage;
@property (strong, nonatomic) MainLabel *moneyLabel;
@property (strong, nonatomic) UILabel *currentMoneyLabel;
@property (strong, nonatomic) HintLabel *historyMoneyLabel;
@property (strong, nonatomic) UILabel *userMoneyLabel;
@property (strong, nonatomic) MainLabel *houseLabel;
@property (strong, nonatomic) UILabel *currenthouseLabel;
@property (strong, nonatomic) HintLabel *historyHouseLabel;
@property (strong, nonatomic) UILabel *userHouseLabel;
@property (strong, nonatomic) MainLabel *achieveLabel;
@property (strong, nonatomic) NSMutableArray *buttons;
@property (strong, nonatomic) NSMutableArray *labels;
@end
@implementation AchieveView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, frame.size.width, frame.size.height - 64)];
        self.backgroundImage.image = [UIImage imageNamed:@"resultbg"];
        [self addSubview:self.backgroundImage];
        NSInteger xOffset = 80;
        NSInteger yOffset = 60;
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        self.headView = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 64) andType:5];
        [self addSubview:self.headView];
        self.moneyLabel = [[MainLabel alloc]initWithFrame:CGRectMake(15, 15 + yOffset, 80, 20)];
        self.moneyLabel.text = @"金钱记录：";
        [self addSubview:self.moneyLabel];
        self.currentMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset, 15 + yOffset, 250, 20)];
        self.currentMoneyLabel.text = [NSString stringWithFormat:@"%.2f", app.userInfo.historyMoney];
        self.currentMoneyLabel.font = [UIFont boldSystemFontOfSize:18];
        self.currentMoneyLabel.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        [self addSubview:self.currentMoneyLabel];
        self.historyMoneyLabel = [[HintLabel alloc]initWithFrame:CGRectMake(xOffset, 35 + yOffset, 250, 20)];
        if (app.userInfo.moneyDate == nil) {
            self.historyMoneyLabel.text = @"（创造时间：--/--）";
        } else {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy.MM.dd"];
            [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"H"]];
            NSString * dateString = [formatter stringFromDate:app.userInfo.moneyDate];
            self.historyMoneyLabel.text = [NSString stringWithFormat:@"（创造时间：%@）", dateString];
        }
        [self addSubview:self.historyMoneyLabel];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"（玩家最高：999999999.00）"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1] range:NSMakeRange(0, 6)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1] range:NSMakeRange(6, 12)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1] range:NSMakeRange(18, 1)];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:NSMakeRange(0, 6)];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:NSMakeRange(6, 12)];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:NSMakeRange(18, 1)];
        self.userMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset, 55 + yOffset, 250, 20)];
        self.userMoneyLabel.attributedText = str;
        [self addSubview:self.userMoneyLabel];
        
        self.houseLabel = [[MainLabel alloc]initWithFrame:CGRectMake(15, 80 + yOffset, 80, 20)];
        self.houseLabel.text = @"房产记录：";
        [self addSubview:self.houseLabel];
        self.currenthouseLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset, 80 + yOffset, 250, 20)];
        self.currenthouseLabel.text = [NSString stringWithFormat:@"%ld 处", (long)app.userInfo.historyStorage];
        self.currenthouseLabel.font = [UIFont boldSystemFontOfSize:18];
        self.currenthouseLabel.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        [self addSubview:self.currenthouseLabel];
        self.historyHouseLabel = [[HintLabel alloc]initWithFrame:CGRectMake(xOffset, 100 + yOffset, 250, 20)];
        if (app.userInfo.storageDate == nil) {
            self.historyHouseLabel.text = @"（创造时间：--/--）";
        } else {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy.MM.dd"];
            [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"H"]];
            NSString * dateString = [formatter stringFromDate:app.userInfo.moneyDate];
            self.historyHouseLabel.text = [NSString stringWithFormat:@"（创造时间：%@）", dateString];
        }
        [self addSubview:self.historyHouseLabel];
        str = [[NSMutableAttributedString alloc]initWithString:@"（玩家最高：360处）"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1] range:NSMakeRange(0, 6)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1] range:NSMakeRange(6, 3)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1] range:NSMakeRange(9, 2)];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:NSMakeRange(0, 6)];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:NSMakeRange(6, 3)];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:NSMakeRange(9, 2)];
        self.userHouseLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset, 120 + yOffset, 250, 20)];
        self.userHouseLabel.attributedText = str;
        [self addSubview:self.userHouseLabel];
        
        self.achieveLabel = [[MainLabel alloc]initWithFrame:CGRectMake(15, 145 + yOffset, 50, 20)];
        self.achieveLabel.text = @"成就";
        [self addSubview:self.achieveLabel];
        
        yOffset = 220;
        self.buttons = [[NSMutableArray alloc]init];
        self.labels = [[NSMutableArray alloc]init];
        NSArray *achieveNames = [NSArray arrayWithObjects:@"穷困潦倒",@"马马虎虎", @"小有所成", @"自给自足", @"财大气粗", @"百万富翁", @"不愁吃穿", @"挥金如土", @"千万富翁", @"家财万贯", @"富甲一方", @"亿万富翁", @"富可敌国", @"为富不仁", @"国家领袖", nil];
        for (int i = 0; i < app.userInfo.achieveArray.count; i++) {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20 + i % 4 * 75, yOffset + 16 + i / 4 * 70, 70, 34)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20 + i % 4 * 75, yOffset + 52 + i / 4 * 70, 70, 20)];
            if ([app.userInfo.achieveArray[i] boolValue] == NO) {
                [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cj%dh", i + 1]] forState:UIControlStateNormal];
                label.textColor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
            } else {
                [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cj%d", i + 1]] forState:UIControlStateNormal];
                label.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
            }
            button.userInteractionEnabled = NO;
            [self addSubview:button];
            [self.buttons addObject:button];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont boldSystemFontOfSize:14];
            
            label.text = achieveNames[i];
            [self addSubview:label];
            [self.labels addObject:label];
        }
    }
    return self;
}

- (void)updateView
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    if (app.userInfo.moneyDate == nil) {
        self.historyMoneyLabel.text = @"（创造时间：--/--）";
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy.MM.dd"];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"H"]];
        NSString * dateString = [formatter stringFromDate:app.userInfo.moneyDate];
        self.historyMoneyLabel.text = [NSString stringWithFormat:@"（创造时间：%@）", dateString];
    }
    if (app.userInfo.storageDate == nil) {
        self.historyHouseLabel.text = @"（创造时间：--/--）";
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy.MM.dd"];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"H"]];
        NSString * dateString = [formatter stringFromDate:app.userInfo.moneyDate];
        self.historyHouseLabel.text = [NSString stringWithFormat:@"（创造时间：%@）", dateString];
    }
    for (int i = 0; i < self.buttons.count; i++) {
        UIButton *btn = self.buttons[i];
        if ([app.userInfo.achieveArray[i] boolValue] == NO) {
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cj%dh", i + 1]] forState:UIControlStateNormal];
        } else {
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cj%d", i + 1]] forState:UIControlStateNormal];
        }
    }
    for (int i = 0; i < self.labels.count; i++) {
        UILabel *label = self.labels[i];
        if ([app.userInfo.achieveArray[i] boolValue] == NO) {
            label.textColor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
        } else {
            label.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        }
    }
}
@end
