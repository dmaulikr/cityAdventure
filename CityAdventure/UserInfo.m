//
//  UserInfo.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "UserInfo.h"

@interface UserInfo()

@end
@implementation UserInfo
//到第二天要改变的数据
- (void)changeDay
{
    self.power += 5;
    if (self.power > 100) {
        self.power = 100;
    }
    float depositResult = 0;
    if (self.deposit != 0) {
        depositResult = [self dealDeposit];
        self.deposit += depositResult;
        if (self.deposit < 0) {
            self.deposit = 0;
        }
    }
    if (self.debt != 0) {
        self.debt *= 1.1;
    }
}

//处理余X宝存款
- (float)dealDeposit
{
    float result = 0;
    result = arc4random() % 21 - 5.0;
    return (self.deposit * result / 100.0);
}
//重新开始游戏
- (void)restart
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"username"] != nil) {
        self.username = [defaults objectForKey:@"username"];
        self.cash = [defaults floatForKey:@"cash"];
        self.deposit = [defaults floatForKey:@"deposit"];
        self.debt = [defaults floatForKey:@"debt"];
        self.usedStorage = [defaults integerForKey:@"usedStorage"];
        self.totalStorage = [defaults integerForKey:@"totalStorage"];
        self.rentStorage = [defaults integerForKey:@"rentStorage"];
        self.health = [defaults integerForKey:@"health"];
        self.reputation = [defaults integerForKey:@"reputation"];
        self.power = [defaults integerForKey:@"power"];
        self.pastDay = [defaults integerForKey:@"pastDay"];
        self.lastUpdateDay = [defaults integerForKey:@"lastUpdateDay"];
        self.discountValue = [defaults floatForKey:@"discountValue"];
        self.placeName = [defaults objectForKey:@"placeName"];
        self.houseValue = [defaults integerForKey:@"houseValue"];
    }
    else
    {
        self.username = @"Fiona7";
        self.cash = 5000.00f;
        self.deposit = 0.00f;
        self.debt = 6000.00f;
        self.totalStorage = 100;
        self.usedStorage = 0;
        self.rentStorage = 0;
        self.health = 100;
        self.reputation = 100;
        self.power = 5;
        self.pastDay = 1;
        self.lastUpdateDay = 0;
        self.discountValue = 1.0f;
        self.placeName = @"上海火车站";
        self.houseValue = 0;
    }
}
//读取存储的数据
- (void)getData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"username"] != nil) {
        self.username = [defaults objectForKey:@"username"];
        self.cash = [defaults floatForKey:@"cash"];
        self.deposit = [defaults floatForKey:@"deposit"];
        self.debt = [defaults floatForKey:@"debt"];
        self.usedStorage = [defaults integerForKey:@"usedStorage"];
        self.totalStorage = [defaults integerForKey:@"totalStorage"];
        self.rentStorage = [defaults integerForKey:@"rentStorage"];
        self.health = [defaults integerForKey:@"health"];
        self.reputation = [defaults integerForKey:@"reputation"];
        self.power = [defaults integerForKey:@"power"];
        self.pastDay = [defaults integerForKey:@"pastDay"];
        self.lastUpdateDay = [defaults integerForKey:@"lastUpdateDay"];
        self.discountValue = [defaults floatForKey:@"discountValue"];
        self.placeName = [defaults objectForKey:@"placeName"];
        self.houseValue = [defaults integerForKey:@"houseValue"];
    }
    else
    {
        self.username = @"Fiona7";
        self.cash = 5000.00f;
        self.deposit = 0.00f;
        self.debt = 6000.00f;
        self.totalStorage = 100;
        self.usedStorage = 0;
        self.rentStorage = 0;
        self.health = 100;
        self.reputation = 100;
        self.power = 5;
        self.pastDay = 1;
        self.lastUpdateDay = 0;
        self.discountValue = 1.0f;
        self.placeName = @"上海火车站";
        self.houseValue = 0;
    }
    if ([defaults objectForKey:@"achieveArray"] != nil) {
        self.historyMoney = [defaults floatForKey:@"historyMoney"];
        self.historyStorage = [defaults integerForKey:@"historyStorage"];
        NSArray *achieveArr = [defaults objectForKey:@"achieveArray"];
        self.achieveArray = [NSMutableArray arrayWithArray:achieveArr];
        self.moneyDate = [defaults objectForKey:@"moneyDate"];
        self.storageDate = [defaults objectForKey:@"storageDate"];
    } else {
        self.achieveArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < 15; i++) {
            [self.achieveArray addObject:[NSNumber numberWithBool:NO]];
        }
        self.moneyDate = nil;
        self.storageDate = nil;
        self.historyStorage = 0;
        self.historyMoney = 0;
    }
}
//存储数据
- (void)saveData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.username forKey:@"username"];
    [defaults setFloat:self.cash forKey:@"cash"];
    [defaults setFloat:self.deposit forKey:@"deposit"];
    [defaults setFloat:self.debt forKey:@"debt"];
    [defaults setInteger:self.usedStorage forKey:@"usedStorage"];
    [defaults setInteger:self.totalStorage forKey:@"totalStorage"];
    [defaults setInteger:self.rentStorage forKey:@"rentStorage"];
    [defaults setInteger:self.health forKey:@"health"];
    [defaults setInteger:self.reputation forKey:@"reputation"];
    [defaults setInteger:self.power forKey:@"power"];
    [defaults setInteger:self.pastDay forKey:@"pastDay"];
    [defaults setInteger:self.lastUpdateDay forKey:@"lastUpdateDay"];
    [defaults setFloat:self.discountValue forKey:@"discountValue"];
    [defaults setObject:self.placeName forKey:@"placeName"];
    [defaults setFloat:self.historyMoney forKey:@"historyMoney"];
    [defaults setInteger:self.historyStorage forKey:@"historyStorage"];
    [defaults setFloat:self.houseValue forKey:@"houseValue"];
    [defaults setObject:self.achieveArray forKey:@"achieveArray"];
    [defaults setObject:self.moneyDate forKey:@"moneyDate"];
    [defaults setObject:self.storageDate forKey:@"storageDate"];
    [defaults synchronize];
}
@end
