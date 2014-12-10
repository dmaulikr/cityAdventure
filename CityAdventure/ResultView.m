//
//  ResultView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/22.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "ResultView.h"
#import "AppDelegate.h"

@interface ResultView ()
@property (strong, nonatomic) UIImageView *backgroundImage;
@property (strong, nonatomic) MainLabel *moneyLabel;
@property (strong, nonatomic) UILabel *currentMoneyLabel;
@property (strong, nonatomic) HintLabel *historyMoneyLabel;
@property (strong, nonatomic) UILabel *userMoneyLabel;
@property (strong, nonatomic) MainLabel *houseLabel;
@property (strong, nonatomic) UILabel *currenthouseLabel;
@property (strong, nonatomic) HintLabel *historyHouseLabel;
@property (strong, nonatomic) UILabel *userHouseLabel;
@property (strong, nonatomic) MainLabel *reputationLabel;
@property (strong, nonatomic) UILabel *currentReputation;
@property (strong, nonatomic) MainLabel *reviewLabel;
@property (strong, nonatomic) MyTextView *reviewTextView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *shareLabel;
@end
@implementation ResultView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, frame.size.width, frame.size.height - 64)];
        self.backgroundImage.image = [UIImage imageNamed:@"resultbg"];
        [self addSubview:self.backgroundImage];
        NSMutableString *reviewStr = [[NSMutableString alloc]init];
        NSInteger xOffset = 60;
        NSInteger yOffset = 60;
        BOOL madeMoneyHistory = NO;
        BOOL madeHouseHistory = NO;
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        self.headView = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 64) andType:4];
        [self addSubview:self.headView];
        self.moneyLabel = [[MainLabel alloc]initWithFrame:CGRectMake(15, 15 + yOffset, 50, 20)];
        self.moneyLabel.text = @"金钱：";
        [self addSubview:self.moneyLabel];
        self.currentMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset, 15 + yOffset, 250, 20)];
        self.currentMoneyLabel.text = [NSString stringWithFormat:@"%.2f", app.userInfo.cash];
        self.currentMoneyLabel.font = [UIFont boldSystemFontOfSize:18];
        self.currentMoneyLabel.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        [self addSubview:self.currentMoneyLabel];
        if (app.userInfo.historyMoney < app.userInfo.cash) {
            app.userInfo.historyMoney = app.userInfo.cash;
            madeMoneyHistory = YES;
            app.userInfo.moneyDate = [NSDate date];
            [reviewStr insertString:@"恭喜，您的金钱创造了新的记录。\n" atIndex:0];
        }
        self.historyMoneyLabel = [[HintLabel alloc]initWithFrame:CGRectMake(xOffset, 35 + yOffset, 250, 20)];
        self.historyMoneyLabel.text = [NSString stringWithFormat:@"（历史最高：%.2f）", app.userInfo.historyMoney];
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
        
        self.houseLabel = [[MainLabel alloc]initWithFrame:CGRectMake(15, 80 + yOffset, 50, 20)];
        self.houseLabel.text = @"房产：";
        [self addSubview:self.houseLabel];
        self.currenthouseLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset, 80 + yOffset, 250, 20)];
        self.currenthouseLabel.text = [NSString stringWithFormat:@"%ld 处", (long)app.userInfo.rentStorage];
        self.currenthouseLabel.font = [UIFont boldSystemFontOfSize:18];
        self.currenthouseLabel.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        [self addSubview:self.currenthouseLabel];
        if (app.userInfo.historyStorage < app.userInfo.rentStorage) {
            app.userInfo.historyStorage = app.userInfo.rentStorage;
            madeHouseHistory = YES;
            app.userInfo.storageDate = [NSDate date];
            [reviewStr insertString:@"恭喜，您的房产创造了新的记录。\n" atIndex:reviewStr.length];
        }
        self.historyHouseLabel = [[HintLabel alloc]initWithFrame:CGRectMake(xOffset, 100 + yOffset, 250, 20)];
        self.historyHouseLabel.text = [NSString stringWithFormat:@"（历史最高：%ld处）", (long)app.userInfo.totalStorage];
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

        self.reputationLabel = [[MainLabel alloc]initWithFrame:CGRectMake(15, 145 + yOffset, 50, 20)];
        self.reputationLabel.text = @"声望：";
        [self addSubview:self.reputationLabel];
        self.currentReputation = [[UILabel alloc]initWithFrame:CGRectMake(xOffset, 145 + yOffset, 250, 20)];
        self.currentReputation.text = [NSString stringWithFormat:@"%ld点", (long)app.userInfo.reputation];
        self.currentReputation.font = [UIFont boldSystemFontOfSize:18];
        self.currentReputation.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        [self addSubview:self.currentReputation];
        
        self.reviewLabel = [[MainLabel alloc]initWithFrame:CGRectMake(15, 175 + yOffset, 50, 20)];
        self.reviewLabel.text = @"评价：";
        [self addSubview:self.reviewLabel];
        [reviewStr insertString:[NSString stringWithFormat:@"我在魔都奋斗了30天，赚到了%.2f的钱，拥有房产%ld处。", app.userInfo.cash, (long)app.userInfo.rentStorage] atIndex:reviewStr.length];
        self.reviewTextView = [[MyTextView alloc]initWithFrame:CGRectMake(xOffset - 10, 185 + yOffset, frame.size.width - 60, 150) andString:reviewStr];
        [self.reviewTextView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.reviewTextView];
        
        float totalMoney = app.userInfo.cash + app.userInfo.houseValue * 0.7;
        NSString *nameString = [self getName:totalMoney withReputation:app.userInfo.reputation];
        str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"获得了%@的称谓。", nameString]];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1] range:NSMakeRange(0, 3)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1] range:NSMakeRange(3, str.length - 4)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1] range:NSMakeRange(str.length - 4, 4)];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:13] range:NSMakeRange(0, 3)];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:NSMakeRange(3, str.length - 4)];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:13] range:NSMakeRange(str.length - 4, 4)];
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset - 10, 380, 250, 20)];
        self.nameLabel.attributedText = str;
        [self addSubview:self.nameLabel];
        self.shareLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 420, frame.size.width - 30, 20)];
        self.shareLabel.text = @"点击右上角按钮，邀请朋友来和我比比吧。";
        self.shareLabel.font = [UIFont boldSystemFontOfSize:14];
        self.shareLabel.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        [self addSubview:self.shareLabel];
        self.restartButton = [[FuctionalButton alloc]initWithFrame:CGRectMake(10, 470, frame.size.width - 20, 40)];
        [self.restartButton setTitle:@"重新开始" forState:UIControlStateNormal];
        [self addSubview:self.restartButton];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (NSString *)getName:(float)totalMoney withReputation:(NSInteger)reputation
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSString *nameString = [[NSString alloc]init];
    if (totalMoney >= 0 && totalMoney < 10000) {
        nameString = @"穷困潦倒";
        app.userInfo.achieveArray[0] = [NSNumber numberWithBool:YES];
    }
    else if(totalMoney >= 10000 && totalMoney < 100000){
        nameString = @"马马虎虎";
        app.userInfo.achieveArray[1] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 200000)
    {
        nameString = @"小有所成";
        app.userInfo.achieveArray[2] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 500000)
    {
        nameString = @"自给自足";
        app.userInfo.achieveArray[3] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 1000000)
    {
        nameString = @"财大气粗";
        app.userInfo.achieveArray[4] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 2000000)
    {
        nameString = @"百万富翁";
        app.userInfo.achieveArray[5] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 5000000)
    {
        nameString = @"不愁吃穿";
        app.userInfo.achieveArray[6] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 10000000)
    {
        nameString = @"挥金如土";
        app.userInfo.achieveArray[7] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 20000000)
    {
        nameString = @"千万富翁";
        app.userInfo.achieveArray[8] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 50000000)
    {
        nameString = @"家财万贯";
        app.userInfo.achieveArray[9] = [NSNumber numberWithBool:YES];
    }
    else if (reputation < 30)
    {
        nameString = @"为富不仁";
        app.userInfo.achieveArray[13] = [NSNumber numberWithBool:YES];
    }
    else if (reputation >= 100)
    {
        nameString = @"国家领袖";
        app.userInfo.achieveArray[14] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 100000000)
    {
        nameString = @"富甲一方";
        app.userInfo.achieveArray[10] = [NSNumber numberWithBool:YES];
    }
    else if (totalMoney < 200000000)
    {
        nameString = @"亿万富翁";
        app.userInfo.achieveArray[11] = [NSNumber numberWithBool:YES];
    }
    else
    {
        nameString = @"富可敌国";
        app.userInfo.achieveArray[12] = [NSNumber numberWithBool:YES];
    }
    return nameString;
}

@end
