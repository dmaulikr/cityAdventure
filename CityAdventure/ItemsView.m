//
//  ItemsView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/22.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "ItemsView.h"

@interface ItemsView ()<TradeDelegate>

@end
@implementation ItemsView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelView = [[LabelView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 36)];
        self.labelView.label.text = @"集市";
        [self addSubview:self.labelView];
        self.itemsTableView = [[ItemsTableView alloc]initWithFrame:CGRectMake(0, 36, frame.size.width, frame.size.height - 36)];
        self.itemsTableView.tradeDelegate = self;
        [self addSubview:self.itemsTableView];
    }
    return self;
}
- (void)dealTrade:(NSInteger)tradeType withPrice:(NSInteger)price index:(NSInteger)index andNumber:(NSInteger)number
{
    [self.delegate dealTrade:tradeType withPrice:price index:index andNumber:number];
}

@end
