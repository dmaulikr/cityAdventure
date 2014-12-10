//
//  ItemsView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/22.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelView.h"
#import "ItemsTableView.h"
#import "CommonDelegate.h"
@interface ItemsView : UIView
@property (strong, nonatomic) LabelView *labelView;
@property (strong, nonatomic) ItemsTableView *itemsTableView; //商品列表
@property (assign, nonatomic) NSObject<TradeDelegate> *delegate;
@end
