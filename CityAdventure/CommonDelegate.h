//
//  CommonDelegate.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/3.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#ifndef CityAdventure_CommonDelegate_h
#define CityAdventure_CommonDelegate_h

@protocol TradeDelegate <NSObject>
- (void)dealTrade:(NSInteger)tradeType withPrice:(NSInteger)price index:(NSInteger)index andNumber:(NSInteger)number;
@optional
- (void)confirmToTrade:(NSInteger)itemIndex withNumber:(NSInteger)number;
@end

@protocol AdventureDelegate <NSObject>
- (void)goAdventure:(NSInteger)type;
@end

@protocol FuctionDelegate <NSObject>
- (void)operateDeposit;
- (void)payDebt;
@end

#endif
