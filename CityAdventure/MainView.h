//
//  MainView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadView.h"
#import "StatusView.h"
#import "MainFuctionView.h"
#import "ItemsView.h"
#import "PlaceView.h"

@interface MainView : UIView
@property (strong, nonatomic) HeadView *mainHeadView;
@property (strong, nonatomic) PlaceView *placeView;  //可以去的地方
@property (strong, nonatomic) StatusView *statusView;  // 状态视图
@property (strong, nonatomic) MainFuctionView *mainFuctionView;  //功能视图
@property (strong, nonatomic) ItemsView *itemsView; //商品视图
@end
