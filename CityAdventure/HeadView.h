//
//  HeadView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UIView
//1主界面，2设置，3游戏介绍
@property (assign, nonatomic) NSInteger headType;
@property (strong, nonatomic) UIButton *backButton; //返回按钮
@property (strong, nonatomic) UIButton *settingButton; //设置按钮
//@property (strong, nonatomic) UIButton *shareButton;
- (instancetype)initWithFrame:(CGRect)frame andType:(NSInteger)type;
- (void)updateDayButton:(NSInteger)day;
@end
