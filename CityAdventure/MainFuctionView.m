//
//  FuctionViewController.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/3.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "MainFuctionView.h"

@interface MainFuctionView ()

@end

@implementation MainFuctionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {        
        self.backgroundView = [[UIImageView alloc]init];
        self.backgroundView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:self.backgroundView];
        self.labelView = [[LabelView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 36)];
        self.labelView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.labelView];
        NSInteger xOffset = 30;
        NSInteger yOffset = 41;
        NSInteger imageHeight = 50;
        NSInteger labelHeight = 30;
        NSInteger itemSpace = 10;
        self.fuctionButtons = [[NSMutableArray alloc]init];
        NSArray *fuctionNames = [NSArray arrayWithObjects:@"集市", @"余X宝", @"银行", @"医院", @"房产购买", @"探险", nil];
        for (int i = 0; i < 6; i++) {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(xOffset + (i % 3) * frame.size.width / 3, yOffset + (i / 3) * (imageHeight + labelHeight + itemSpace), imageHeight, imageHeight)];
            button.tag = i + 1;
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_0%d", i + 1]] forState:UIControlStateNormal];
            [self addSubview:button];
            [self.fuctionButtons addObject:button];
        }
        for (int i = 0; i < 6; i++) {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(xOffset + (i % 3) * frame.size.width / 3 - 5, 5 + imageHeight + yOffset + i / 3 * (imageHeight + labelHeight + itemSpace), imageHeight + 10, labelHeight)];
            button.tag = i + 1;
            [button setTitle:fuctionNames[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
            [self addSubview:button];
            [self.fuctionButtons addObject:button];
        }
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetRGBStrokeColor(context, 196 / 255.0, 196 / 255.0, 196 / 255.0, 1);
//    CGContextMoveToPoint(context, 0, 226);
//    CGContextAddLineToPoint(context, self.frame.size.width, 226);
//    CGContextStrokePath(context);
}

@end
