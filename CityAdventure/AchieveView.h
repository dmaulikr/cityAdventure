//
//  AchieveView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/23.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadView.h"
#import "MyControl.h"

@interface AchieveView : UIView
@property (strong, nonatomic) HeadView *headView;
- (void)updateView;
@end
