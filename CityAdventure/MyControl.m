//
//  HintLabel.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/16.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "MyControl.h"

@implementation HintLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:12];
        self.textColor = [UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1];
    }
    return self;
}
@end

@implementation MainLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = [UIColor blackColor];
        self.font = [UIFont boldSystemFontOfSize:13];
    }
    return self;
}
@end

@implementation LabelLikeButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        UIEdgeInsets inset = self.titleEdgeInsets;
        inset.left = 15;
        [self setTitleEdgeInsets:inset];
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1].CGColor;
        self.rightButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 60, 0, 40, 40)];
        [self.rightButton setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        [self addSubview:self.rightButton];
    }
    return self;
}
@end

@implementation FuctionalButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1]];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self addTarget:self action:@selector(touchButton) forControlEvents:UIControlEventTouchDown];
        [self.layer setShadowColor:[UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1].CGColor];
        [self.layer setShadowOffset:CGSizeMake(1, 1)];
        [self.layer setShadowOpacity:1];
        self.layer.cornerRadius = 3;
    }
    return self;
}

- (void)touchButton
{
    [self setBackgroundColor:[UIColor colorWithRed:0xbc/255.0 green:0x40/255.0 blue:0x49/255.0 alpha:1]];
}

- (void)disableButton
{
    self.enabled = NO;
    [self setBackgroundColor:[UIColor colorWithRed:0xbd/255.0 green:0xb9/255.0 blue:0xb9/255.0 alpha:1]];
}

- (void)enableButton
{
    self.enabled = YES;
    [self setBackgroundColor:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1]];
}
@end

@interface MoneyLabel ()
@property (strong, nonatomic) UILabel *moneyIcon;
@property (strong, nonatomic) UILabel *moneyValue;
@end
@implementation MoneyLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.moneyIcon = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 14, 20)];
        self.moneyIcon.text = @"￥";
        self.moneyIcon.font = [UIFont systemFontOfSize:12];
        self.moneyIcon.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        [self addSubview:self.moneyIcon];
        self.moneyValue = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 150, 20)];
        self.moneyValue.font = [UIFont boldSystemFontOfSize:16];
        self.moneyValue.textColor = [UIColor colorWithRed:0xFF/255.0 green:0x66/255.0 blue:0x00/255.0 alpha:1];
        [self addSubview:self.moneyValue];
    }
    return self;
}

- (void)setMoney:(float)money
{
    self.moneyValue.text = [NSString stringWithFormat:@"%.2f", money];
}
@end

@implementation MyTextView
- (instancetype)initWithFrame:(CGRect)frame andString:(NSString *)str
{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineHeightMultiple = 20.f;
        paragraphStyle.maximumLineHeight = 25.f;
        paragraphStyle.minimumLineHeight = 15.f;
        paragraphStyle.firstLineHeadIndent = 10.f;
        paragraphStyle.alignment = NSTextAlignmentJustified;
        NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:14], NSParagraphStyleAttributeName:paragraphStyle, NSForegroundColorAttributeName:[UIColor colorWithRed:76./255. green:75./255. blue:71./255. alpha:1]
                                      };
        self.attributedText = [[NSAttributedString alloc]initWithString:str attributes:attributes];
        [self setUserInteractionEnabled:NO];
    }
    return self;
}
@end