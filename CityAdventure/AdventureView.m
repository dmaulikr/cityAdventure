//
//  AdventureView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/11.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "AdventureView.h"
#import "AppDelegate.h"

@interface AdventureView()
@property (strong, nonatomic) MyTextView *adventureIntroduce;
@end
@implementation AdventureView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelView = [[LabelView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 36)];
        self.labelView.label.text = @"探险";
        [self addSubview:self.labelView];
        NSString *str = @"1、每次探险消耗5点体力。\n2、切换地点时会自动进行一次探险，不消耗体力。";
        self.adventureIntroduce = [[MyTextView alloc]initWithFrame:CGRectMake(10, 46, frame.size.width - 20, 100) andString:str];
        [self addSubview:self.adventureIntroduce];
        self.adventureButton = [[FuctionalButton alloc]initWithFrame:CGRectMake(10, 200, frame.size.width - 20, 40)];
        [self.adventureButton setTitle:@"进行探险" forState:UIControlStateNormal];
        [self addSubview:self.adventureButton];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

@end
