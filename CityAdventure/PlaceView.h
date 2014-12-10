//
//  PlaceView.h
//  FruitTrade
//
//  Created by 陈晓洁 on 14/11/2.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyControl.h"

@interface PlaceView : UIView
@property (assign, nonatomic) NSInteger currentIndex; //0~5
@property (retain, nonatomic) NSArray *placeNames;
@property (retain, nonatomic) NSMutableArray *placeButtons;
@property (strong, nonatomic) FuctionalButton *finishButton;
- (void)goToLastDay:(BOOL)isLastDay;
@end
