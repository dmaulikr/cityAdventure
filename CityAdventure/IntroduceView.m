//
//  IntroduceView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/19.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "IntroduceView.h"
#import "MyControl.h"
@interface IntroduceView()
@property UILabel *titleLabel;
@property MyTextView *introduceText;
@end
@implementation IntroduceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.headView = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 64) andType:3];
        [self addSubview:self.headView];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 75, 160, 30)];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
        self.titleLabel.text = @"游戏介绍";
        [self addSubview:self.titleLabel];
        NSString *str = @"\t您扮演一位从外地到魔都谋生的青年。一开始，您只有5000元钱，并且还欠银行6000元。这些贷款每天的利息高达10%。如果不及时还清，银行会叫在小混混来扁您，您可能牺牲在魔都街头。\n\t您决定在魔都各地倒卖各种物品来发财致富，不仅要还掉贷款，而且要荣登魔都富人排行榜. 您只能在魔都呆30天，每次奔走一个地方算一天。\n\t一开始，您的仓库只能存放100件物品。您会在魔都遭遇到各种事件，让您感到魔都生存之艰难。\n\t您可以把闲钱存到余X宝，给您带来一定 的收益。每天回复的体力可以让您进行一些探险，祝您好运。";
        self.introduceText = [[MyTextView alloc]initWithFrame:CGRectMake(10, 115, self.frame.size.width - 20, 420) andString:str];
        UIEdgeInsets inset = self.introduceText.textContainerInset;
        inset.left = 5;
        inset.right = 5;
        [self.introduceText setTextContainerInset:inset];
        [self.introduceText.layer setBorderColor:[UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1].CGColor];
        [self.introduceText.layer setBorderWidth:1];
        [self addSubview:self.introduceText];
    }
    return self;
}

@end
