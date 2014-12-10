//
//  SettingView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/19.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyControl.h"
#import "HeadView.h"

@interface SettingView : UIView
@property (strong, nonatomic) LabelLikeButton *introduceButton;
@property (strong, nonatomic) LabelLikeButton *achieveButton;
@property (strong, nonatomic) FuctionalButton *restartButton;
@property (strong, nonatomic) HeadView *headView;
@property (strong, nonatomic) LabelLikeButton *adviseButton;
@end
