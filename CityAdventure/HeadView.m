//
//  HeadView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "HeadView.h"
#import "AppDelegate.h"

@interface HeadView ()

@property (strong, nonatomic) UIButton *dayButton; //当前天数按钮
@property (strong, nonatomic) UIImageView *titleImage; //标题图片
@property (strong, nonatomic) UILabel *titleLabel; //标题
@end
@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame andType:(NSInteger)type
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:0x3d/255.0 green:0xbd/255.0 blue:0xf2/255.0 alpha:1]];
        self.backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 44)];
        [self.backButton setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateNormal];
        [self addSubview:self.backButton];
        if (type == 1) {
            self.backButton.hidden = YES;
            self.settingButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 60, 44)];
            [self.settingButton setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
            [self addSubview:self.settingButton];
            self.titleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"md_03"]];
            [self.titleImage setFrame:CGRectMake((self.frame.size.width - 130) / 2 - 10, 30, 130, 26)];
            [self addSubview:self.titleImage];
            self.dayButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 110, 30, 120, 26)];
            AppDelegate *app = [UIApplication sharedApplication].delegate;
            [self updateDayButton:app.userInfo.pastDay];
            [self addSubview:self.dayButton];
        }
        else
        {
            self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 24, self.frame.size.width, 40)];;            
            self.titleLabel.textColor = [UIColor whiteColor];
            self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            if (type == 2)
            {
                self.titleLabel.text = @"设 置";
            }
            else if(type == 3)
            {
                self.titleLabel.text = @"游戏介绍";
                [self.backButton setTitle:@"设置" forState:UIControlStateNormal];
            }
            else
            {
                if (type == 4) {
                    self.titleLabel.text = @"游戏结果";
                    self.backButton.hidden = YES;
                }
                else
                {
                    self.titleLabel.text = @"我的成就";
                    [self.backButton setTitle:@"设置" forState:UIControlStateNormal];
                }
//                self.shareButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 80, 20, 60, 44)];
//                [self.shareButton setImage:[UIImage imageNamed:@"result_03"] forState:UIControlStateNormal];
//                [self.shareButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
//                [self addSubview:self.shareButton];
            }
            [self addSubview:self.titleLabel];
        }
    }
    return self;
}

- (void)updateDayButton:(NSInteger)day
{
    NSString *dayString = [[NSString alloc]initWithString:[NSString stringWithFormat:@"（%ld/30天）", (long)day]];   
    [self.dayButton setTitle:dayString forState:UIControlStateNormal];
}
@end
