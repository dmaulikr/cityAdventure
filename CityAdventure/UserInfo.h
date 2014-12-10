//
//  UserInfo.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <Foundation/Foundation.h>
//用户信息
@interface UserInfo : NSObject
//保存
@property (assign, nonatomic) NSInteger pastDay; //现在天数
@property (assign, nonatomic) NSInteger lastUpdateDay; //上次更新集市的时间
@property (assign, nonatomic) float cash; //现金
@property (assign, nonatomic) float deposit; //存款
@property (assign, nonatomic) float debt; //欠债
@property (assign, nonatomic) float historyMoney; //历史最高金钱
@property (assign, nonatomic) float houseValue; //房产市值
@property (assign, nonatomic) NSInteger historyStorage; //历史最高房产
@property (assign, nonatomic) NSInteger totalStorage; //总仓库数
@property (assign, nonatomic) NSInteger usedStorage; //使用的仓库数
@property (assign, nonatomic) NSInteger rentStorage; //购买的房产数
@property (assign, nonatomic) NSInteger health; //健康
@property (assign, nonatomic) NSInteger power; //体力
@property (assign, nonatomic) NSInteger reputation; //声望
@property (strong, nonatomic) NSDate *moneyDate; //创新金钱的时间
@property (strong, nonatomic) NSDate *storageDate; //创新房产的时间
@property (assign, nonatomic) NSString *username; //用户名
@property (assign, nonatomic) float discountValue; //打折卡
@property (assign, nonatomic) NSString *placeName; //现在所在地地名
@property (strong, nonatomic) NSMutableArray *achieveArray; //成就
//不用保存
- (void)getData;
- (void)saveData;
- (void)changeDay;
- (void)restart;
@end
