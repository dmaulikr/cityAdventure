//
//  StatusViewController.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/3.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//固定显示还是按比例移动？

#import "StatusView.h"
#import "AppDelegate.h"

@interface StatusView ()
@property (strong, nonatomic) UIImageView *personImage;
@property (strong, nonatomic) HintLabel *cashField;
@property (strong, nonatomic) HintLabel *depositField;
@property (strong, nonatomic) HintLabel *debtField;
@property (strong, nonatomic) HintLabel *storageField;
@property (strong, nonatomic) UILabel *reputationField;
@property (strong, nonatomic) UILabel *healthField;
@property (strong, nonatomic) UILabel *powerField;
@property (strong, nonatomic) UIView *extraView; //放置健康等文本
@property (strong, nonatomic) UIImageView *backgroundView; //背景图
@end

@implementation StatusView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSInteger xPos1 = 70;
        NSInteger xPos2 = 140;
        NSInteger yPos = 0;
        NSInteger height = 30;
        NSInteger fieldLength = 70;
        NSInteger labelLength = 80;
        
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_bg"]];
        self.backgroundView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:self.backgroundView];
        
        self.personImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"head_name"]];
        self.personImage.frame = CGRectMake(10, 5, 60, 60);
        [self addSubview:self.personImage];
        
        self.userNameLabel = [[MainLabel alloc]initWithFrame:CGRectMake(10, 65, 60, 20)];
        self.userNameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.userNameLabel];
        
        self.cashField = [[HintLabel alloc]initWithFrame:CGRectMake(xPos1, yPos, fieldLength, height)];
        self.cashField.text = @"现金：";
        self.cashField.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.cashField];
        
        self.cashLabel = [[MainLabel alloc]initWithFrame:CGRectMake(xPos2, yPos, labelLength * 2, height)];
        [self addSubview:self.cashLabel];
        
        self.depositField = [[HintLabel alloc]initWithFrame:CGRectMake(xPos1, yPos + height, fieldLength, height)];
        self.depositField.text = @"余X宝：";
        self.depositField.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.depositField];
        
        self.depositLabel = [[MainLabel alloc]initWithFrame:CGRectMake(xPos2, yPos + height, labelLength * 2, height)];
        [self addSubview:self.depositLabel];
        
        self.debtField = [[HintLabel alloc]initWithFrame:CGRectMake(xPos1, yPos + height * 2, fieldLength, height)];
        self.debtField.text = @"贷款：";
        self.debtField.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.debtField];
        
        self.debtLabel = [[MainLabel alloc]initWithFrame:CGRectMake(xPos2, yPos + height * 2, labelLength, height)];
        [self addSubview:self.debtLabel];
        
        self.storageField = [[HintLabel alloc]initWithFrame:CGRectMake(xPos2 + labelLength, yPos + height * 2, fieldLength, height)];
        self.storageField.text = @"仓库：";
        [self addSubview:self.storageField];
        
        self.storageLabel = [[MainLabel alloc]initWithFrame:CGRectMake(260, yPos + height * 2, labelLength, height)];
        [self addSubview:self.storageLabel];
        
        self.extraView = [[UIView alloc]initWithFrame:CGRectMake(0, 90, frame.size.width, 30)];
        self.extraView.backgroundColor = [UIColor colorWithRed:0x33/255.0 green:0x33/255.0 blue:0x33/255.0 alpha:0.8];
        self.healthField = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, fieldLength, 20)];
        self.healthField.text = @"健康：";
        [self.extraView addSubview:self.healthField];
        self.healthLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 30, 20)];
        [self.extraView addSubview:self.healthLabel];
        self.reputationField = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width / 3 + 10, 5, fieldLength, 20)];
        self.reputationField.text = @"声望：";
        [self.extraView addSubview:self.reputationField];
        self.reputationLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width / 3 + 50, 5, 30, 20)];
        [self.extraView addSubview:self.reputationLabel];
        self.powerField = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width / 3 * 2 + 10, 5, fieldLength, 20)];
        self.powerField.text = @"体力：";
        [self.extraView addSubview:self.powerField];
        self.powerLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width / 3 * 2 + 50, 5, 30, 20)];
        [self.extraView addSubview:self.powerLabel];
        for (UIView *id in self.extraView.subviews) {
            if ([id isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)id;
                label.textColor = [UIColor whiteColor];
                [label setFont:[UIFont boldSystemFontOfSize:13]];
            }
        }
        [self addSubview:self.extraView];
    }
    return self;
}

- (void)setStatusControlValue
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    self.userNameLabel.text = app.userInfo.username;
    self.cashLabel.text = [NSString stringWithFormat:@"%.2f", app.userInfo.cash];
    self.depositLabel.text = [NSString stringWithFormat:@"%.2f", app.userInfo.deposit];
    self.debtLabel.text = [NSString stringWithFormat:@"%.2f", app.userInfo.debt];
    self.storageLabel.text = [NSString stringWithFormat:@"%ld/%ld", (long)app.userInfo.usedStorage, (long)app.userInfo.totalStorage];;
    self.healthLabel.text = [NSString stringWithFormat:@"%ld", (long)app.userInfo.health];
    self.reputationLabel.text = [NSString stringWithFormat:@"%ld", (long)app.userInfo.reputation];
    self.powerLabel.text = [NSString stringWithFormat:@"%ld", (long)app.userInfo.power];
}

@end
